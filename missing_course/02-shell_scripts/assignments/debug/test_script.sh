#!/usr/bin/env bash

# Define the script to run
script_name="./bug.sh"  # Change this if the script has a different name

# Output and error files
stdout_file="stdout.log"
stderr_file="stderr.log"

# Clear previous logs
> "$stdout_file"
> "$stderr_file"

# Counter for runs
count=0

# Run the script in a loop until it fails
while true; do
    ((++count))
    echo "Running script $count times..."
    
    # Run the script, capturing stdout and stderr
    "$script_name" >> "$stdout_file" 2>> "$stderr_file"
    
    # Check exit status
    if [[ $? -ne 0 ]]; then
        echo "Script failed."
        break
    fi
done

# Print results
echo "Script failed after $count runs."
echo "=== Standard Output ==="
cat "$stdout_file"
echo "=== Standard Error ==="
cat "$stderr_file"