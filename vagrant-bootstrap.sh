# Setting up Vagrant
# Update packages
LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php

apt-get -y update

export DEBIAN_FRONTEND='noninteractive'

# Install git
apt-get -y install git wget unzip

apt-get install -y mysql-server apache2 wget unzip git fluxbox openjdk-7-jre xvfb \
	dbus libasound2 libqt4-dbus libqt4-network libqtcore4 libqtgui4 libpython2.7 libqt4-xml libaudio2 fontconfig vim xorg rungetty gnome-terminal xterm firefox

# PHP 7
apt-get install -y php7.0 php7.0-mysql php7.0-mcrypt php7.0-curl php7.0-gd php7.0-opcache php7.0-cli libapache2-mod-php7.0 php7.0-xdebug php7.0-xml php7.0-mbstring

# Firefox 43 (Working with Selenium)
wget –-quiet http://packages.linuxmint.com/pool/import/f/firefox/firefox_43.0~linuxmint1%2bbetsy_amd64.deb

apt-get remove -y firefox

dpkg -i --force-all firefox_43.0~linuxmint1+betsy_amd64.deb

# clean up
apt-get clean

# Make sure the permissions are alright.
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys

# Install composer
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

# Copy configs
cp -f /joomla/config/000-default.conf /etc/apache2/sites-available
cp -f /joomla/config/envvars /etc/apache2
cp -f /joomla/config/php.ini /etc/php/7.0/apache2

# add joomla user
useradd -m joomla
echo joomla:joomla | chpasswd

## Allow sudo
adduser joomla sudo

# automount vbox share, we can't use auto here..
echo "" >> /etc/fstab
echo "joomla /joomla  vboxsf  noauto,rw,uid=1002,gid=1002  0 0" >> /etc/fstab

echo '#!/bin/sh -e' > /etc/rc.local
echo "mount /joomla" >> /etc/rc.local
echo "exit 0" >> /etc/rc.local

echo "vboxsf" > /etc/modules

# Aliases
echo "" >> /home/joomla/.bashrc
echo "alias runtests='cd /joomla/install && ./tests/vendor/bin/robo run:tests'" >> /home/joomla/.bashrc

# GUI part
echo "" >> /home/joomla/.bashrc
echo "" >> /home/joomla/.bashrc
echo 'if [ -z "$DISPLAY" ] && [ $(tty) == /dev/tty1  ]; then
          startx
      fi' >> /home/joomla/.bash_profile

cp -f /joomla/config/tty1.conf /etc/init/tty1.conf

# Fluxbox autostart
mkdir /home/joomla/.fluxbox

# Background
cp /joomla/config/joomla.png /usr/share/images/fluxbox/ubuntu-light.png

# Menu
cp /joomla/config/menu /home/joomla/.fluxbox/menu

chown -R joomla:joomla /home/joomla

# Get joomla testing repository
git clone --depth 1 https://github.com/joomla-projects/gsoc16_browser-automated-tests.git /joomla/install

cd /joomla/install/tests

composer install

echo "---------------------"
echo "Rebooting into your new system"
echo "Everything setup - Thank you for helping Joomla!"

# Restart into system
reboot
