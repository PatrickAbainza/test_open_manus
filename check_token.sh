#!/bin/bash
set -xe

# Check for environment variables
if [ -z "$GITHUB_TOKEN" ]; then
    echo "Error: GITHUB_TOKEN environment variable is not set"
    exit 1
fi

# Make API call to check token validity
curl -s -H "Authorization: token $GITHUB_TOKEN" \
     https://api.github.com/user

echo "Token check complete"
