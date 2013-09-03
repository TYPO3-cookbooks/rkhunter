## v0.1.1:

* [FEATURE] Allow passwordless accounts for all system administrators
* [BUGFIX] Run rkhunter --propupd after reinstalling the package
* [BUGFIX] Whitelist md5sum of rkhunter.conf for Debian Lenny

## v0.1.0:

* Move configuration into /etc/rkhunter.conf.local
* Add a new recipe rkhunter::revert-config which is used to restore the
  original configuration file
* Add CHANGELOG.md
