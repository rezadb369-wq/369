# 📱 راهنمای Termius — فقط همین نسخه (v316) روی VPS بماند

**هدف:** روی VPS فقط این نسخه سایت («دست‌گیر» v316) بالا بماند، توکن ربات‌ها (بله/سروش) و کلیدهای هوش مصنوعی دست‌نخورده بمانند، و به هیچ‌یک از برنامه‌های دیگری که قبلاً روی سرور نصب کرده‌ای دست نخورَد.

**چرا این راه ایمن است:**
- نصب با اسکریپت رسمی `deploy/update.sh` خودِ همین بسته انجام می‌شود؛ این اسکریپت **فقط** پوشه `/opt/dastgir` و سرویس `bazarche` را عوض می‌کند — نه nginx، نه فایروال، نه هیچ سرویس دیگری.
- کد نسخه‌های قبلی با `rsync --delete` **کامل حذف** می‌شود (پس فقط v316 می‌ماند) ولی پوشه `data/` (دیتابیس، آپلودها، چت‌ها) و فایل رازها `/etc/dastgir-secrets.env` **دست‌نخورده** می‌مانند.
- در بسته v316 فایل `deploy/brain.env` وجود ندارد، بنابراین `apply-brain.sh` اجرا نمی‌شود و **خط‌های `AI_*` (کلیدهای هوش مصنوعی) سرور عوض نمی‌شوند** — دقیقاً همان چیزی که می‌خواهی.
- توکن‌های `BALE_*` و `SOROUSH_*` هم هرگز توسط به‌روزرسانی لمس نمی‌شوند.

---

## گام ۰ — اتصال با Termius

1. Termius → **Hosts** → **+ New Host**
2. Address: `130.185.78.237` (سرور خودت) · Username و رمز/کلید خودت · ذخیره و **Connect**
3. همه دستورهای این راهنما را **کپی** کن و در ترمینال **لمس طولانی → Paste** کن. بعد از هر بلوک، خروجی را با «انتظار» مقایسه کن، بعد برو سراغ بلوک بعدی.

---

## گام ۱ — اول از همه: پشتیبان رازها و بررسی اولیه

```bash
sudo -i
```

```bash
install -d -m 700 /var/backups/dastgir
cp -a /etc/dastgir-secrets.env "/var/backups/dastgir/secrets-env-$(date +%F-%H%M).bak"
chmod 600 /var/backups/dastgir/secrets-env-*.bak
```

شمارش رازها (فقط **عدد** چاپ می‌شود، هیچ مقداری نمایش داده نمی‌شود):

```bash
grep -c '^BALE_BOT_TOKEN='    /etc/dastgir-secrets.env   # انتظار: 1
grep -c '^SOROUSH_BOT_TOKEN=' /etc/dastgir-secrets.env   # انتظار: 1
grep -c '^AI_'                /etc/dastgir-secrets.env   # انتظار: 9 (یا هرچه الان هست — همین عدد بعد از نصب باید تکرار شود)
```

نسخه فعلی روی سرور و وضعیت سرویس:

```bash
cat /opt/dastgir/VERSION.txt 2>/dev/null || echo "نصب فعلی نیست"
systemctl is-active bazarche 2>/dev/null || echo "سرویس فعال نیست"
```

پورت ۸۰۸۰ باید مال همین سایت باشد؛ اگر برنامه دیگری روی آن است، اول همان را جابه‌جا کن (این بررسی فقط نگاه است):

```bash
ss -ltnp | grep :8080 || echo "8080 آزاد است"
```

---

## گام ۲ — دانلود v316 و سلامت‌سنجی فایل

```bash
curl -fL --retry 4 --retry-all-errors \
  https://github.com/rezadb369-wq/369/raw/main/dastgir-v316.zip \
  -o /tmp/dastgir-v316.zip
```

تطبیق اثر انگشت SHA-256 (باید بنویسد `OK`):

```bash
echo '796edcd52fcdf235596b55e5e8428c1d270613cebaa5eda67149933981824ec9  /tmp/dastgir-v316.zip' | sha256sum -c -
```

ابزارهای لازم و تست زیپ:

```bash
apt-get update -qq && apt-get install -y -qq unzip rsync curl ca-certificates
unzip -t /tmp/dastgir-v316.zip >/dev/null && echo "zip OK"
```

