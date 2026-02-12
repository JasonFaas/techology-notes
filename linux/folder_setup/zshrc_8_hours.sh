#!/bin/bash

echo "8 hours is up"

mkdir -p $HOME/Desktop/Screenshots/ && mv $HOME/Desktop/Screenshot*png $HOME/Desktop/Screenshots/

echo "brew upgrade claude-code"
brew upgrade claude-code
