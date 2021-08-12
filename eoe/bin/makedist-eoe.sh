#! /bin/sh
basename=`basename $0`

osType=`uname -s`
echo osType is ${osType}

case ${osType} in
  'Windows_NT')
    EOEROOT=g:/eoe
    ;;
  'Windows_95')
    EOEROOT=g:/eoe
    ;;
  *)
    EOEROOT=/opt/public/eoe
    ;;
esac

#
# check for args
#
case "$#"
in
    0)
        echo $basename called with no arguments
	BUILDROOT=${EOEROOT}/..
	;;
    1)
        echo $basename called with 1 argument
	BUILDROOT=$1
	;;
    2)
        echo $basename called with 1 argument
	BUILDROOT=$1
	EOEROOT=$2
	;;
    *)
        echo "Usage: $basename [ <BUILDROOT> [ <EOEROOT> ]]"
	exit 1
	;;
esac

echo BUILDROOT is ${BUILDROOT}
echo EOEROOT is ${EOEROOT}

#
# create export tree
#
rm -f ${BUILDROOT}/eoe-dist.tar
mkdir -p ${BUILDROOT}/makedist_scratch/eoe
echo Making ${BUILDROOT}/makedist_scratch export tree...
cd ${EOEROOT}
tar cf - lisp info | ( cd ${BUILDROOT}/makedist_scratch/eoe ; tar xf - )

#
# clean up export tree
#
echo Cleaning ${BUILDROOT}/makedist_scratch export tree...
echo " " Deleting unneeded directories from makedist_scratch...
find ${BUILDROOT}/makedist_scratch -type d -print | egrep -i ~\|\/SCCS\/\|\/RCS\/\|\/CVS\/\|\/OLD\/\|\/Hide\/\|\/AlmostJunk\/ | xargs -l rm -rf
echo " " Deleting ~ files from makedist_scratch...
find ${BUILDROOT}/makedist_scratch/eoe -name "*~" -print | xargs -l rm -f
echo " " Deleting hash files from makedist_scratch...
find ${BUILDROOT}/makedist_scratch/eoe -name "#*#" -print | xargs -l rm -f
#
# tar export tree
# 
echo Creating export tar archive...
cd ${BUILDROOT}/makedist_scratch
tar cf ../eoe-dist.tar eoe
cd ..
#
# delete export tree
#
echo Deleting ${BUILDROOT}/makedist_scratch export tree...
rm -rf ${BUILDROOT}/makedist_scratch
echo Done.
