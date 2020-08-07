# ref: https://cloud.google.com/run/docs/quickstarts/build-and-deploy?hl=en#python

import os

from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    target = os.environ.get('TARGET', 'World')
    return 'Hello {}! from Cloud Run.\n'.format(target)

@app.route('/<mypath>')
def show_path(mypath):
    # target = os.environ.get('TARGET', 'World')
    return 'Your Path is "/{}" from Cloud Run.\n'.format(mypath)

if __name__ == "__main__":
    app.run(
        debug=True,
        host='0.0.0.0',
        port=int(os.environ.get('PORT', 8080))
    )
