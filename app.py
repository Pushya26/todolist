from flask import Flask, render_template_string
import os
from datetime import datetime
import subprocess

app = Flask(__name__)

@app.route('/htop')
def htop():
    username = os.getenv("USER")
    ist_time = datetime.utcnow().strftime('%Y-%m-%d %H:%M:%S IST')
    top_output = subprocess.getoutput("top -b -n 1| head -10")

    return f"""
    <h1>System Information</h1>
    <p><strong>Name:</strong> B C Pushya</p>
    <p><strong>Username:</strong> pushy</p>
    <p><strong>Server Time (IST):</strong> {ist_time}</p>
    <h2>Top Output:</h2>
    <pre>{top_output}</pre>
    """
    
if __name__ == '__main__':
    app.run(host='0.0.0.0',port=5000)
