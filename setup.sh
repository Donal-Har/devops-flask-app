#!/bin/bash
set -e

# Make APT non-interactive (no prompts)
export DEBIAN_FRONTEND=noninteractive

echo " Updating system..."
sudo apt update -y && sudo apt upgrade -y

echo " Installing required packages..."
sudo apt install -y nano vim python-is-python3 python3-venv python3-pip

echo "Setting up Python virtual environment..."
# Create venv if it doesn’t already exist
if [ ! -d ".my_venv" ]; then
  python3 -m venv .my_venv
fi

# Activate venv
# shellcheck disable=SC1091
source .my_venv/bin/activate

echo " Upgrading pip..."
pip install --upgrade pip

echo " Installing Flask..."
pip install flask

echo
echo "✅ Setup complete."
echo "Run the Flask app with:"
echo "  source .my_venv/bin/activate"
echo "  flask --app hello run --host=0.0.0.0"
