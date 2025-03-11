from flask import Flask, render_template_string
import os
from datetime import datetime
import subprocess

app = Flask(__name__)

@app.route('/htop')
def htop():
    username = os.getlogin()
    ist_time = datetime.now().astimezone().strftime('%Y-%m-%d %H:%M:%S')
    top_output = subprocess.check_output(['top', '-b', '-n', '1']).decode('utf-8')

    html_content = f"""
    <h1>System Information</h1>
    <p><strong>Name:</strong> B C Pushya</p>
    <p><strong>Username:</strong> pushy</p>
    <p><strong>Server Time (IST):</strong> {ist_time}</p>
    <h2>Top Output:</h2>
    <pre>{top_output}</pre>
    """
    
    return render_template_string(html_content)
@app.route('/health')
def health():
    return "Server is running!"

if __name__ == '_main_':
    app.run(host='0.0.0.0',port=5000)