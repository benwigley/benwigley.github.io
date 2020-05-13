# This is the script that gets run with every jenkins deployment
#
# View jenkings at: http://jenkins.toastrooster.com:8080/


# Environment Vars
# ----------------

PRODUCTION_PATH=/var/www/benwigley.com
TMP_PATH=${PRODUCTION_PATH}-tmp
OLD_PATH=${PRODUCTION_PATH}-old



# Clean workspace
# ---------------
# Some of these commands can be commented these out temporarily to speed up builds.

#rm -rf ./node_modules


# Build project
# -------------

echo "LOG: Running Jekyll";
bundle exec jekyll build


# Deploy project
# --------------

# Check if tmp dir is clean (doesn't exist)
if [ -d ${TMP_PATH} ]
then
  echo "LOG: Cleaning 'tmp' directory";
  rm -rf ${TMP_PATH}
fi

# Check if old dir is clean (doesn't exist)
if [ -d ${OLD_PATH} ]
then
  echo "LOG: Cleaning 'old' directory";
  rm -rf ${OLD_PATH}
fi

# Copy project to a tmp location
echo "LOG: Copying project to a tmp location";
cp -r . ${TMP_PATH}


# Move old project away
echo "LOG: Moving old project away";
if [ -d ${PRODUCTION_PATH} ]
then
  mv ${PRODUCTION_PATH} ${OLD_PATH}
fi

# Switch names, instant changeover
echo "LOG: Switch folder names for an instant changeover";
mv ${TMP_PATH} ${PRODUCTION_PATH}

# Remove old project
echo "LOG: Checking for old project";
if [ -d ${OLD_PATH} ]
then
  echo "LOG: Removing old project";
  rm -rf ${OLD_PATH}
fi


# Deployment Complete. Run any axtra commands.
# --------------------------------------------

# Migrations/Crontabs etc
