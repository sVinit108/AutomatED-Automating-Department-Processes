import subprocess
from flask_cors import CORS
from flask import Flask, render_template, request
import graph_generator as gg

app = Flask(__name__)
CORS(app)

@app.route('/', methods=['POST','GET'])
def display_image():
    subprocess.run(['python', 'graph_generator.py'], check=True)
    image_path = r'static/'  
    return render_template('index.html', image_path=image_path)

@app.route('/get_act_image', methods=['POST','GET'])
def get_act_image():
    subprocess.run(['python', 'graph_generator.py', 'act_graphs'], check=True)
    image_path = r'static/'  
    return render_template('index.html', image_path=image_path)

@app.route('/get_sdp_image', methods=['POST','GET'])
def get_sdp_image():
    subprocess.run(['python', 'graph_generator.py', 'sdp_graphs'], check=True)
    image_path = r'static/'  
    return render_template('index.html', image_path=image_path)

if __name__ == '__main__':
    app.run(debug=True, use_reloader=False, port=5000)