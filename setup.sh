# Install Python
# ---- in case ----

#Install docker
# ---- in case ----

# -----  Add environment variables
echo '' >> "$HOME/.bashrc"
echo '### ModelWare ###' >> "$HOME/.bashrc"

# -- bin path
MW_BIN_PATH="`pwd`/bin/"
echo 'export PATH="'$MW_BIN_PATH':$PATH"'>> "$HOME/.bashrc"
# -- home Modelware
echo 'export MW_HOME="'`pwd`'"' >> "$HOME/.bashrc"
echo '### --------- ###' >> "$HOME/.bashrc"
source "$HOME/.bashrc"
exec bash

#Permission
chmod 755 $MW_BIN_PATH/*


# --- build Modelware docker image
echo "Build Modelware docker image"
mw build .
echo "Done"

# --- install gdown utility
pip install gdown

# -- install flask server
pip install flask
