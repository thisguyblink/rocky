#!/bin/bash 

mkdir ../pythonServer
cd ../pythonServer

python3 -m venv .venv
source .venv/bin/activate
pip install flask 

port=9000

cat > app.py << 'EOF'
from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello World!"

if __name__ == "__main__":
EOF

echo "    app.run(port=$port)" >> app.py

## Need to open Tmux window and run in there
## Like tmux -s pythonServer or smt like that

python3 app.py


