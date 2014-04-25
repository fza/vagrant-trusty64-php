## Trusty64 / Parallels box with nginx/PHP5 for pre-provisioning

Uses this lightweight [Trusty64/Parallels Veewee box](https://github.com/fza/veewee-trusty64-parallels). The box will be automatically downloaded from [Vagrant Cloud](https://vagrantcloud.com/fza/trusty64). May work with other trusty64 base boxes, too (untested).

This box is meant to be used for pre-provisioning, as I like my VMs to be ready just when I need them. Waiting for provisioning to be done s***.

### Spec

* Uses shell provisioning only
* No Chef, no Puppet
* Uses [RVM](http://rvm.io/) to set up Ruby (currently 2.1.1) as default
* Installs PHP5, nginx, Mailcatcher, nullmailer, MariaDB, Redis, composer, Grunt.
* Includes some dotfiles (mainly `.bash-aliases`)
* SSL-ready

Thanks to [Ondřej Surý](https://launchpad.net/~ondrej) and [Chris Lea](https://launchpad.net/~chris-lea) for their awesome PPAs!

### PHP modules

* (defaults)
* curl
* gd
* http
* intl
* ldap
* mcrypt
* mysqlnd
* redis
* sqlite
* xdebug
* xhprof
* xmlrpc
* xsl
* (propro)
* (raphf)

### Notes

* There is no MySQL root password.
* MariaDB listens on `0.0.0.0:3306`, so you may connect from your host.
* Default webroot is `/vagrant/web`.
* Default PHP rewrite script is `app.php` ([Symfony](http://symfony.com/) style).
* Look into `files/augeas/config/php5.augconf` if you want to edit the PHP settings.

### SSL support

Create a self-signed certificate (Google is your friend). Name the files `server.crt` and `server.key`. Save them in the `files/ssl` directory. Run `vagrant up`, respectively `vagrant provision`. Done. You may use a Vagrant DNS plugin (like [landrush](https://github.com/phinze/landrush)) if you don't want to mess up your `/etc/hosts`.

### Repackaging

Please follow e.g. [this guide](http://abhishek-tiwari.com/hacking/creating-a-new-vagrant-base-box-from-an-existing-vm).

### Contribution

You're welcome! :)