> **اگر دانلود از گیت‌هاب روی سرور نشد:** در Termius همان اتصال را با **SFTP** باز کن (گزینه SFTP در Termius)، وارد پوشه `/tmp` شو و فایل `dastgir-v316.zip` را از گوشی/کامپیوترت بکش و رها کن. بعد ادامه بده.

---

## گام ۳ — نصب رسمی و اتمیک همین نسخه

### حالت الف) سایت از قبل روی سرور هست (مسیر اصلی)

```bash
bash /opt/dastgir/deploy/update.sh /tmp/dastgir-v316.zip
```

خروجی درست باید این‌ها باشد:
- یک خط «کرون کدگارد نصب شد.» (فقط بار اول)
- شاید خط «گیت فعال‌سازی ربات بله (شماره+رمز) نصب شد.» — فقط اگر هش گیت در بسته عوض شده باشد
- و در پایان: **«نسخه 316 با موفقیت نصب شد.»**

این اسکریپت خودش: از دیتابیس پشتیبان سازگار می‌گیرد → سرویس را می‌بندد → کد قدیمی را کامل حذف و کد v316 را می‌گذارد → `data/`، آپلودها و رازها را نگه می‌دارد → سرویس را بالا می‌آورد و `healthz` را خودش چک می‌کند.

### حالت ب) فقط اگر `/opt/dastgir` وجود ندارد (نصب تازه)

```bash
STAGE=$(mktemp -d /tmp/dastgir-v316.XXXXXX)
unzip -q /tmp/dastgir-v316.zip -d "$STAGE"
bash "$STAGE/dastgir/deploy/install.sh" /tmp/dastgir-v316.zip
rm -rf "$STAGE"
```

> ⚠️ **هشدار VPS اشتراکی:** `install.sh` علاوه بر سایت، سواپ/فایروال/fail2ban می‌سازد و کانفیگ nginx را به‌عنوان `default_server` روی پورت ۸۰ می‌گذارد. اگر روی همین VPS **سایت دیگری با nginx** داری، آن بخش را دستی بچین: فایل `/etc/nginx/sites-available/dastgir` را بردار و در بلوک آن، `default_server` را حذف و `server_name daastgir.ir;` بگذار تا با سایت‌های دیگرت تداخل نکند. (حالت «الف» nginx را اصلاً لمس نمی‌کند.)

---

## گام ۴ — بررسی نهایی: فقط v316 بالا است و توکن‌ها سر جایشان‌اند

```bash
cat /opt/dastgir/VERSION.txt                          # انتظار: 316
systemctl is-active bazarche                          # انتظار: active
curl -fsS http://127.0.0.1:8080/healthz && echo       # انتظار: ok
curl -fsS https://daastgir.ir/healthz && echo         # انتظار: ok
curl -s https://daastgir.ir/sw.js | grep -o 'bazarche-v[0-9]*'   # انتظار: bazarche-v316
```

توکن‌ها و کلیدها (باز فقط **عدد** — باید همان اعداد گام ۱ باشد):

```bash
grep -c '^BALE_BOT_TOKEN='    /etc/dastgir-secrets.env
grep -c '^SOROUSH_BOT_TOKEN=' /etc/dastgir-secrets.env
grep -c '^AI_'                /etc/dastgir-secrets.env
```

بدون خطا بودن لاگ:

```bash
journalctl -u bazarche -n 40 --no-pager | grep -i traceback || echo "بدون خطا ✅"
rm -f /tmp/dastgir-v316.zip
```

سپس در چت ربات مدیر (بله) بنویس: **«تشخیص»** — ۶ خط شماره‌دار باید سبز باشد و خط نسخه «✅ به‌روز» بدهد. اگر هر دو بات `/menu` را جواب دادند و دستیار سایت (`https://daastgir.ir/api/assistant/status` → `"enabled"`) پاسخ داد، یعنی توکن‌ها و هوش مصنوعی‌ها سالم‌اند.

---

## گام ۵ — حذف «فقط» نسخه‌های قدیمی همین سایت (به بقیه برنامه‌ها کاری نداریم)

اول **فقط فهرست کن** — هیچ‌چیز پاک نکن:

