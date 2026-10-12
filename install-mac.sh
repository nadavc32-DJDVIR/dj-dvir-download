#!/bin/bash
# DJ Dvir - מתקין ל-Mac.
# מוריד ומתקין את DJ Dvir ישירות ל-Applications. מכיוון שההורדה נעשית דרך הטרמינל
# (לא דרך הדפדפן), הקובץ לא מקבל סימן-"הורדה" של macOS - ולכן האפליקציה נפתחת רגיל,
# בלי אזהרת-אבטחה. זו אותה דרך שבה מותקנות תוכנות כמו Homebrew.
#
# שימוש:  curl -fsSL https://djdvir.onrender.com/install-mac.sh | bash
set -e

APP="DJ Dvir"
DMG_URL="https://github.com/nadavc32-DJDVIR/dj-dvir-download/releases/latest/download/DJ-Dvir-mac.dmg"
TMP="$(mktemp -d)"
DMG="$TMP/DJ-Dvir.dmg"
MNT="$TMP/mnt"
cleanup() { hdiutil detach "$MNT" -quiet 2>/dev/null || true; rm -rf "$TMP"; }
trap cleanup EXIT

echo ""
echo "🎧  מתקין את DJ Dvir ל-Mac"
echo "⬇️   מוריד את האפליקציה..."
curl -fL --progress-bar "$DMG_URL" -o "$DMG"

echo "📦  מתקין ל-Applications..."
mkdir -p "$MNT"
hdiutil attach "$DMG" -nobrowse -quiet -mountpoint "$MNT"
rm -rf "/Applications/$APP.app"
cp -R "$MNT/$APP.app" "/Applications/"
hdiutil detach "$MNT" -quiet

# curl-downloaded files carry no quarantine; clear it anyway so a re-run never leaves a flagged copy.
xattr -dr com.apple.quarantine "/Applications/$APP.app" 2>/dev/null || true

echo "✅  הותקן בהצלחה! פותח את DJ Dvir..."
open "/Applications/$APP.app"
echo "    בפעם הבאה פשוט פתחו אותה מ-Launchpad או מתיקיית Applications."
echo ""
