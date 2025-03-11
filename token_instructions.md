# GitHub Token Setup Instructions

1. Go to GitHub Settings:
   - Click your profile picture in the top right
   - Select "Settings"

2. Access Developer Settings:
   - Scroll down to bottom of left sidebar
   - Click "Developer settings"

3. Create Personal Access Token:
   - Click "Personal access tokens"
   - Click "Tokens (classic)"
   - Click "Generate new token" > "Generate new token (classic)"

4. Configure Token:
   - Note: "Open Manus Repository Access"
   - Expiration: Set as needed
   - Select Scopes:
     - [x] `repo` (Full control of private repositories)
     OR
     - [x] `public_repo` (Access public repositories)

5. Generate and Copy Token:
   - Click "Generate token"
   - Copy the token immediately (it won't be shown again)

Once you have the new token, please provide it and I'll update our scripts to use it.