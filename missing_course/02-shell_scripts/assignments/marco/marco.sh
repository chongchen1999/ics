#!/bin/bash

# Function to save the current working directory
marco() {
    echo "$(pwd)"
    export MARCO_DIR="$(pwd)"
}

# Function to change back to the saved directory
polo() {
    if [ -n "$MARCO_DIR" ]; then
        cd "$MARCO_DIR" || echo "Failed to change directory to $MARCO_DIR"
        echo "$(pwd)"
        echo "This is some info about the directory." > info.txt
    else
        echo "MARCO_DIR is not set. Run marco first."
    fi
}
