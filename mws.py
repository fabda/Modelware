import flask
import random
import socket
from subprocess import Popen, PIPE, STDOUT
from flask import request
import os


app = flask.Flask(__name__)


def checker(username,token):
    if os.path.exists("./users/"+username):
        with open("./users/"+username) as fp:
            tok = fp.readline().strip()
        print(">"+tok+"<")

        if tok == token:
            return True
        else:
            print("-- "+username+": "+token+" => access not granted")
            return False
    else:
        print("-- "+ username+" : not foud into user database")

    return False

@app.route('/')
def run_docker():

    username = request.args.get("username")
    token    = request.args.get("token")

    #Check token exist
    # ?
    if not checker(username,token):
        return "0"
    print("IC")

    p = Popen("mw start "+username, shell=True, stdout=PIPE, stderr=PIPE)
    streamdata = p.communicate()[0]

    if p.returncode == 0:
        p = Popen("mw port " + username, shell=True, stdout=PIPE, stderr=PIPE)
        stdout, stderr = p.communicate()
        return stdout
    else:
        p = Popen("mw port " + username, shell=True, stdout=PIPE, stderr=PIPE)
        stdout, stderr = p.communicate()
        return stdout
    #return stdout
    return stdout

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
