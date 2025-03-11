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

# Test API endpoints
curl -s -H "Authorization: token $GITHUB_TOKEN" \
     "https://api.github.com/repos/${GITHUB_USERNAME}/test_open_manus/contents"

echo "API test complete"
