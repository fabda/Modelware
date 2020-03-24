# Modelware

Requirements :
- Ubuntu 18.04 LTS
- Docker installed (sudo apt install docker.io)

Installation : 
```
cd Modelware
chmod 755 setup.sh
./setup.sh
```
User creation
```
mw-user add yourusername
```
The command return the user TOKEN

Model Repository add
```
mw-repo add url https://your/url/containing/zip/file
mw-repo update
```
Flask Server Start
```
./mws-start.sh
```
Access Modelware Flask Server to create your Modelware container:
http://your.ip.server.address:5000/user=YOURUSERNAME&token=YOURTOKEN
This will show the PORT to connect to your container

Access Modelware Container through SSH:
```
ssh mowa@YOURIPSERVERADDRESS -p YOURPORT
use password : 12345
```
Your are now connected to the Modelware container with Tensorflow + Keras + Models directly accessible






