# Joomla! Vagrant Testing box

This vagrant box allows you to easily run and create tests for the Joomla! CMS.

[![ScreenShot](http://img.youtube.com/vi/Y7QSYELLEF8/0.jpg)](https://www.youtube.com/watch?v=Y7QSYELLEF8)

For more details on tests see [https://github.com/joomla-projects/gsoc16_browser-automated-tests](https://github.com/joomla-projects/gsoc16_browser-automated-tests)

### Specs:

* Ubuntu 14.04 LTS
* Fluxbox
* Apache 2
* PHP 7 (Ondrej)
* Joomla gsoc16_browser-automated-tests repository
* MySQL

### Installation

Install Vagrant (available for all major operating systems) and navigate with the terminal (or cmd) to this directory.

```
vagrant up
```

The initial setup is, depending on your internet connection, going to take some time. It's normal for VirtualBox to show up, please don't login and wait for the installation to finish.

### Run tests

Right click on the desktop to open the Fluxbox menu. Choose Joomla -> XTerm to open the Terminal.

Execute `runtests` to run all tests.

#### Manually

Navigate with the terminal to `cd /joomla/install` and run `tests/vendor/bin/robo run:tests`

You can also run a single test afterwards with:

`tests/vendor/bin/robo run:test`

### Add / edit tests

Just open `./joomla/install` directory in your hosts local IDE, like PhpStorm. The directory is mounted to the vagrant virtual machine.

### Port mapping

If you want to open the site with your hosts browser just navigate to http://localhost:4242 or http://10.42.0.2

### Passwords

For the joomla user: `joomla`

Root user: `vagrant`

The joomla can also use sudo

### Folder mapping

/joomla on the vagrant machine is mapped to the hosts ./joomla directory

### Troubleshooting

**/joomla is empty for me:**
Mount it manually with `mount joomla /joomla -t vboxsf`
