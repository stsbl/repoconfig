#!/bin/sh

. /usr/lib/stsbl/repocfg

if [ "$REPOCUSTOMERNUMBER" = "" ] || [ "$REPOPASSWORD" = "" ]; then
  REPOBASEURL="https://repository.stsbl.de/debian"
else
  REPOBASEURL="https://customer-$REPOCUSTOMERNUMBER:$REPOPASSWORD@repository.stsbl.de/debian"
fi

if [ "$REPOUPDATEMODE" = "" ]; then
  REPOUPDATEMODE=stable
fi

echo "# repository urls for iserv packages"
echo "deb $REPOBASEURL $REPOUPDATEMODE main"
echo "deb $REPOBASEURL $REPOUPDATEMODE non-free"
echo
echo "# repository urls for customized debian packages"
echo "deb $REPOBASEURL jessie-$REPOUPDATEMODE main"
echo "deb $REPOBASEURL jessie-$REPOUPDATEMODE non-free"