```bash
ls -d /opt/dastgir* /root/dastgir* /home/*/dastgir* /srv/dastgir* 2>/dev/null
systemctl list-unit-files | grep -Ei 'dastgir|bazarche' || true
ps aux | grep -E '[r]un\.py' || true
ls -d /tmp/dastgir* 2>/dev/null || true
```

تفسیر:
- اگر `run.py` در حال اجرا از مسیری **غیر از `/opt/dastgir`** بالا آمده → آن یک «کپی قدیمی سایت» است.
- اگر واحد systemd دیگری با نام dastgir/bazarche (غیر از `bazarche.service`) فعال است → مال نصب قدیمی است.

بعد، **فقط همان موارد تأییدشده** را پاک کن (نام سرویس و مسیر واقعی را جای جای‌خالی بگذار — اگر مطمئن نیستی مسیر چیست، همان را در چت بپرس):

```bash
systemctl stop   <نام-سرویس-قدیمی> 2>/dev/null || true
systemctl disable <نام-سرویس-قدیمی> 2>/dev/null || true
rm -rf <مسیر-کپی-قدیمی-سایت>
```

زیپ‌ها و فایل‌های موقت قدیمی سایت:

```bash
rm -f  /tmp/dastgir-v*.zip
rm -rf /tmp/dastgir-update.* /tmp/dastgir-v316.* 2>/dev/null || true
```

> 🚫 هیچ چیز دیگری (داکر، دیتابیس‌های دیگر، سایت‌های دیگر، nginx و…) را پاک **نکن**. الگوهای «dastgir/bazarche» فقط مال همین سایت‌اند.

---

## اگر ربات‌ها بعد از نصب جواب ندادند (اختیاری) — ثبت دوباره webhook

نکته: به‌روزرسانی webhookها را پاک نمی‌کند؛ این بلوک فقط وقتی لازم است که بات پاسخ ندهد. رازها چاپ نمی‌شوند:

```bash
bash -c 'set -euo pipefail;set -a;. /etc/dastgir-secrets.env;set +a
curl -fsS -X POST "https://tapi.bale.ai/bot${BALE_BOT_TOKEN}/setWebhook" \
  -H "Content-Type: application/json" \
  --data "{\"url\":\"https://daastgir.ir/api/bale/webhook/${BALE_WEBHOOK_SECRET}\"}" >/dev/null
BASE="https://api.splus.ir/bot${SOROUSH_BOT_TOKEN}"
HOOK="https://daastgir.ir/api/soroush/webhook/${SOROUSH_WEBHOOK_SECRET}"
curl -fsS -X POST "$BASE/setWebhook" -H "Content-Type: application/json" \
  --data "{\"url\":\"$HOOK\",\"allowed_updates\":[\"message\",\"callback_query\"],\"drop_pending_updates\":false}" >/dev/null
unset BALE_BOT_TOKEN BALE_WEBHOOK_SECRET SOROUSH_BOT_TOKEN SOROUSH_WEBHOOK_SECRET BASE HOOK'
```

اگر پیام «گیت فعال‌سازی ربات بله … نصب شد» دیدی و شماره/رمز فعال‌سازی را قبلاً خودت عوض کرده بودی، از ربات مدیر دوباره همان را تنظیم کن.

---

## بازگشت اضطراری

- پشتیبان رازها: `/var/backups/dastgir/secrets-env-*.bak` · پشتیبان دیتابیس: `/var/backups/dastgir`
- برگرداندن کد: زیپ نسخه قبلی را با همان دستور `bash /opt/dastgir/deploy/update.sh <زیپ-قبلی>` نصب کن.
- در صورت خطا webhookها را حذف نکن؛ اول `journalctl -u bazarche -n 100 --no-pager` را ببین.

## قوانین طلایی

1. هیچ توکن/کلیدی را در چت، پیام، اسکرین‌شات یا history تایپ نکن — همه‌چیز در `/etc/dastgir-secrets.env` می‌ماند.
2. عوض‌کردن کلید هوش مصنوعی بعد از نصب: فقط از چت ربات مدیر (`/کلید …`، `/مغز`) یا `sudo bash /opt/dastgir/deploy/ai-free-setup.sh gemini|groq <کلید>`.
3. برای هر به‌روزرسانی بعدی فقط گام ۲ و ۳ (حالت الف) با زیپ نسخه جدید تکرار می‌شود.
