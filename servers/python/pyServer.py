from flask import Flask, request

app = Flask(__name__)

def process_input(input_str):
    return input_str[::-1]

@app.route('/status', methods=['GET'])
def status():
    return 'Python Server is alive\n', 200

@app.route('/process', methods=['POST'])
def process():
    input_str = request.data.decode('utf-8')
    output = f'The input has been reversed: {process_input(input_str)}\n'
    return output, 200

if __name__ == '__main__':
    print('Python Server starting')
    app.run(host='127.0.0.1', port=9002)