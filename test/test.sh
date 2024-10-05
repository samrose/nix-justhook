#!/bin/bash
set -e

output=$(./simple-project)
expected="Hello from simple-project!"

if [ "$output" = "$expected" ]; then
    echo "Test passed!"
    exit 0
else
    echo "Test failed!"
    echo "Expected: $expected"
    echo "Got: $output"
    exit 1
fi