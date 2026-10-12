# DJ Dvir — אתר הורדה

דף-נחיתה סטטי להורדת DJ Dvir ל-Mac ו-Windows. זיהוי-מערכת אוטומטי, ומחובר למרכז-הרישוי:
הקישורים והגרסה נקראים חי מ-`/api/download` של ה-hub (ניתן לעדכון מכרטיס "קישורי הורדה" בממשק-הניהול),
עם נפילה-לאחור לקישורי GitHub Releases שמוגדרים ב-`index.html` (בלוק `CFG`).

## הפעלה מקומית
```bash
cd download-site && python3 -m http.server 8080   # ואז http://localhost:8080
```

## פריסה חינמית ל-Render (עם דומיין חינמי)
1. דוחפים את התיקייה הזו לריפו ב-GitHub (ראו למטה).
2. נכנסים ל-[render.com](https://render.com) → **New** → **Static Site** → מחברים את הריפו.
3. Render קורא את `render.yaml` — **בלי build, בלי עלות**.
4. מקבלים דומיין חינמי: `https://djdvir.onrender.com` (או השם שתבחרו).
   - דומיין משלכם (אופציונלי): Settings → Custom Domain.

חלופה חינמית נוספת: **GitHub Pages** (Settings → Pages → Deploy from branch → root).

## חיבור ל-hub (כשהוא בענן)
ב-`index.html`, בבלוק `CFG`, מגדירים:
```js
HUB: 'https://<your-hub>.onrender.com'
```
אז הקישורים מתעדכנים חי ממרכז-הניהול. עד אז, האתר משתמש בקישורי ה-fallback.

## קבצי ההתקנה (.dmg / .exe)
מעלים את ההתקנות ל-**GitHub Releases** של הריפו הזה, והקישורים ב-`CFG.fallback` (או ב-hub) מצביעים אליהן:
`https://github.com/<user>/dj-dvir-download/releases/latest/download/DJ-Dvir-mac.dmg`
