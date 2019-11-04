#!/bin/sh

. /usr/lib/iserv/stsblrepocfg

REPOHOST="repository.stsbl.de"

if [ -z "$REPOCUSTOMERNUMBER" ] || [ -z "$REPOPASSWORD" ]
then
  exit 0
fi

echo "machine $REPOHOST/debian login customer-$REPOCUSTOMERNUMBER password $REPOPASSWORD"
