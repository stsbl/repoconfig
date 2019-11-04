#!/bin/bash

. /usr/lib/iserv/stsblrepocfg
. /usr/lib/iserv/sh-functions

REPOHOST="repository.stsbl.de"

if [ -z "$REPOCUSTOMERNUMBER" ] || [ -z "$REPOPASSWORD" ]
then
  REPOBASEURL="https://$REPOHOST/debian"
else
  REPOBASEURL="https://customer-$REPOCUSTOMERNUMBER:$REPOPASSWORD@$REPOHOST/debian"
fi

REPOUPDATEMODE="$(< /etc/iserv/update)"
DEBIAN="$(get_debian_release)"

echo "# Update mode: $REPOUPDATEMODE, Debian release: $DEBIAN"
echo
echo "# repository urls for iserv packages"
echo "deb $REPOBASEURL $REPOUPDATEMODE main"
echo "deb $REPOBASEURL $REPOUPDATEMODE non-free"
echo
echo "# repository urls for customized debian packages"
echo "deb $REPOBASEURL $DEBIAN-$REPOUPDATEMODE main"
echo "deb $REPOBASEURL $DEBIAN-$REPOUPDATEMODE non-free"
echo

