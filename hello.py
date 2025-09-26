from flask import Flask

app = Flask(__name__)

@app.route("/")
def index():
    return '<p>Hello, World! I am a Flask app! Visit the <a href="/about">About</a> page.</p>'

@app.route("/about")
def about():
    return '<p>This app is running on the Flask web framework. Read more at <a href="https://flask.palletsprojects.com/">Flask Documentation</a>.</p>'
