# Joomla! Vagrant Testing box

This vagrant box allows you to easily run and create tests for the Joomla! CMS.

For more details see https://github.com/joomla-projects/gsoc16_browser-automated-tests

### Specs:

* Ubuntu 14.04 LTS
* Apache 2
* PHP 7 (Ondrej)
* Joomla gsoc16_browser-automated-tests repository (staging)
* MySQL Server

### Installation

Install Vagrant (available for all major operating systems) and navigate with the terminal (or cmd) to this directory.

```bash
vagrant up
```

This is, depending on your internet connection, going to take some time. It's normal for VirtualBox to show up, please don't login and wait for the installation to finish.

### Run tests

Navigate with the terminal to `cd /joomla/install` and run `tests/vendor/bin/robo run:tests`

You can also run single tests after that with:

`tests/vendor/bin/robo run:test`

### Edit tests

Just open ./joomla/install folder in your hosts local IDE like PhpStorm and start editing, the folders are linked to the vagrant virtual machine.

### Local ports

If you want to open the site with your hosts browser just navigate to http://localhost:4242

### Passwords

For the joomla user: `joomla`
Root user: `vagrant`

The joomla user is allowed to use sudo

### Folder mapping

/joomla on the vagrant machine is mapped to the ./joomla directory

### Troubleshooting

**/joomla is empty for me**
Mount it manually with `mount joomla /joomla -t vboxsf"
