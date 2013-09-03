#
# Cookbook Name:: rkhunter
# Recipe:: revert-config
#
# Copyright 2013, Michael Stucki / TYPO3 Association
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

package "rkhunter"

# Restore the original rkhunter.conf
#
# When coming from an older version of this cookbook (< 0.1.0), note
# that rkhunter.conf is still modified and should be reverted to the
# stock version.
#
# This recipe should be run once after upgrading to 0.1.0 or later.

execute "fix-rkhunter-conf" do
  cwd '/root'
  command <<-EOH
    apt-get clean
    apt-get --download-only --reinstall --quiet --yes install rkhunter
    rm /etc/rkhunter.conf
    dpkg -i --force-confmiss /var/cache/apt/archives/rkhunter_*.deb
    rkhunter --propupd
  EOH
  not_if 'md5sum /etc/rkhunter.conf | egrep "(6fca75012d0bf260b898a6ae562acf46|8ff6a91c7fca3c1bd4ead1c42ad8da01)"'
end
