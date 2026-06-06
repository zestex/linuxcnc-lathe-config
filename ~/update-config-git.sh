#!/bin/bash
echo "=== Updating Git with latest LinuxCNC config ==="

cd ~/linuxcnc-configs

git pull origin main

cp -r ~/linuxcnc/configs/my-lathe/* my-lathe/

git add my-lathe/
git commit -m "Updated my-lathe config - $(date +%Y-%m-%d)"
git push origin main

echo "✅ Config pushed to GitHub successfully!"
