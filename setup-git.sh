#!/usr/bin/env bash
#
# lithiumionbattery.info — first-time git setup
#
# Run this once from your Mac's Terminal inside the site folder.
# It initializes the repo, makes the first commit, and prints the two
# remaining commands you'll run after creating the GitHub repo.

set -e

cd "$(dirname "$0")"

echo "======================================================================"
echo "  lithiumionbattery.info — git initialization"
echo "======================================================================"
echo ""

# 1. Clean up any partial state from earlier attempts
if [ -d .git ]; then
  echo "Removing existing .git folder (starting fresh)..."
  rm -rf .git
fi

# 2. Clean macOS cruft that shouldn't be committed
find . -name ".DS_Store" -type f -delete 2>/dev/null || true

# 3. Init fresh on the 'main' branch
git init -b main > /dev/null

# 4. Set a commit identity for THIS repo only (doesn't touch your global config)
git config user.name  "Shailesh Upreti"
git config user.email "admin@c4v.us"

# 5. Stage everything respecting .gitignore
git add .

# 6. Show what's about to be committed
echo "Files to be committed:"
git status --short
echo ""

# 7. Initial commit
git commit -m "Initial visitor site: landing hub + C4V Innovation Center + Near Prime Technologies"

echo ""
echo "----------------------------------------------------------------------"
echo "  ✓ Local repo initialized with initial commit."
echo "----------------------------------------------------------------------"
echo ""
echo "NEXT STEPS"
echo ""
echo "1. Create a new PUBLIC repo on GitHub:"
echo "     https://github.com/new"
echo ""
echo "   Suggested name:  lithiumionbattery-site"
echo "   Description:     Visitor guide for C4V Innovation Center & Near Prime Technologies"
echo "   Visibility:      Public  (required for free GitHub Pages)"
echo "   DO NOT tick:     'Add a README', 'Add .gitignore', 'Choose a license'"
echo "                    (you already have those)"
echo ""
echo "2. Copy your repo URL from the 'Quick setup' page (SSH or HTTPS),"
echo "   then back in Terminal run these two commands, pasting the URL:"
echo ""
echo "     git remote add origin <PASTE-URL-HERE>"
echo "     git push -u origin main"
echo ""
echo "   Example (SSH):"
echo "     git remote add origin git@github.com:shaileshupreti/lithiumionbattery-site.git"
echo "     git push -u origin main"
echo ""
echo "3. After the push completes, in your repo on github.com go to:"
echo "     Settings → Pages"
echo "   Source:        Deploy from a branch"
echo "   Branch:        main  /  (root)"
echo "   Custom domain: www.lithiumionbattery.info"
echo ""
echo "4. At your DNS registrar for lithiumionbattery.info, add:"
echo "     CNAME  www   <your-github-username>.github.io"
echo "     A      @     185.199.108.153"
echo "     A      @     185.199.109.153"
echo "     A      @     185.199.110.153"
echo "     A      @     185.199.111.153"
echo ""
echo "   Full details and IPv6 records are in README.md."
echo ""
echo "----------------------------------------------------------------------"
