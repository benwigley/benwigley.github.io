Project Documentation
=====================

My personal site. Includes demos and examples of the various projects and plugins I have put together.


## Setup dev environment

### Install Jekyll

	sudo gem install jekyll

To get "jekyll --server --auto" to work properly, roll back the version of directory_watcher

	sudo gem uninstall directory_watcher && sudo gem install directory_watcher -v 1.4.1

### Run the server

	jekyll

View the server on http://localhost:4000


## Production Environment

I installed ruby by following this article:
https://computingforgeeks.com/how-to-install-jekyll-on-ubuntu-18-04/

Install jeykll

	sudo apt-get update
	sudo apt-get install jekyll

Clone the git repo and run Jekyll Build

	git clone https://github.com/benwigley/benwigley.com
	jekyll build

The static site files will be located in the `_site` folder.
Now copy the `benwigley.com.conf` file to apache2's `sites-enabled` folder, and run:

	a2ensite benwigley.com.conf
