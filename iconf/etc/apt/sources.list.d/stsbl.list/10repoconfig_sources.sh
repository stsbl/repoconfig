#!/bin/bash

REPOHOST="repository.stsbl.de"
REPOBASEURL="https://$REPOHOST/debian"

REPOUPDATEMODE="$(< /etc/iserv/update)"
DEBIAN="$(iservdebianrelease)"

echo "# Update mode: $REPOUPDATEMODE, Debian release: $DEBIAN"
echo
echo "# repository urls for IServ packages"
echo "deb $REPOBASEURL $REPOUPDATEMODE main"
echo "deb $REPOBASEURL $REPOUPDATEMODE non-free"
echo
echo "# repository urls for customized Debian packages"
echo "deb $REPOBASEURL $DEBIAN-$REPOUPDATEMODE main"
echo "deb $REPOBASEURL $DEBIAN-$REPOUPDATEMODE non-free"
echo

