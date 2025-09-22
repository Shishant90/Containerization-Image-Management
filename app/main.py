from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def profile():
    return jsonify({
        "name": "Shishant Kanojia",
        "email": "<email>",
        "country": "India",
        "state": "New Delhi",
        "about": "Software Developer passionate about containerization and cloud technologies",
        "status": "running"
    })

@app.route('/health')
def health():
    return jsonify({"status": "healthy"})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)