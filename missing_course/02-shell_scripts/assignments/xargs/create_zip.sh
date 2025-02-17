#!/bin/bash

# Step 1: Create some sample files
echo "Creating sample files..."
touch file1.txt file2.txt file3.txt file4.txt

# Step 2: Find all .txt files and create a zip archive
echo "Creating zip archive..."
find . -name "*.txt" | xargs zip archive.zip

# Step 3: Verify the contents of the zip file
echo "Verifying the contents of the zip file..."
unzip -l archive.zip

# Clean up (optional)
echo "Cleaning up sample files..."
rm file1.txt file2.txt file3.txt file4.txt

echo "Done!"
