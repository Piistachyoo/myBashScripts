#! /bin/bash

# Generate a checksum for current date and cut it into 8 characters
echo $(date | sha256sum | cut -c -8)