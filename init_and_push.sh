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

# Remove any existing local git repository to start fresh
rm -rf .git

# Initialize a new git repository and create the first commit
git init
git config user.email "roo@example.com"
git config user.name "Roo"
git add .
git commit -m "Initial commit with complete codebase"
git branch -M main

# Clear any cached credentials
rm -f ~/.git-credentials
git config --global --unset credential.helper || true
git config --local credential.helper ""

# Configure the repository URL (using token in URL for authentication)
git remote remove origin || true
remote_url="https://${GITHUB_USERNAME}:${GITHUB_TOKEN}@github.com/${GITHUB_USERNAME}/test_open_manus.git"
echo "Remote URL: https://[HIDDEN_TOKEN]@github.com/${GITHUB_USERNAME}/test_open_manus.git"
git remote add origin "$remote_url"

# Push to the repository
echo "Attempting to push to repository..."
if git push --force -u origin main; then
    echo "Push successful!"
    PUSH_RESULT="Success"
else
    echo "Push failed."
    PUSH_RESULT="Failure"
fi

echo "Push Result: $PUSH_RESULT"
