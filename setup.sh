#!/bin/bash
set -e
export DEBIAN_FRONTEND=noninteractive

echo " Updating system..."
sudo apt update -y && sudo apt upgrade -y

echo " Installing required packages..."
sudo apt install -y nano vim python-is-python3 python3-venv python3-pip

echo " Setting up Python virtual environment..."
if [ ! -d "/home/vagrant/.my_venv" ]; then
  python3 -m venv /home/vagrant/.my_venv
fi

# Activate venv
source /home/vagrant/.my_venv/bin/activate

echo " Upgrading pip..."
pip install --upgrade pip

echo " Installing Flask..."
pip install flask

# Copy hello.py into VM home if not already there
if [ -f /vagrant/hello.py ]; then
  cp /vagrant/hello.py /home/vagrant/
fi

# Kill any existing Flask process (avoid duplicates)
pkill -f "flask --app" || true

echo " Starting Flask app..."
nohup flask --app /home/vagrant/hello run --host=0.0.0.0 --port=5000 > /home/vagrant/flask.log 2>&1 &

echo "✅ Setup complete. Flask running at http://localhost:5000"
