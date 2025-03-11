#!/bin/bash
set -x

# This script will check if the token has the necessary permissions
echo "Enter your new GitHub token:"
read -s TOKEN

echo -e "\nChecking token permissions..."
curl -s -I -H "Authorization: token ${TOKEN}" \
     -H "Accept: application/vnd.github.v3+json" \
     https://api.github.com/user

echo -e "\nTrying to create repository..."
curl -s -H "Authorization: token ${TOKEN}" \
     -H "Accept: application/vnd.github.v3+json" \
     -H "Content-Type: application/json" \
     -d '{"name":"test_open_manus","private":false,"auto_init":true}' \
     https://api.github.com/user/repos

echo -e "\n\nPlease follow these steps:"
echo "1. Create your new token using the instructions in token_instructions.md"
echo "2. Run this script with: ./verify_token.sh"
echo "3. Enter your new token when prompted"
echo "4. The script will verify if the token has the correct permissions"