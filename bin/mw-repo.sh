# Gestion du Modelware repository manager


# Get Variables from Modelware configuration file
. $MW_HOME/conf/mw.conf

# Argument checker
if [ $# -eq 0 ]
  then
    echo "Nothing to do ? check help : mw-repo --help "
    exit 1
fi


# Helper
if [ $1 = '-h' ] || [ $1 = '--help' ]
  then

  echo " "
  echo " "
  echo "Usage : `basename $0` [create] [update]"
  echo " "
  exit 0
fi
