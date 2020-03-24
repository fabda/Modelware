# Install Python
echo " -- Checking: Python 3 & pip3"
# ---- in case ----
dpkg-query -l python3
if [ $? =  1 ]
  then
    sudo apt-get install python3
    sudo apt-get install python3-pip
fi

dpkg-query -l python3-pip3
if [ $? = 1 ]
  then
    sudo apt-get install python3-pip
fi
echo " ---- OK installed !"

#Install docker
# ---- in case ----
echo " -- Setting up environment variables"
# -----  Add environment variables
echo '' >> "$HOME/.bashrc"
echo '### ModelWare ###' >> "$HOME/.bashrc"

# -- bin path
echo " -- Setting up PATH"
MW_BIN_PATH="`pwd`/bin/"
echo 'export PATH="'$MW_BIN_PATH':$PATH"'>> "$HOME/.bashrc"
# -- home Modelware
echo 'export MW_HOME="'`pwd`'"' >> "$HOME/.bashrc"
echo '### --------- ###' >> "$HOME/.bashrc"
source "$HOME/.bashrc"
#exec bash
echo " -- Setting up permissions"
#Permission
echo "Permissions"
chmod 755 $MW_BIN_PATH/*

#User creations
echo "-- Setting up user dir"
mkdir $MW_HOME/users

# --- build Modelware docker image
echo "-- Building Modelware docker image"
mw build .
echo "Done"

echo "-- Setting up supplemental tools"
# --- install gdown utility
pip3 install gdown

# -- install flask server
pip3 install flask

echo " "
echo " "
echo "-- Modelware is successfully installed !"
echo " "
