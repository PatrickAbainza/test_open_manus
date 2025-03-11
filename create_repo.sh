#!/bin/bash
set -xe

# Check for environment variables
if [ -z "$GITHUB_TOKEN" ]; then
    echo "Error: GITHUB_TOKEN environment variable is not set"
    exit 1
fi

if [ -z "$GITHUB_USERNAME" ]; then
    echo "Error: GITHUB_USERNAME environment variable is not set"
    exit 1
fi

# Create repository via GitHub API
curl -s -X POST \
     -H "Authorization: token $GITHUB_TOKEN" \
     -d '{"name":"test_open_manus","private":false}' \
     https://api.github.com/user/repos

echo "Repository creation complete"
