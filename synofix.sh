#!/bin/ash
# Script to tweak a Synology DS412+

# Disable File Indexing Daemon
/usr/syno/etc/rc.d/S66fileindex.sh stop
chmod -x /usr/syno/etc/rc.d/S66fileindex.sh

# Disable indexing and thumbnail Daemons.
for i in synoindexd synomkthumbd synoflvd;do
  /sbin/initctl stop ${i}
  sed -ie 's/"auto_start":"yes"/"auto_start":"no"/' ${i}
done

# Fix Hibernation issues with packages.
sed -ie 's/minutes=10/minutes=60/' /usr/local/sickbeard/share/SickBeard/sickbeard/__init__.py
