#!/usr/bin/bash

echo 'false || echo "Oops, fail"'
false || echo "Oops, fail"

echo 'true || echo "Will not be printed"'
true || echo "Will not be printed"

echo 'true && echo "Things went well"'
true && echo "Things went well"

echo 'false && echo "Will not be printed"'
false && echo "Will not be printed"

echo 'true ; echo "This will always run"'
true ; echo "This will always run"

echo 'false ; echo "This will always run"'
false ; echo "This will always run"

echo 'false && echo "Not printed" || echo "This runs instead"'
false && echo "Not printed" || echo "This runs instead"
