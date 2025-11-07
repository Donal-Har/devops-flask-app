from flask import Flask
import redis, json, time

app = Flask(__name__)

r = redis.Redis(host='the-redis-server', port=6379, decode_responses=True)

@app.route("/")
def home():
    data = r.get('home')
    if data is not None:
        data = json.loads(data)
        if time.time() - data['time'] <= 600:
            return data['html']
    html = "<h1>Home</h1><p>Welcome!</p>"
    r.set('home', json.dumps({'html': html, 'time': time.time()}))
    return html

@app.route("/about")
def about():
    data = r.get('about')
    if data is not None:
        data = json.loads(data)
        if time.time() - data['time'] <= 600:
            return data['html']
    html = "<h1>About</h1><p>About page content.</p>"
    r.set('about', json.dumps({'html': html, 'time': time.time()}))
    return html

