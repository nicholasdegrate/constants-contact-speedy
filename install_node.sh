#!/bin/bash

check_installation() {
  if command -v node &> /dev/null && command -v npm &> /dev/null && command -v pnpm &> /dev/null; then
    echo "Node.js, npm, and pnpm are already installed."
    exit 0
  fi
}

if ! command -v brew &> /dev/null; then
  echo "Homebrew is not installed. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Updating Homebrew..."
brew update

check_installation

echo "Installing Node.js version 18..."
brew install node@18

brew link --force --overwrite node@18

echo "Verifying Node.js installation..."
node -v
npm -v

echo "Installing pnpm..."
npm install -g pnpm

echo "Verifying pnpm installation..."
pnpm -v

echo "Node.js, npm, and pnpm have been installed successfully."
