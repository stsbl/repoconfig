#!/bin/sh

. /usr/lib/iserv/stsblrepocfg

REPOHOST="repository.stsbl.de"

if [ -z "$REPOCUSTOMERNUMBER" ] || [ -z "$REPOPASSWORD" ]
then
  REPOBASEURL="https://$REPOHOST/debian"
else
  REPOBASEURL="https://customer-$REPOCUSTOMERNUMBER:$REPOPASSWORD@$REPOHOST/debian"
fi

if [ -z "$REPOUPDATEMODE" ]
then
  REPOUPDATEMODE=stable
fi

echo "# repository urls for iserv packages"
echo "deb $REPOBASEURL $REPOUPDATEMODE main"
echo "deb $REPOBASEURL $REPOUPDATEMODE non-free"
echo
echo "# repository urls for customized debian packages"
echo "deb $REPOBASEURL jessie-$REPOUPDATEMODE main"
echo "deb $REPOBASEURL jessie-$REPOUPDATEMODE non-free"

