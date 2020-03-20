import flask
import random
import socket
from subprocess import Popen, PIPE, STDOUT
from flask import request



app = flask.Flask(__name__)

@app.route('/')
def run_docker():

    token = request.args.get("token")

    #Check token exist
    # ?

    p = Popen("mw start", shell=True, stdout=PIPE, stderr=PIPE)
    streamdata = p.communicate()[0]

    if p.returncode == 0:
        p = Popen("mw port", shell=True, stdout=PIPE, stderr=PIPE)
        stdout, stderr = p.communicate()
        return stdout
    else:
        p = Popen("mw port", shell=True, stdout=PIPE, stderr=PIPE)
        stdout, stderr = p.communicate()
        return stdout
    #return stdout
    return "ERROR"

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
