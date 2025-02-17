#!/bin/bash

# Demonstrating wildcard usage
echo "Creating test files..."
touch foo foo1 foo2 foo10 bar
ls

echo "Using rm with wildcards..."
mkdir test_files && mv foo* test_files/
ls test_files

# Demonstrating curly brace expansion
echo "Using curly braces for batch operations..."
touch image.png image.jpg
echo "Before convert command:"
ls image.*
echo "Convert command: convert image.{png,jpg}"

# Demonstrating curly brace expansion for multiple files
mkdir project && touch project/foo.sh project/bar.sh project/baz.sh
cp project/{foo,bar,baz}.sh /tmp/
echo "Copied files:"
ls /tmp/{foo,bar,baz}.sh

# Combining globbing techniques
echo "Moving all .sh and .py files..."
touch script.py script.sh
mkdir scripts && mv *{.py,.sh} scripts/
ls scripts

# Demonstrating brace expansion with sequences
mkdir foo bar
touch {foo,bar}/{a..h}
touch foo/x bar/y
echo "Contents of foo and bar directories:"
ls foo bar

echo "Comparing files in foo and bar using diff..."
diff <(ls foo) <(ls bar)

# Writing a Python script with a shebang
cat <<EOF > reverse_args.py
#!/usr/bin/env python3
import sys
for arg in reversed(sys.argv[1:]):
    print(arg)
EOF
chmod +x reverse_args.py

# Running the Python script with arguments
echo "Running Python script with arguments..."
./reverse_args.py one two three

# Demonstrating function vs script differences
echo "Defining a function..."
change_dir() {
    cd /tmp
    echo "Changed directory to /tmp"
}

echo "Executing function..."
pwd
change_dir
pwd

echo "Executing a script that tries to change directory..."
echo -e "#!/bin/bash\ncd /tmp\necho 'Changed directory to /tmp'" > change_dir_script.sh
chmod +x change_dir_script.sh
./change_dir_script.sh
pwd  # Still in original directory because the script ran in a subshell
