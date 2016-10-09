#!/bin/sh

. /usr/lib/stsbl/repocfg

if [ $(hostname) = "rpt.stsbl.test" ]
then
  REPOHOST="snapshot.repository.stsbl.de"
else
  REPOHOST="repository.stsbl.de"
fi

if [ "$REPOCUSTOMERNUMBER" = "" ] || [ "$REPOPASSWORD" = "" ]
then
  REPOBASEURL="https://$REPOHOST/debian"
else
  REPOBASEURL="https://customer-$REPOCUSTOMERNUMBER:$REPOPASSWORD@$REPOHOST/debian"
fi

if [ "$REPOUPDATEMODE" = "" ]
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
