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

if [ $1 = "add" ]
  then
    if test -f $MW_HOME/repo/repo.list
      then
        :
    else
      :> $MW_HOME/repo/repo.list
    fi

    if [ `cat "$MW_HOME/repo/repo.list" | grep $3 | wc -l` -eq 0 ]
      then
        echo $2 $3 $4 >> "$MW_HOME/repo/repo.list"
        echo "$3 model has been successfully added to Modelware repo ! "
        exit 1
    else
      echo "$3 model is already present into the repository !"
      exit 0
    fi
fi

#Download only models which are present into repo.list and not present locally into model folder.
if [ $1 = "update" ]
  then
    echo "Updating models from repo.list ..."


    #for item in `cat $MW_HOME/repo/repo.list`
    while read item
      do
        modeltype=`echo $item | cut -d ' ' -f 1`
        modelname=`echo $item | cut -d ' ' -f 2`
        modelurl=`echo $item | cut -d ' ' -f 3`

        echo " "
        echo "[ $modelname ]"

        if test -d $MW_HOME/models/$modelname
          then
            echo "     -> Found : nothing to do."
        else
          echo "     -> Installation ..."

          # From Google Drive (with two type of URLs possible)
          if [ $modeltype = "drive" ]
            then
              echo "     -> Downloading model from Google Drive URL : $modelurl:"
              #Type 1 URL
              ID=`echo $modelurl | cut -d '/' -f 6`
              if [ -z "$ID" ]
                then
                  #Type 2 URL
                  ID=`echo "$modelurl" | cut -d '=' -f 2`
              fi
              gdown -O model.zip https://drive.google.com/uc?id=$ID
              unzip -o model.zip -d $MW_HOME/models/
              rm -f model.zip
          fi


          # From URL
          if [ $modeltype = "url" ]
            then
              echo "     -> Downloading model from URL : $modelurl"
              wget -O model.zip $modelurl
              unzip -o model.zip -d $MW_HOME/models/
              rm -f model.zip
          fi

        fi

      done < "$MW_HOME/repo/repo.list"
  exit 1
fi
