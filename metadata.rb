maintainer       "TYPO3 Association"
maintainer_email "steffen.gebert@typo3.org"
license          "MIT"
description      "Installs/Configures rkhunter"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.2.0"

recipe "rkhunter::default", "Install rkhunter"
recipe "rkhunter::revert-config", "Revert the original rkhunter.conf file"
