from flask import Flask, jsonify
import datetime
import socket


app = Flask(__name__)


@app.route('/api/v1/info')
def details():
    return jsonify ({ 
        'time': datetime.datetime.now().strftime("%A, %B %d, %Y %H:%M:%S"),
        'hostname': socket.gethostname()
        'message':'T.L You will be mine - ASAP K.A'})

@app.route('/api/v1/Healthz')
def health():
    return jsonify ({ 'status': 'up'}),200
if __name__ == '__main__':
    app.run("0.0.0.0")