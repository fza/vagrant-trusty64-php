## Vagrant PHP5/nginx web stack

Uses a lightweight [trusty64/Parallels box](https://github.com/fza/veewee-trusty64-parallels). The box will be automatically downloaded from [Vagrant Cloud](https://vagrantcloud.com/fza/trusty64). May work with other trusty64 base boxes, too (untested).

This box is meant to be used for pre-provisioning, as I like my VMs to be ready just when I need them. Waiting for the provisioning process to be done s***.

### Spec

* Uses shell provisioning only
* No Chef, no Puppet
* Uses [RVM](http://rvm.io/) to set up Ruby (currently 2.1.3) as default
* Installs PHP5.6, nginx, Mailcatcher, nullmailer, MariaDB, Redis, composer, Grunt.
* Includes some dotfiles (mainly `.bash-aliases`)
* SSL-ready

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

### Xdebug

Xdebug is per default configured to connect back on port 9000.

### Repackaging

The `vagrant package` command is not able to handle parallels provided boxes yet (as with v1.5.4). My trick is to use [Veewee](https://github.com/jedi4ever/veewee), adding a fake box definition, renaming the provisioned VM within Parallels the same as the fake definition and running `veewee parallels export <put-definition-name-here>` from Veewee's main directory. This will produce a `.box` file, which can then be imported in Vagrant: `vagrant box add --name <desired-box-name> <put-definition-name-here>.box`

### Roadmap

* Add simple configuration file using yaml or something
* Make it possible to configure everything in the Vagrantfile
* Add almost similar feature set as PuPHPet has, but drastically more stable.

### Thanks

Thanks to [Ondřej Surý](https://launchpad.net/~ondrej) and [Chris Lea](https://launchpad.net/~chris-lea) for their awesome PPAs!

### Contribution

You're welcome! :)
