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
