# 📚 دانش کامل پروژهٔ «بازارچهٔ ایران» — v108
> یک فایل مرجعِ کامل: هر چه دربارهٔ پروژه، قوانین، معماری، صفحه‌ها، امنیت، تاریخچه، ممیزی و ابزارها.
> تاریخ: ۲۰۲۶-۰۸-۲۵ · نسخهٔ فعلی: v90 · مخزن: github.com/rezadb369-wq/369

## فهرست
۱) نمای کلی، معماری، فایل‌ها · ۲) قوانین و خطوط قرمز · ۳) فهرست کامل صفحه‌ها ·
۴) تاریخچهٔ نسخه‌ها · ۵) وضعیت و تحویل · ۶) ممیزی اصلاح‌شده · ۷) برنامهٔ ارتقاء

---
## ۳) فهرست کامل صفحه‌ها (v90) — همه بررسی و کامل‌اند

### عمومی (۲۰۰)
`/` خانه · `/about` · `/areas` · `/blog` · `/businesses` · `/cart` · `/catalog` ·
`/categories` · `/cities` · `/compare` · `/contact` · `/deals` · `/events` ·
`/favorites` · `/features` · `/lists` · `/map` · `/nearby` · `/pricing` · `/rules` ·
`/submit` · `/register` · `/signup` · `/login` · `/owner`

### مشتری `/me/*` (بدون ورود → ۳۰۳ به login)
account · chats · favorites · following · login · login/password · login/verify ·
logout · name · notifications · orders · profile

### مالک `/my/*` (بدون ورود → ۳۰۳)
account · bookings · businesses · chats · claim · export · inquiries · logout ·
offers · orders · plan · questions · reviews · stories · story/add · tickets

### ادمین `/panel/*` (بدون توکن → ۴۰۳) — ~۵۰ صفحه
ads · alerts · appearance · areas · audit · backup · badges · bookings · broadcast ·
businesses · categories · chats · claims · customers · deals · demo · editor · edits ·
events · features · follows · inbox · inline-edit · inquiries · insights · lists ·
media · messages · orders · owners · pages · plans · posts · qa · reports · reviews ·
security · settings · stories · subscriptions · tickets · unlocks

### API
`/api/businesses` `/api/search` `/api/nearby` `/api/stories` `/api/favorite`
`/api/follow` `/api/alert` `/api/check-duplicate` `/api/question-helpful` `/api/review-helpful`

### سیستم
`/manifest.webmanifest` (PWA) · `/robots.txt` · `/sitemap.xml` · `/offline.html` · `/sw.js`

> ✅ بررسی v90: همهٔ صفحه‌های عمومی ۲۰۰ با محتوای واقعی؛ صفحهٔ «در حال ساخت» نیست.
> متن‌های «به‌زودی» فقط **empty-state** هستند (وقتی داده‌ای در DB نیست)، نه نقص.

---
## ۱) نمای کلی، معماری، فایل‌ها

# 📚 دانش‌نامهٔ کامل «بازارچهٔ ایران» — همه‌چیز در یک فایل

> **این فایل چیست؟** ادغامِ کاملِ `HANDOFF.md` + `CLAUDE.md` + `RULES.md` + `AUDIT-v77` + `REPORT-v77/v78`.
> در یک چت تازه کافیست **فقط همین یک فایل** را بدهی؛ هیچ‌چیز از اول تکرار نمی‌شود.
> **آخرین به‌روزرسانی:** ۲۰۲۶-۰۸-۲۴ (Asia/Tehran) • **نسخهٔ جاری:** v79 • **زیپ نهایی:** `bazarche-najafabad-v79.zip`
>
> **برنامهٔ ۳بخشی چت (v79) — کامل شد:** ۱) رفع «محو شدن چت برای مشتری» (نوار پایین موبایل برای مشتریِ واردشده = «گفتگوها»→`/me/chats` با نشانگر خوانده‌نشده؛ `features.chat_unread_customer`). ۲) ارسال تصویر + فشرده‌سازی دوطرفه (canvas سمت مرورگر `chat.js` IMG_EDGE=1280/q=0.8 + safety-net سمت سرور `uploads.compress_image` برای حذف EXIF/XMP/ICC بدون re-encode) + حذف خودکار ۷روزهٔ **دوجانبه** (`app.purge_expired_chat_images` در startup و ساعتی؛ `CHAT_RETENTION_DAYS=7`؛ کوئری sender-agnostic). ۳) هاب «گفت‌وگوها» (`views_chat.conversations_tabs`) با تب‌های زیرشاخه در هر ۴ صفحه (چت/تیکت مغازه‌دار و پنل) + گروه مادر در ناوبری پنل.

---

# بخش A — کاربر و رفتار ایجنت

## A.۱) تو کی هستی
- زبان: **فارسی** (کد/متغیر/کامیت انگلیسی). منطقهٔ زمانی: **Asia/Tehran**.
- روی **گوشی اندروید** با **Pydroid 3** کار می‌کنی → سایت = **فقط کتابخانهٔ استاندارد پایتون + SQLite**، بدون pip.
- توسعه‌دهندهٔ رسمی نیستی؛ با ایجنت می‌سازی. توضیح‌ها ساده، صادقانه، بدون اصطلاح سنگین.

## A.۲) خط‌قرمزها (هرگز نشکن)
1. **«دروغ نگو»** — هرگز نگو «درست شد» مگر با مدرک واقعی (curl کد وضعیت / مرورگر / چک DB).
2. **موبایل‌اول** — تست در ۳۶۰/۳۹۰/۴۱۲: بدون سرریز افقی، هدف لمسی ≥۴۴px، فونت بدن ۱۴px (هیچ متن غیرضروری <۱۲px).
3. **صفحهٔ اول مهم‌ترین بخش دیده‌شدن** است.
4. **«لوپ ۲۰ بار»** — بعد از اتمام، دوباره دنبال اشکال واقعی بگرد؛ زود جمع نکن.
5. **«اجازه نپرس»** — اجرا کن؛ فقط در ابهام واقعاً مهم بپرس. ⚖️ استثنا: پیام چنددستوری → اول برنامه (قانون ۲).
6. **هر نسخه = زیپ تازهٔ نام جدید**، بدون `data/`.
7. **معماری تمیز** — لایه‌ها جدا، بدون «خدا-فایل»، مستند.
8. **امنیت همیشه اولویت** — تست نفوذ قدرتمند در برنامه باشد.

## A.۳) سبک ارتباطی تو
- کوتاه، مستقیم، محاوره‌ای. ناراضی‌شدن = تکرار موضوع + جملهٔ کوتاه → اول قبول کن، ریشه‌یابی کن، با مدرک نشان بده.
- راست‌گویی حتی با خبر بد تحسین می‌شود. اسکرین‌شات می‌فرستی (ایجنت می‌تواند ببیند + ابعاد واقعی را اندازه می‌گیرد).
- **قبل از اجرا تحقیق کن** (استانداردهای ۲۰۲۶، MDN، web.dev). اعداد تست را می‌خواهی. **کامل بودن > سرعت**.

## A.۴) قوانین رفتاری جدید (RULES)
1. **حرفت را به پرامپت قوی‌تر تبدیل کن** و نشانش بده:
   `هدف / دامنه / معیار پذیرش / خط‌قرمزها / روش تأیید / خروجی`. ابهام مهم = یک سؤال؛ بعد اجرا کن.
2. **پیام بلند = N بخش.** اول برنامه (قالب پایین)، بعد **هر پیام فقط یک بخش** تا تأیید، بعد «بخش بعدی؟».
   ```
   📋 برنامه کار — N بخش
   1) <عنوان> — فایل‌ها: … | معیار پذیرش: …
   ترتیب: ۱ ←  …  این پیام فقط روی بخش X.
   ```
   استثنا: «همه را یک‌جا» → تقسیم نکن. اگر جواب ندادی، از بخش ۱ شروع کن.
3. **منبع حقیقت = ریپو.** شروع هر چت: `git ls-remote --heads <آدرس>`، مقایسهٔ نسخهٔ ریپو با ورک‌اسپیس، یک خط گزارش.
4. **ثبت تدریجی قوانین** — قاعدهٔ تازه = همان لحظه ثبت (رفتاری→RULES، سلیقه→HANDOFF) بعد اجرا.

---

# بخش B — هویت پروژه و منبع حقیقت

## B.۱) گیت‌هاب (اصلاح‌شده)
- ✅ درست: **`https://github.com/rezadb369-wq/369.git`** — حساب `rezadb369-wq`. تنها ریپوی عمومی: `369`.
  ریپوهای `963`/`film` زیر این حساب **نیستند**. ❌ آدرس قدیمی غلط: `g9742888-droid`.
- وضعیت ۲۰۲۶-۰۸-۲۴: برنچ `main`، کامیت `544bb1f` با `README.md` + `bazarche-najafabad-v76 (1).zip`. **دیتابیس در ریپو نیست.**
- تحویل = زیپ تازه + آپلود در ریپوی 369 (توسط کاربر). **هرگز** `data/`/`raw/`/`shots/`/توکن داخل ریپو نرود.

## B.۲) پروژه در یک نگاه
- **«بازارچهٔ ایران»** (قبلاً نجف‌آباد) — دایرکتوری/مارکت‌پلیس کسب‌وکارهای ایران، شبیه **دیوار**.
- مسیر در ورک‌اسپیس: `/home/user/site/bazarche/bazarche`.
- معماری ۳لایه (جهت وابستگی فقط بالا→پایین): `app.py` (کنترلر/امنیت) → `views_*.py`+`ui.py` (نما) → `db.py`+`features.py`+`uploads/sms/qr` (داده).
  جزئیات در `ARCHITECTURE.md` خود بسته (هرچند سرِ v36 — نیاز به بازنویسی).

## B.۳) نکته‌های فنی کلیدی
- اجرا: `cd /home/user/site/bazarche/bazarche && python3 run.py` → پورت **8080** روی `0.0.0.0`.
- کلید پنل محلی: `python3 -c "import sys;sys.path.insert(0,'server');import db;print(db.owner_token())"`.
- `prices_enabled` پیش‌فرض `0` → `/prices` و `/alert` در حالت خاموش **404**.
- cache-bust `?v78`؛ `VERSION` در `site/sw.js` = `bazarche-v78`.
- DB تازه: **۶۱ جدول، ۱۷۳ دسته، ۰ کسب‌وکار** → `tools/seed_demo.py` (۱۰ کسب‌وکار/۳۱ کالا/۱۹ نظر) زنده‌اش می‌کند.
- زیپ همیشه بدون `data/`، `raw/`، `shots/`، `__pycache__`.
- کدهای وضعیت مرجع: `/`=200، `/catalog`=200، `/map`=200، `/login`=200، `/item/…`=200، `/prices`=404، `/panel` بدون کلید=403 / با کلید=200.

---

# بخش C — تاریخچه و وضعیت

- v23→v42: ممیزی امنیتی → آپلود/Leaflet/موبایل → PBKDF2 → حساب مشتری/سفارش/چت → حذف ویرایش عمومی → OTP امن → ۴ قابلیت خواستنی → استوری سراسری → تست نفوذ → رفع زوم → بازمعماری → سراسری‌سازی (۳۱ استان/۳۵۳ شهر) → داشبوردها → دسته‌های ملی → sprite → هیروی اسکرولی/ویدیو.
- v72 اعلان‌ها • v73 پیام‌رسان سه‌نقشی + فایل خصوصی • v74 علاقه‌مندی یکپارچه • v75 قیمت اختیاری + بودجهٔ بار اول.
- **v76** (داخل ریپو): سرعت (حذف ویدیو/sprite، ‑۷٪؛ بار اول ۳۹۰px ≈ ۳۸۷KB)، نوار پایین شیشه‌ای، تیکت امن با پیوست، نقشه ۱۷۳ دسته + «نزدیک من»، `/item/<id>`، سبد با تعداد، رضایت تلفن، لغو دومرحله‌ای. (۲۹/۲۹ مجموعه.)
- **v77** (بخش ۲): رفع P0/P1 ممیزی — OTP per-phone + سقف IP؛ لمسی→۰؛ aria-label فرم‌های پنل؛ متای واقعی؛ پنل «باز هستند» فقط واقعاً-باز؛ حذف کد مرده `if False:`.
- **v78** (بخش ۳، نهایی): کارت‌های آمار داشبورد **لینک‌دار/قابل لمس** (۴۴px)؛ پاک‌سازی دادهٔ تست؛ بامپ `?v78`.
- **بخش ۴ (پاک‌سازی):** ورک‌اسپیس ~۱۵۰MB→**۱۲MB**؛ فقط v78 + حافظه‌ها ماندند. زیپ نهایی ۳۰۶ فایل، SHA `e7595fe7`.

---

# بخش D — یافته‌های ممیزی و اصلاحات (با مدرک)

## D.۱) ممیزی v76 (AUDIT-v77) — ۱۳۷ صفحه، ۴ نقش
✅ سالم: ۰ تصویر شکسته، ۰ بدون alt، ۰ سرریز، ۰ فونت <۱۲px؛ هدرهای امنیتی قوی (CSP/XFO/nosniff/Referrer/Permissions); ۴۶ صفحه/۰ کنترل بی‌عمل.
⚠️ یافته‌ها: **P0** محدودساز OTP بر اساس IP (قفل CGNAT) • **P1** لمسی <۴۴px (تب استان ۳۸، FAB ۴۳)، ورودی بدون label (۴ صفحه)، متای «توضیح»، کارت «نامشخص» • **P2** کد مرده، 404 به‌جای 405، اسناد کهنه، تم فقط تیره.

## D.۲) اصلاحات انجام‌شده (v77/v78)
| مشکل | اصلاح | مدرک |
|---|---|---|
| OTP روی IP | سطل `otp:{phone}` ۵/۹۰۰ + `otpip:{ip}` ۲۰/۹۰ | ۶ شماره از یک IP همه موفق؛ اسپم تک‌شماره مهار شد |
| لمسی <۴۴ | `.tab`/`.city-chip`/`.chip`/`.catgroup-all`→۴۴؛ `.sup-fab`→۴۸ | cities/خانه/categories/catalog = ۰ |
| بدون label | `aria-label` در فرم‌های پنل (`views_panel2.py`) | loyalty/deals/lists = ۰ |
| متای «توضیح» | fallback «نام+شعار» در `ui.py::page` | خانه: «بازارچه ایران — دایرکتوری…» |
| «نامشخص» | پنل هیرو فقط واقعاً-باز؛ وگرنه تیتر «ویژهٔ شهر» | اسکرین‌شات بعد-اصلاح |
| کد مرده | حذف `if False:` در `app.py` | — |
| داشبورد ایستا | `stat_card` با `href` → ۸ کارت لینک‌دار ۳۶۶×۷۲ | `v78-panel-dash.jpg` |

## D.۳) بازماندهٔ شناخته‌شده (عمدی/نیازمند تصمیم)
بازگشت 405 به‌جای 404 • بازنویسی `ARCHITECTURE.md`/`README.md` (سرِ v36/v2) • تم روشن/`prefers-color-scheme` • نام زیپ (نجف‌آباد vs ایران) • چک‌باکس‌های متراکم پنل (WCAG 24px = قابل‌قبول).

---

# بخش E — استانداردهای ۲۰۶ که مبنای ممیزی بود
- **Core Web Vitals:** LCP≤۲٫۵s • INP≤۲۰ms • CLS≤٫۱ (در p75 دادهٔ میدان). ⚠️ فقط آزمایشگاه سنجیده شد؛ CrUX واقعی نه.
- **WCAG 2.2 AA:** کنتراست متن ۴٫۵:۱ • هدف لمسی ≥۲۴px • label برای ورودی‌ها. (قانون خانهٔ تو: ۴۴px.)
- **موبایل:** سرریز صفر، فونت بدن ≥۱۴px.

---

# بخش F — محیط و عملیات (مهم برای چت تازه)
- **ماندگاری:** فقط `/home/user` می‌ماند. پکیج‌های pip، `/usr` (apt)، و فرآیندها **بین چت‌ها ریست** می‌شوند.
- **دایرکتوری‌های نقطه‌دار (`~/.cache`, `.pylibs`) ماندگار نیستند** → از مسیرهای بدون نقطه استفاده کن: `/home/user/pylibs` و `/home/user/pw-browsers`.
- **آماده‌سازی هر چت ممیزی:** `bash /home/user/setup-dev.sh` (apt + pip→pylibs + chromium→pw-browsers + راهنمای سرور).
  بعدش: `export PYTHONPATH=/home/user/pylibs PLAYWRIGHT_BROWSERS_PATH=/home/user/pw-browsers`.
- **تست‌ها:** `tools/` (۴۱ فایل، ۲۴ تا `test_*.py`). بعد از هر تغییر: `node --check` روی JS + اجرای مجموعه‌ها + اسکن موبایل.
- **ابزار ممیزی خودساخته:** `tools/shot_sweep.py` (جاروی بصری ۴ نقش + اسکرین‌شات).

---

# بخش G — چک‌لیست تحویلِ هر نسخه
1. چرخاندن توکن پنل (اگر لینک منتشر شده). 2. `site_url` + کلید پیامک روی دامنهٔ واقعی. 3. زیپ بدون `data/`. 4. بامپ `?vNN` + `sw.js`. 5. آپلود زیپ در ریپوی 369.
**آینده (نیازمند هاست+HTTPS):** زرین‌پال، پوش‌نوتیفیکیشن.

---

# بخش H — فرمان‌های پرتکرار
```bash
# اجرا            cd /home/user/site/bazarche/bazarche && python3 run.py
# کلید پنل        python3 -c "import sys;sys.path.insert(0,'server');import db;print(db.owner_token())"
# دمو             python3 tools/seed_demo.py
# آماده‌سازی      bash /home/user/setup-dev.sh
# ممیزی بصری      PYTHONPATH=/home/user/pylibs PLAYWRIGHT_BROWSERS_PATH=/home/user/pw-browsers BZ=http://127.0.0.1:8080 python3 tools/shot_sweep.py
```

> 📁 فایل‌های مرجعِ منبع (در صورت وجود): `HANDOFF.md` `CLAUDE.md` `RULES.md` `AUDIT-v77.md` `REPORT-v77.md` `REPORT-v78.md` — ولی **همهٔ محتوایشان بالاست**؛ این فایل به‌تنهایی کافیست.

---

## ۲) قوانین و خطوط قرمز

# 📏 قوانین کار با من (کاربر) — قوانین جدید، به‌تدریج کامل می‌شود

> **این فایل چیست؟** پروتکلِ رفتارِ ایجنت با من. هر قانون جدیدی که گفتم، همین‌جا اضافه می‌شود
> (با تاریخ). در شروع هر چت، بعد از `HANDOFF.md` و `CLAUDE.md`، **این فایل هم خوانده شود**.
> مسیر یکتا: `/home/user/RULES.md`

---

## قانون ۱ — «حرف من را به پرامپت قوی‌تر تبدیل کن» (۲۰۲۶-۰۸-۲۴)

هر پیامی که من می‌فرستم، در واقع یک **پرامپت خام** است. قبل از اجرا، آن را به یک
پرامپت دقیق بازنویسی کن و **همان را به من نشان بده** (کوتاه، نه طولانی):

```
🎯 پرامپت دقیق‌شده
هدف:            <یک جمله — چه چیزی باید درست شود>
دامنه:          <کدام فایل/صفحه/بخش>
معیار پذیرش:    <چه چیزی که دیدنش = تمام شدن کار>
خط‌قرمزها:      <چه چیزهایی نباید بشکند>
روش تأیید:      <curl / تست / مرورگر / چک دیتابیس>
خروجی تحویلی:   <زیپ vNN + گزارش + …>
```

- اگر در پیام من ابهامِ **واقعاً مهمی** بود، قبل از اجرا همان یک مورد را بپرس؛ بقیه را حدس نزن.
- اگر ابهام نبود: پرامپت را بنویس و **بلافاصله اجرا کن** (منتظر تأیید نمان).

## قانون ۲ — پیام بلند = تقسیم کار (۲۰۲۶-۰۸-۲۴)

اگر پیام من بلند بود و چند دستور داشت:

1. **اول برنامه بفرست**، بدون اجرا. تعداد بخش‌ها = تعداد دستورهای من
   (۴ دستور = ۴ بخش؛ نه کمتر، نه ادغام‌شده).
2. برنامه با این قالب باشد:

```
📋 برنامهٔ کار — N بخش
1) <عنوان بخش ۱> — فایل‌ها: … | معیار پذیرش: …
2) <عنوان بخش ۲> — …
3) …
ترتیب پیشنهادی: ۱ ← ۲ ← ۳
این پیام فقط روی بخش X کار می‌کند.
```

3. **در هر پیام فقط روی یک بخش تمرکز کن** و همان را تا «تأییدشده» ببر؛ بعد بپرس
   «بخش بعدی؟». وسط کار سراغ بخش دیگر نرو.
4. وقتی بخشی تمام شد، در برنامه تیک بزن (⏳ → ✅) و برنامهٔ به‌روز را دوباره نشان بده.
5. **استثنا:** اگر صریحاً گفتم «همه‌اش را یک‌جا انجام بده»، تقسیم نکن.

> ⚖️ رفع تعارض با خط‌قرمز قدیمی «اجازه نپرس»: قانون ۲ مقدم است —
> یعنی **برنامه اول می‌آید**، ولی اگر جوابی ندادی، از بخش ۱ به ترتیب شروع می‌کنم
> و منتظر نمی‌مانم.

## قانون ۳ — منبع حقیقت: ریپوی گیت‌هاب (۲۰۲۶-۰۸-۲۴، آدرس اصلاح‌شده)

- آدرس درست: **`https://github.com/rezadb369-wq/369.git`**
  (آدرس قبلیِ داخل فایل‌ها — کاربر `g9742888-droid` — **غلط** بود.)
- در شروع هر چت:
  1. `git ls-remote --heads https://github.com/rezadb369-wq/369.git`
  2. آخرین نسخهٔ زیپ داخل ریپو را ببین و با نسخهٔ داخل `/home/user/site/` مقایسه کن.
  3. یک خط گزارش بده: «ریپو: vNN | ورک‌اسپیس: vMM | وضعیت: …».
- هر تحویل جدید = یک زیپ تازه + (طبق روش فعلی) آپلود همان زیپ در ریپوی 369.
- **هرگز** `data/`، دیتابیس، `raw/`، `shots/` یا توکن داخل ریپو نرود.

## قانون ۴ — «با قوانین جدیدم به مرور آشنا می‌شوی» (۲۰۲۶-۰۸-۲۴)

- هر وقت قاعده/سلیقهٔ تازه‌ای گفتم، **همان لحظه** در `RULES.md` (قاعدهٔ رفتاری)
  یا `HANDOFF.md` (سلیقه/تصمیم پروژه) ثبتش کن و به من بگو ثبت شد.
- قانون ثبت‌نشده = قانون فراموش‌شده. پس ثبت کن، بعد اجرا کن.

---

### تاریخچهٔ قوانین
| تاریخ | قانون |
|---|---|
| ۲۰۲۶-۰۸-۲۴ | ۱) تبدیل حرف کاربر به پرامپت دقیق • ۲) تقسیم کار پیام‌های بلند • ۳) آدرس درست گیت‌هاب • ۴) ثبت تدریجی قوانین |

## قانون ۵ — ابزارهای معرفی‌شدهٔ کاربر (۲۰۲۶-۰۸-۲۵)
هر ۵ مورد بررسی و اصالتشان تأیید شد. این‌ها اسکیل/ابزار **Claude Code** اند و در محیط Arena
به‌صورت slash-command نصب نمی‌شوند؛ پس محتوای مفیدشان **جذب** شد:
- **Stop Slop** (hardikpandya/stop-slop، ۱۶k★) → سبک نوشتن من: بدون عبارت پرکننده و قید زائد؛
  صدای فعال با فاعل انسانی؛ عینی و مشخص (نه کلی‌گویی)؛ ریتم متنوع؛ بدون em-dash؛ اعتماد به شعور
  مخاطب؛ جملهٔ شعاری نمی‌نویسم. روی پاسخ فارسی هم اعمال می‌شود.
- **UI/UX ProMAX** (nextlevelbuilder، ۱۲۱k★) → هوش طراحی (پالت، کامپوننت، ریتم بصری) مبنای
  کارهای طراحی بازارچه.
روی PC خود کاربر (Claude Code) قابل نصب‌اند: **Skill Creator** (anthropics/skills)،
**Remotion** (ساخت ویدیو/موشن با پرامپت)، **FireCrawl** (اسکرپ وب؛ نیازمند کلید رایگان firecrawl.dev).
در این sandbox اسکیل اجرا نمی‌شود؛ اگر ویدیوی واقعی خواستی، Remotion را جدا راه می‌اندازیم.

---

## ۴) تاریخچهٔ نسخه‌ها (لاگ)

# CLAUDE.md — حافظهٔ پروژه (Project Memory)

> این فایل در شروع هر سشن توسط ایجنت خوانده می‌شود. به‌روزرسانی‌ها در همین فایل ثبت شود.
>
> 📌 ترتیب خواندن در چت تازه:
> 1. `/home/user/HANDOFF.md` — شناسنامهٔ همکاری (کاربر، خط‌قرمزها، وضعیت پروژه)
> 2. `/home/user/RULES.md` — قوانین جدید رفتار (پرامپت دقیق‌شده + تقسیم کار)
> 3. همین فایل — وضعیت فنی پروژه

## زبان ارتباط / Language
- با کاربر به **فارسی** صحبت کن. کد، شناسه‌ها، نام متغیرها و کامیت‌ها **انگلیسی**.
- منطقهٔ زمانی کاربر: Asia/Tehran — آخرین به‌روزرسانی این فایل: ۲۰۲۶-۰۸-۲۴

## منبع حقیقت (اصلاح ۲۰۲۶-۰۸-۲۴)
- گیت‌هاب: **`https://github.com/rezadb369-wq/369.git`** — کاربر `rezadb369-wq`.
- تنها ریپوی عمومی این حساب: **`369`** (ریپوهای `963` و `film` زیر این حساب وجود ندارند).
- محتوای فعلی ریپو (کامیت `544bb1f`، ۲۰۲۶-۰۸-۲۴ ۱۳:۴۰ +۰۳۳۰):
  `README.md` («# 369») + `bazarche-najafabad-v76 (1).zip`. **هیچ دیتابیسی در ریپو نیست.**
- نسخهٔ جاری پروژه: **v79** (فایل نهایی: `bazarche-najafabad-v79.zip`).

## محیط کاری (Arena.ai Agent Mode)
- محیط، Arena.ai Agent Mode است (نه Claude Code). مکانیزم لود خودکار اسکیل وجود ندارد؛
  پس **ایجنت باید قبل از انجام هر تسک، SKILL.md مرتبط را خودش بخواند و طبقش عمل کند.**
- مسیر اسکیل‌ها: `~/.claude/skills/` (در ورک‌اسپیسِ تازه ممکن است خالی باشد — چک شود).
- فایل‌ها فقط زیر `/home/user` بین سشن‌ها می‌مانند؛ فرآیندها و پکیج‌های سراسری نمی‌مانند.
- تصویر: در این محیط ایجنت **می‌تواند** تصویرهای پیوست را با `read_file` باز کند
  (اسکرین‌شات‌های کاربر در `/home/user/uploads/`). علاوه بر آن، اندازه‌گیری واقعی
  عناصر در مرورگر (سرریز، ابعاد، فونت) هم انجام می‌شود.

## قواعد کاری
1. قابلیت جدید = brainstorming سپس writing-plans، بعد اجرا.
2. کد جدید = تست جدید (TDD).
3. قبل از گفتن «تمام شد»، verification-before-completion (مدرک واقعی: کد وضعیت، تست، چک DB).
4. برای باگ، systematic-debugging (ریشه‌یابی سیستماتیک، نه حدس‌وخطا).
5. اگر ابزار/اسکیل آماده‌ای برای کاری هست، اول با find-skills چک کن، بعد خودت بساز.
6. امنیت: هرگز توکن/کلید/.env را در کد یا کامیت قرار نده.

## وضعیت پروژه / Project Status
- [x] ۲۰۲۶-۰۸-۲۴ — **اصلاح: هاب «گفت‌وگوها» سمت مشتری جا افتاده بود** — کاربر گزارش داد قابلیت‌ها روی پنل هست ولی سایت عمومی نه. ریشه: `conversations_tabs` فقط به ۴ صفحهٔ مغازه‌دار/پنل تزریق شده بود، نه به `/me/chats` مشتری. اصلاح: تزریق هاب به `views_customer.chats_list` + نشان‌دادن تب حتی برای تک‌نوع (مشتری: «گفت‌وگوهای من»). تأیید: هر ۵ صفحه (customer/owner×2/panel×2) hub=True. تست‌ها ۰ ناموفق. زیپ v79 بازسازی شد (sha 96910de0). نکته: در `sw.js` مسیرهای `/panel` و `/my` در NO_CACHE هستند ولی `/me` نه (با این حال HTML مشتری network-first و بدون ذخیره است، پس تازه می‌ماند).
- [~] ۲۰۲۶-۰۸-۲۴ — **برنامهٔ ۳بخشی چت** (درخواست کاربر): ۱) رفع «محو شدن چت برای مشتری» ✅ — ریشه: نوار پایین موبایل برای مشتریِ واردشده «ورود» نشان می‌داد و چیپ حساب `hide-mobile` بود → مسیر برگشت به `/me/chats` نبود. اصلاح: `ui.py::bottom_nav` اسلات پنجم برای مشتری = «گفتگوها»→`/me/chats` با نشانگر خوانده‌نشده (`.fav-dot`)؛ `features.chat_unread_customer` اضافه شد. تأیید: قبل=ورود/بدون لینک، بعد=گفتگوها+badge=1؛ test_all 154/154، gates 83/83. ۲) ارسال تصویر+فشرده‌سازی+حذف ۷روزه ✅ — زیرساخت ارسال تصویر از قبل بود (ورودی فایل در `chat_room` هر سه نقش). اضافه شد: (الف) فشرده‌سازی canvas سمت مرورگر در `chat.js` (IMG_EDGE=1280,q=0.8، چون Pillow در Pydroid نیست)؛ (ب) safety-net سمت سرور `uploads.compress_image` (حذف EXIF/XMP/ICC برای jpg/png/webp، stdlib، هرگز re-encode نمی‌کند، اگر کوچک‌تر+معتبر نشود اصل را برمی‌گرداند) در `save_chat_file`؛ (ج) حذف خودکار ۷روزه `app.purge_expired_chat_images` (startup + ساعتی در do_GET) با `db.expired_chat_attachments`/`delete_chat_attachments` — sender-agnostic یعنی **هر دو جهت** یکسان. `CHAT_RETENTION_DAYS=7`. تأیید: PNG 3089→69 بایت e2e؛ پیوست ۸روزه حذف/تازه سالم؛ test_all 154، chat 60✓، gates 83. ⚠️ cache-bust `?v79` در تحویل نهایی. ۳) یکپارچه‌سازی همهٔ چت‌ها زیر پنل «گفت‌وگوها» ✅ — هاب `views_chat.conversations_tabs` (تب‌های زیرشاخه) در هر ۴ صفحه تزریق شد: `/my/chats`+`/my/tickets` (مغازه‌دار) و `/panel/chats`+`/panel/tickets` (پنل)؛ CSS `.conv-hub/.conv-tabs/.conv-tab` (min-height 44px). ناوبری پنل: گروه مادر «گفت‌وگوها» با دو زیرشاخه در `OWNER_NAV_GROUPS`. ناوبری مغازه‌دار: «گفت‌وگوها»+«تیکت پشتیبانی» کنار هم. cache-bust `?v79` + `sw.js=bazarche-v79`. تأیید: hub در هر ۴ صفحه با تب فعال درست؛ test_all 154/gates 83/admin_extras 43/open 44/tickets 42 همگی ۰ ناموفق. **تحویل نهایی: `bazarche-najafabad-v79.zip` (۳۰۶ فایل، ۳٫۹۳MB، sha 31fe9762، بدون data/shots).** برنامهٔ ۳بخشی چت کامل شد.
- [x] v23→v42 — تاریخچهٔ کامل در `HANDOFF.md` بخش ۶.
- [x] v72 — اعلان‌ها و پیشنهادهای جست‌وجو
- [x] v73 — پیام‌رسان مشتری/مغازه‌دار/مدیر + فایل خصوصی چت
- [x] v74 — علاقه‌مندی یکپارچه
- [x] v75 — قیمت اختیاری + بودجهٔ بار اول
- [x] ۲۰۲۶-۰۸-۲۴ — **v76 (نسخهٔ فعلی، داخل ریپو)**: قیمت خاموش به‌صورت پیش‌فرض،
      حذف `hero.mp4`/پوستر/`hero.js`/sprite سنگین و جایگزینی با هیروی سبک CSS
      (بار اول ۳۹۰px: ~۳۸۷KB encoded، کاهش ~۸۷٪)، نوار پایین شیشه‌ای ۵ مقصد،
      پشتیبانی فقط تیکتی + پیوست امن، نقشه با جست‌وجوی دسته و «نزدیک من» (۱۷۳ دسته)،
      صفحهٔ واقعی `/item/<id>`، تعداد سبد، رضایت `share_phone`، لغو دومرحله‌ای سفارش.
      گزارش: `REPORT-v76.md` + `CAPABILITY-MATRIX-v76.md` (۲۹/۲۹ مجموعه موفق).
- [x] ۲۰۲۶-۰۸-۲۴ — **بخش ۴: پاک‌سازی** — ورک‌اسپیس ~۱۵۰MB→۱۲MB: حذف زیپ v77، کلون repo369، pylibs/pw-browsers (بازتولیدپذیر با setup-dev.sh)، audit-logs، shots/v77-audit و اسناد دورسخن قبل (CHANGES-v12/REPORT-v76/CAPABILITY-MATRIX-v76). فقط v78 + حافظه‌ها ماندند. زیپ نهایی ۳۰۶ فایل، SHA e7595fe7.
- [x] ۲۰۲-۰۸-۴ — **بخش ۳ + تحویل نهایی → v78** (گزارش `/home/user/REPORT-v78.md`): کارت‌های آمار داشبورد لینک‌دار/قابل لمس (۴۴px)، پاک‌سازی دادهٔ تست، بامپ `?v78`، زیپ نهایی بدون data/shots. برنامهٔ ۴بخشی کامل شد.
- [x] ۲۰۲۶-۰۸-۲۴ — **بخش ۲: رفع مشکلات → v77** (گزارش `/home/user/REPORT-v77.md`):
      P0=سهمیهٔ OTP حالا per-phone + سقف سبک IP (تست: ۶ شماره از یک IP همه موفق)؛
      لمسی <۴۴px در cities/خانه/categories/catalog/businesses → ۰؛ aria-label فرم‌های پنل؛
      متای description واقعی؛ پنل «باز هستند» فقط واقعاً-باز؛ حذف کد مرده؛ بامپ `?v77`.
      زیپ: `bazarche-najafabad-v77.zip` (۳۰۹ فایل، بدون data/shots). ۱۴ مجموعه تست ۰ ناموفق.
- [x] ۲۰۲-۰۸-۴ — **ممیزی کامل (بخش ۱ از برنامهٔ ۴بخشی)**: گزارش `/home/user/AUDIT-v77.md`.
      ۱۳۷ صفحه + ۱۴۱ اسکرین‌شات (`shots/v77-audit/`)؛ ۰ تصویر شکسته/بدون alt/سرریز/فونت ریز.
      ابزار جدید: `tools/shot_sweep.py` (جاروی بصری ۴ نقش) + `setup-dev.sh` برای آماده‌سازی محیط.
      یافته‌ها: P0=محدودساز OTP بر اساس IP (قفل کاربر واقعی روی CGNAT)؛ P1=هدف لمسی <۴۴px
      (تب استان ۳۸px، FAB ۴۳px)، ورودی بدون label (۴ صفحه)، meta description «توضیح».
- [ ] باز: `ARCHITECTURE.md` و `README.md` داخل بسته هنوز سرِ v36/v2–v3 هستند (به‌روز نشده‌اند).
- [ ] باز: پنل شناور پشتیبانی، درگاه زرین‌پال و پوش‌نوتیفیکیشن (نیازمند هاست + HTTPS).
- [x] ۲۰۲۶-۰۸-۲۴ — تأیید شد: دیتابیس `data/bazarche.db` در ریپوی 369 **نیست** (TODO قدیمی بسته شد).
- [x] ۲۰۲۶-۰۸-۲۴ — در این ورک‌اسپیس: ریپو کلون شد، v76 استخراج و **واقعاً اجرا شد**
      (پورت 8080؛ `/`=200، `/catalog`=200، `/map`=200، `/login`=200، `/prices`=404،
      `/panel` بدون کلید=403 و با کلید=200) + `seed_demo.py` (۱۰ کسب‌وکار، ۳۱ کالا، ۱۹ نظر).
- پروژهٔ سایت در ورک‌اسپیس: `/home/user/site/bazarche/bazarche` (از زیپ v76 استخراج شد).

## نکته‌های فنی (v76)
- ساختار: `run.py` + `server/` (app, db, features, ui, uploads, sms, qr, views_*) + `site/` + `tools/` (۴۱ فایل).
- `prices_enabled` پیش‌فرض `0` است؛ `/prices` در حالت خاموش 404 می‌شود.
- cache-bust همهٔ CSS/JS: `?v80`؛ `VERSION` در `site/sw.js` = `bazarche-v80`.
- DB تازه: ۶۱ جدول، ۱۷۳ دسته، صفر کسب‌وکار → بعد از `tools/seed_demo.py` زنده می‌شود.
- زیپ همیشه بدون `data/`، `raw/`، `shots/`، `__pycache__`.

## v80 — dashboard tiles + 3-folder conversations (admin<->shopkeeper channel)
- Part A: owner `/my` dashboard now embeds every drawer section as on-page tiles
  via `ui.nav_tiles(items, token)` + `OWNER_AREA_NAV` (13 sections). No drawer nav needed.
- Part B: conversations panel = Telegram-style folders, now THREE per role:
  - owner: گفتگوی مشتریان /my/chats · ارتباط با مدیر /my/admin-chat · تیکت‌ها /my/tickets
  - admin: ارتباط با مشتریان /panel/chats · ارتباط با مغازه‌داران /panel/owner-chats · تیکت‌ها /panel/tickets
- NEW separate admin<->shopkeeper channel (user chose "separate", NOT reusing tickets):
  features.py tables `owner_threads`/`owner_messages` + fns owner_thread_ensure/owner_thread/
  owner_threads_all/owner_msgs/owner_msg_send/owner_mark_read/owner_unread_admin (all in __all__).
  Routes: GET+POST /my/admin-chat (owner, bzv2_sess); GET /panel/owner-chats, GET+POST
  /panel/owner-chat/{tid} (admin ?key=). Views: O.admin_chat, P2.owner_chats_list/owner_chat_view,
  shared renderer CH.direct_room (reuses message_markup + .messenger CSS, plain POST, no polling).
  conversations_tabs (views_chat.py) extended to 3 tabs per role; .conv-tabs flex 1 1 0 so 3 fit one row.
- Verified HTTP: owner sends -> admin list/thread sees it -> admin replies -> owner sees reply;
  3 tabs render on both sides. Tests: test_all 154/0, test_tickets 42/0, test_gates 83/0;
  test_chat_v73 HTTP tasks pass (task3 needs playwright, not installed). Brand intact.
- DEV NOTE: project runner is root `run.py` on port 8080 (find_free_port from 8080). Test suites
  read BASE from env `BZ` (default :8080). For curl/tests on :8000 use /home/user/dev_server.py
  (outside the project, not shipped) which calls app.make_server(8000); run tests with BZ=:8000.
- Zip: bazarche-najafabad-v80.zip (327 files, 4.14MB, SHA 8c026157). No data/ shipped.

## v81 — CORRECTION: revert redundant admin<->owner channel; shopkeeper is also a customer
User feedback: the separate «ارتباط با مدیر» channel (v80) was REDUNDANT — tickets already
cover owner<->admin. Also clarified the real role model:
- مشتری ↔ مغازه‌دار = گفتگو (chat). مغازه‌دار ↔ مدیر = تیکت (enough).
- مدیر فقط با مغازه‌دارها حرف می‌زند، ولی باید NAZAR (overseer) همه‌چیز باشد، حتی چت‌های
  مشتری↔مغازه‌دار → admin keeps «همهٔ گفتگوها» (/panel/chats) for oversight; the WRONG part
  was labelling it «ارتباط با مشتریان» (implied admin messages customers). Reverted to «همهٔ گفتگوها».
- یک مغازه‌دار می‌تواند همزمان مشتری هم باشد.
REVERTED (deleted): owner_threads/owner_messages tables + fns (features.py + __all__), routes
GET+POST /my/admin-chat, GET /panel/owner-chats, GET+POST /panel/owner-chat/{tid} (app.py),
views O.admin_chat / P2.owner_chats_list / P2.owner_chat_view / _conv_counts_admin, CH.direct_room.
conversations_tabs back to: customer 1 tab; owner 2 (گفتگوی مشتریان + تیکت‌ها); admin 2
(همهٔ گفتگوها + تیکت‌ها). Verified: /my/admin-chat & /panel/owner-chats now 404; tabs correct.
KEY FINDING: auth was NEVER the blocker — `s` in _unified_* is db.get_settings(), and both
owner_login & shop_account default "1", so OTP login already grants BOTH bzv2_sess + bzv2_cust.
So a shopkeeper already had a customer session; the only gap was NAVIGATION. Fix = added tile
("/me","حساب مشتری من","user") to OWNER_AREA_NAV (ui.py) so the owner dashboard links to the
customer side. (Reverted my redundant _unified_verify/_unified_password edits to preserve the
admin's shop_account toggle.) Verified: owner /my shows the tile; owner+customer sessions reach
/me, /me/chats, /me/favorites, /me/orders (200, recognized as customer).
Tests: test_all 154/0, test_tickets 42/0, test_gates 83/0. Zip bazarche-najafabad-v81.zip
(SHA f9b32135), markers ?v81 / sw bazarche-v81. No data/ shipped.

## v82 — global rename مغازه -> دکان (Part 1 of 3: panel-split request)
User: separate the mixed panels + rename مغازه->دکان everywhere. Split into 3 parts (Rule 2):
  Part 1 (DONE, v82): rename all user-facing «مغازه»->«دکان» (and مغازه‌دار(ان)->دکان‌دار(ان)).
    Changed: 11 server/*.py + cart.js/chat.js + 13 *.md docs + 19 tools/*.py (tests renamed too so
    assertions match new output). 70 site occurrences + docs/tests. Verified: 0 «مغازه» in shipped
    source; tests 154/0, 42/0, 83/0; live homepage مغازه=0 دکان=13. Local demo descr cleaned + FTS rebuilt.
    NOTE: seed_demo.py had 0 مغازه (fresh installs clean). data/ not shipped.
  Part 2 (NEXT): build «پنل دکان» holding ALL business features; bottom-nav «اخبار شهر» -> «پنل دکان».
  Part 3 (NEXT): «پنل من» becomes personal-only; remove redundant menu items; divide features between the two.
Markers ?v82 / sw bazarche-v82. Zip bazarche-najafabad-v82.zip (SHA 3d27eaf3).

## v83 — Part 2: «پنل دکان» + bottom-nav (panel-split request)
- bottom_nav (ui.py): now TWO context-aware trailing slots. BOTTOM_NAV trimmed to 3 fixed
  (خانه/کسب‌وکارها/نقشه). 4th slot: shopkeeper (owner WITH a business, via db.businesses_of) ->
  «پنل دکان»(/my); everyone else -> «اخبار شهر»(/blog). 5th slot: owner -> «پنل من»(/me),
  customer -> «گفتگوها»(/me/chats), guest -> «ورود», admin -> «پنل».
- /my (owner dashboard) IS the business panel = «پنل دکان». Section title -> «همهٔ بخش‌های پنل دکان».
  Account chip + public CTA relabeled پنل من->پنل دکان (they link /my).
- Removed redundant OWNER_AREA_NAV tile («حساب مشتری من» -> /me) since bottom-nav «پنل من» covers it.
- Verified: GUEST[...اخبار شهر,ورود]; OWNER-no-shop[...اخبار شهر,پنل من]; SHOPKEEPER[...پنل دکان,پنل من].
  Tests 154/0, 42/0, 83/0. Markers ?v83 / sw bazarche-v83. Zip v83 (SHA 5d7a7a88).
- STILL OPEN (Part 3): make «پنل من»(/me) personal-only; move personal items out of /my
  (dashboard cust_strip «حساب مشتری شما», OWNER_AREA_NAV «/my/account حساب و امنیت»);
  remove redundant menu options; finalize the division.

## v84 — Part 3 (DONE): split «پنل من» (personal) vs «پنل دکان» (business)
KEY FIX: /me used to 303-redirect to /my (v69 "merged dashboard"), so bottom-nav «پنل من»
actually bounced into the shop panel. Removed that redirect (app.py): `/me` and `/me/*` now both
go through customer_get -> CU.dashboard. So «پنل من» (/me) is a real personal hub again.
- CU.dashboard (views_customer.py): quick-access rebuilt to 8 PERSONAL tiles — پروفایل، سفارش‌های من،
  گفت‌وگوهای من، علاقه‌مندی‌ها، دنبال‌شده‌ها، اعلان‌ها، امتیازها، حساب و امنیت. Title «همهٔ بخش‌های پنل من».
- Shop panel (/my) is business-only now: removed the personal «حساب مشتری شما» strip (cust_strip=""),
  and removed «حساب و امنیت» (/my/account) from BOTH OWNER_AREA_NAV (ui.py) and the local OWNER_NAV
  sidebar list (views_owner.py). NOTE: there are TWO owner nav lists — ui.OWNER_AREA_NAV (dashboard
  tiles) and views_owner.OWNER_NAV (panel-side sidebar); keep them in sync.
- Verified: /me renders (200, not 303) with all 8 personal tiles + «همهٔ بخش‌های پنل من»; /my has
  «همهٔ بخش‌های پنل دکان», no «حساب مشتری شما», no «حساب و امنیت». Tests 154/0, 42/0, 83/0.
- Markers ?v84 / sw bazarche-v84. Zip bazarche-najafabad-v84.zip (SHA 94218812).
- OPEN (possible follow-up): the owner area still shows a panel-side SIDEBAR menu (OWNER_NAV) AND
  dashboard tiles (OWNER_AREA_NAV) listing the same business sections — a duplication. User said
  "remove redundant menu options"; if they want the sidebar gone (tiles only), that is a layout change.

## v85 — lighter shop panel: removed the duplicate sidebar nav
User: "site must get lighter, remove anything unnecessary, especially duplicates."
- The shopkeeper panel had TWO copies of the same section list: the panel-side SIDEBAR menu
  (views_owner.OWNER_NAV) AND the dashboard tiles (ui.OWNER_AREA_NAV). On a phone the sidebar
  stacked ABOVE the content, so every section showed twice. Removed the sidebar entirely:
  shell() is now a single column (container-wide) with a compact panel-head (title + logout button).
- Deleted now-dead code: views_owner.OWNER_NAV list, NAV_FEATURE dict, the nav/badge/lock loop,
  and the unused _nav_visible import. (ui.OWNER_AREA_NAV tiles remain the single shopkeeper nav.)
- NOTE: panel-side/panel-nav/panel-layout CSS is KEPT — the ADMIN panel_page (ui.py ~769) still uses
  that sidebar (admin has no duplicate tiles, so it is not redundant there).
- Feature gating still works server-side; the lock icon that used to sit in the sidebar is gone, so
  locked sections are discovered on tap (gate page) + on /my/plan. Updated test_gates assertion
  ("is-locked in sidebar" -> "no panel-side on /my"). Tests 154/0, 42/0, 83/0.
- Markers ?v85 / sw bazarche-v85. Zip bazarche-najafabad-v85.zip (SHA 66db2f5e).

## v86 — bottom-nav 4th slot: «اخبار شهر» -> «پنل دکان» (unconditional)
- ui.py::bottom_nav: the 4th thumb-zone slot is now ALWAYS («/my», «پنل دکان», store) for
  guest/owner/customer alike. Dropped the has_shop branch + the per-page businesses_of query.
  News still lives on the homepage; it just no longer occupies a bottom-nav slot.
- Tests 154/0. Markers ?v86 / sw bazarche-v86. Zip bazarche-najafabad-v86.zip (SHA d2882333).

## v87 — REMOVED the entire loyalty / points / coupons feature
User ordered the points/loyalty feature gone "کلا از سایت"; confirmed scope = all_loyalty
(points + /me/points + loyalty_on setting + admin /panel/loyalty + coupons).
- Customer (views_customer.py): deleted points_page(), the «امتیازها» quick tile, the
  «امتیاز وفاداری» stat card (grid-4 -> grid-3), and the _pts lookup.
- Routes (app.py): removed GET /me/points, POST /me/points/redeem, GET /panel/loyalty,
  GET /panel/coupons, POST /panel/coupon/new + /panel/coupon/<id>/delete, POST /panel/loyalty
  (settings save) + /panel/loyalty/points (manual adjust), GET /offers (public coupons page)
  and its sitemap entry. Removed the points-award on order submit and on review submit.
  Removed coupons_enabled from the features TOGGLES save-list.
- Admin nav (ui.py OWNER_NAV_GROUPS): removed «تخفیف‌ها» (/panel/coupons) and «برنامهٔ وفاداری»
  (/panel/loyalty). Removed /offers from the secondary nav. views_panel.py: removed the
  coupon_list() page + the dashboard «کد تخفیف» quick link + the coupons_enabled switch.
  views_panel2.py: removed admin_loyalty() page + the coupons_enabled & loyalty_on feature-toggle
  rows (renamed the «فروش و وفاداری» settings group to «فروش»). views_public.py: removed the
  loyalty FEATURE_CARD, the homepage live-offers strip, and the offers() page; views_public2.py:
  removed the /offers quick-link. db.py: removed coupons()/save_coupon()/delete_coupon(), the
  loyalty DEFAULT settings (loyalty_on/points_*/coupon_cost) + coupons_enabled default, the
  coupons admin stat, and the «coupon» plan perk (+ "coupon," from the plan feature strings).
  features.py: removed points_add/points_balance/points_history/loyalty_redeem/redemptions_list/
  top_customers + their __all__ entries.
- KEPT (dormant, deliberate): the coupons/points/redemptions DB TABLES (schema + backup lists +
  the delete-customer cascade). Dropping them is a data migration; left intact to avoid data loss.
  Offer to drop them if the user wants a clean schema.
- Tests updated: test_all (dropped /offers + /panel/coupons GETs + the coupon-create checks;
  154->150), test_actions (dropped coupon create/delete + coupons_enabled toggles), audit.py,
  shot_sweep.py, verify.py, test_browser.py, test_appearance.py, run_capability_audit.py.
- Verified: /offers + /panel/loyalty + /panel/coupons -> 404; /features has no loyalty card;
  homepage has no offers strip; admin panel pages still 200; admin nav has no loyalty/coupon links.
  Tests test_all 150/0, test_actions 55/0, test_gates 83/0, test_tickets 42/0.
- Markers ?v87 / sw bazarche-v87. Zip bazarche-najafabad-v87.zip (SHA 51542822, 327 files). No data/.

## v88 — Part 3: chat redesign (Telegram-style) + photo-only attachments + removed the anonymous /ask inquiry
- Chat redesign (user-approved core): send/read ticks (single ✓ sent, double ✓✓ read) in
  `span.msg-ticks`; day separators `.chat-date[data-date]` (server-rendered + JS-inserted on
  3s poll); right/left bubbles, auto-scroll, sticky composer, optimized-photo send already present.
- Attachments PHOTO-ONLY (`chat_media=photo_only`): `views_chat.ACCEPT` = jpeg/png/webp/gif;
  `uploads._chat_type` returns None for any non-image (PDF/text branches deleted) so PDF/text are
  rejected server-side; `chat.js` file handler rejects non-images.
- Customer chat entry: business page now has «گفتگو با دکان‌دار» -> GET `/b/<slug>/chat` ->
  `/me/chat/<id>` (trackable in `/me/chats`). This fixes "customer can't find the message they sent".
- REMOVED the anonymous inquiry create: GET `/b/<slug>/ask` page + POST `/b/<slug>/ask` + `C.ask`
  (views_catalog). Inquiry BACKEND left DORMANT (GET `/panel/inquiries` + `/my/inquiries` still 200,
  db.inquiries, the `inquiry` plan feature) — NOT deleted; offered full removal separately.
- Tests updated for the new behaviour: test_all (chat-start replaces inquiry-create), test_actions
  (seed inquiry via db.add_inquiry), test_chat_v73 (PDF/text rejected, accept image-only),
  test_discovery (perk «گفت‌وگو با مشتریان», nav /my/chats), test_section4_v75 (dropped /ask price
  checks; bottom-nav now «پنل دکان»), audit.py (dropped /ask POST).
- Tests: test_all 148/0, test_actions 55/0, test_gates 83/0, test_tickets 42/0, test_discovery 36/0,
  test_chat_v73 + test_section4_v75 server-side all ✓ (their playwright sections can't run here — env).
- Markers ?v88 / sw bazarche-v88. Zip bazarche-najafabad-v88.zip (SHA 391b333c, 327 files). No data/.

## v89 — chat-cleanup follow-up batch: bottom-nav redesign, category/photo declutter, story-video fix, upload progress+preview, homepage spacing, featured links
- پاکسازی چت (گزینهٔ ۱): حذف زیپ‌های v79–v87 + scratch؛ دانش‌ها (CLAUDE/HANDOFF/RULES/MASTER-KNOWLEDGE) و v88/v89 ماندند.
- نوار پایین از نو (Material-3): نشانگر فعال = pill نرم پشت آیکون (نه جعبهٔ بلند بریده‌شده)؛ بدون clip و بدون سرریز در ۳۶۰/۳۹۰/۴۱۲ (اسکرین‌شات).
- دسته‌بندی: آیکون کوچک روی عکس حذف (`cat-photo-art`), تصویر دسته ماند (cat-photo-art=0).
- باگ استوری ویدیویی: `sniff_media` حالا برند `ftyp` در بایت ۴ را با هر اندازهٔ باکس می‌پذیرد (+MOV/WebM)؛ تست HTTP: ویدیو → «ویدیو-استوری منتشر شد» نه «فایل نامعتبر».
- آپلود: `window.UpBar` (نوار پیشرفت ٪ با XHR) + `bindFilePreview` (پیش‌نمایش قبل از ارسال) در app.js؛ wire شده به data-validate multipart + imagefield + chat. CSP `img-src` += `blob:` برای پیش‌نمایش.
- صفحهٔ اصلی: فاصلهٔ دو CTA (نقشه شهر/ثبت) ۸→۱۲px؛ «کسب‌وکارهای ویژه» (hero-mini) حالا لینک واقعی `/b/<slug>` (قبلاً div نمایشی).
- seed_demo رفع‌اشکال (رفرنس `db.coupons()` حذف‌شدهٔ v87).
- تست‌ها: test_all 148/0، test_actions 55/0، test_gates 83/0، test_tickets 42/0، test_discovery 36/0، chat_v73/section4 سروری ۰✗.
- Markers ?v89 / sw bazarche-v89. Zip bazarche-najafabad-v89.zip (SHA 52ecb107, 328 files). No data/.
- پاکسازی حجم (همین چت): ابزار تست مرورگری `pw-browsers`(۷۸M)+`pylibs`(۱۹M) حذف شد تا ورک‌اسپیس به ۱۲MB برگردد؛ هر وقت تست مرورگری لازم شد `bash /home/user/setup-dev.sh` دوباره نصبشان می‌کند. تحویل/سورس/دانش‌ها دست‌نخورده‌اند.

## v90 (۲۰۲۶-۰۸-۲۵)
- فاز ۰ (ممیزی) اصلاح شد: ابزار خام بود؛ کنتراست واقعی ۶٫۸–۸٫۶:۱ (AA پاس)، ورودی‌ها label/min-height دارند، gzip/ETag/کش/lazy از قبل هست. AUDIT-v90.md اصلاح شد.
- JSON-LD کامل و متصل بود (org/website/business/product/faq/event/breadcrumb) — تأیید شد.
- افزودن prompt نصب PWA (beforeinstallprompt + بنر ردشدنی، در app.js + CSS).
- بزرگ‌کردن zoom نقشهٔ Leaflet به هدف لمسی ۴۴px.
- ارتقای نسخه v89→v90 (۳۳ مرجع asset + sw cache). تست ۱۴۸/۰. zip: bazarche-najafabad-v90.zip (۳۳۲ فایل، بدون data، sha 7d04159d).

---

## ۵) وضعیت و تحویل

# 🧭 شناسنامهٔ همکاری — هر چیزی که تا امروز از «تو» یاد گرفته‌ام

> **این فایل چیست؟** خلاصهٔ کاملِ تو و پروژه، که در یک چت تازه کافی است فقط همین فایل را بدهی و هیچ‌چیز از اول تکرار نشود.
> **طریقهٔ استفاده:** در شروع هر چت جدید فقط همین را بگو:
>
> «فایل‌های `/home/user/HANDOFF.md` و `/home/user/RULES.md` را بخوان و طبقشان کار کن — و ادامهٔ کار سایت «بازارچه ایران» را از همان‌جا که مانده بگیر.»
>
> (این فایل را همیشه به‌روز نگه دار؛ مسیر یکتای آن: `/home/user/HANDOFF.md`)
>
> 🔧 **آخرین اصلاح:** ۲۰۲۶-۰۸-۲۴ — آدرس گیت‌هاب، نسخهٔ جاری (v76)، و موارد بسته‌شده.
> قوانین رفتاری جدید در `/home/user/RULES.md` است (پرامپت دقیق‌شده + تقسیم کار).

---

## ۱) تو کی هستی و محیطت چیست

- زبان تو: **فارسی** — همیشه به فارسی جواب بگیر؛ کد و نام متغیر و کامیت‌ها انگلیسی.
- منطقهٔ زمانی تو: **Asia/Tehran** (تاریخ‌ها را با این بسنج، نه دادهٔ آموزشی مدل).
- روی **گوشی اندروید** کار می‌کنی؛ سایت باید با **Pydroid 3** اجرا شود → یعنی **فقط کتابخانهٔ استاندارد پایتون، بدون هیچ pip/وابستگی**، و پایگاه داده SQLite.
- ✅ **مخزن گیت‌هاب تو (آدرس اصلاح‌شده ۲۰۲۶-۰۸-۲۴): `https://github.com/rezadb369-wq/369.git`** — حساب `rezadb369-wq`.
  - تنها ریپوی عمومی این حساب: `369`. ریپوهای `963` و `film` که قبلاً ثبت شده بود، زیر این حساب **وجود ندارند** (با API گیت‌هاب بررسی شد).
  - وضعیت ریپو در ۲۰۲۶-۰۸-۲۴: یک برنچ (`main`)، یک کامیت (`544bb1f`, ۱۳:۴۰ +۰۳۳۰) با `README.md` و `bazarche-najafabad-v76 (1).zip`. **دیتابیس داخل ریپو نیست** (خطر قدیمی بسته شد).
  - ❌ آدرس قدیمی و غلط که در فایل‌ها بود: کاربر `g9742888-droid` — دیگر استفاده نشود.
- تو توسعه‌دهندهٔ رسمی نیستی؛ با یک عامل هوش مصنوعی سایت را می‌سازی و تحویل می‌گیری. پس توضیح‌ها باید ساده، صادقانه و بدون اصطلاحات سنگین باشد.

## ۲) پروژه در یک نگاه

- **«بازارچهٔ ایران»** — اول «بازارچهٔ نجف‌آباد» بود، حالا **سراسری** شده: دایرکتوری/مارکت‌پلیس کسب‌وکارهای ایران، شبیه **دیوار**.
- هدف: بازدیدکننده باید «وای» بگوید؛ هم **مغازه‌دار** پنل غنی داشته باشد هم **مشتری**.
- مسیر پروژه در ورک‌اسپیس: `/home/user/site/bazarche/bazarche` (از زیپ v76 استخراج شد؛ جزئیات فنی کامل در فایل‌های خود سایت است: `ARCHITECTURE.md`، `README.md`، `HANDBOOK.md` و…).

## ۳) خط‌قرمزهای تو (هرگز نشکن)

1. **«دروغ نگو»** — مهم‌ترین قانون. هرگز نگو «درست شد» مگر اینکه واقعاً تستش کرده باشم: curl با کد وضعیت، مرورگر برای خطای کنسول، چک دیتابیس. اگر کاری را انجام ندادم یا نشد، صادقانه بگویم.
2. **موبایل‌اول از همه‌چیز مهم‌تر است.** هر تغییری باید در ۳۶۰/۳۹۰/۴۱۲ پیکسل تست شود: بدون سرریز افقی، هدف‌های لمسی ≥ ۴۴ پیکسل، فونت بدن ۱۴ پیکسل (هیچ متن غیرضروری زیر ۱۲ پیکسل).
3. **صفحهٔ اول = مهم‌ترین بخش دیده‌شدن.** «سایت اول خیلی مهمه، مهم‌ترین بخش دیده شدنه». هیرو و ظاهر اول همیشه اولویت اول‌اند.
4. **«لوپ ۲۰ بار»** — بعد از تمام‌شدنِ هر کار، دوباره از اول بگرد دنبال اشکال واقعی؛ زود جمع‌ش نکن.
5. **«اجازه نپرس»** — کار را انجام بده، منتظر تأیید نمان (فقط در ابهام‌های واقعاً مهم بپرس).
   ⚖️ **استثنای جدید (۲۰۲۶-۰۸-۲۴):** برای پیام‌های چنددستوری، اول برنامه بفرست (`RULES.md` قانون ۲)؛ اگر جواب ندادی، از بخش ۱ شروع می‌کنم.
6. **هر نسخه یک زیپ تازه با نام جدید** — بدون دیتابیس (`data/` هرگز داخل زیپ/ریپو نرود).
7. **معماری برایت مهم است** — لایه‌ها تمیز، بدون «خدا-فایل»، مستند.
8. **امنیت اولویت همیشگی است** — «تست نفوذ قدرتمند» همیشه در برنامه باشد.

## ۴) سبک ارتباطی تو (که یاد گرفته‌ام)

- پیام‌هایت کوتاه، مستقیم و فارسی محاوره‌ای است (گاهی بدون نقطه‌گذاری).
- عصبانی/ناراضی شدن را با تکرار موضوع و جمله‌های کوتاه نشان می‌دهی. در این حالت: اول مشکل را دقیق قبول کن، ریشه را پیدا کن، درستش کن، بعد با مدرک نشان بده.
- راست‌گویی را تحسین می‌کنی حتی وقتی خبر بد است.
- با اسکرین‌شات از گوشی خودت گزارش می‌دهی (فایل‌ها در `/home/user/uploads/`).
  🔧 **اصلاح:** در این محیط ایجنت **می‌تواند تصویر پیوست را ببیند** (`read_file`)؛ پس اسکرین‌شات را واقعاً نگاه می‌کنم **و** علاوه بر آن، ابعاد/موقعیت عناصر را در مرورگر اندازه می‌گیرم.
- **قبل از اجرا تحقیق کن** — برای هر تغییر مهم، اول منابع (استانداردهای ۲۰۲۶، MDN، web.dev…) را بیاور، بعد پیاده کن.
- اعداد و نتیجهٔ تست را می‌خواهی ببینی («چند آزمون، چند موفق/ناموفق»).
- از شتاب‌زدگی بدت می‌آید: «خیلی زود تمام می‌کنی — دقیق‌تر». **کامل بودن بر سریع بودن مقدم است.**

## ۵) تصمیم‌ها و سلیقه‌هایی که ثبت شده

- **الگوی دیوار**: انتخاب شهر/استان، چت درون‌برنامه‌ای، علاقه‌مندی، مرتب‌سازی، عکس‌دار بودن.
- **ویرایش از سایت عمومی حذف شد** — ویرایش فقط در پنل.
- **آیکون‌ها:** کیفیت از حجم مهم‌تر است؛ کوانتیزاسیون/سیاه‌کردن شفافیت ممنوع. آیکون‌های تأییدشده را دوباره «بهینه» نکن.
  🔧 **وضعیت v76:** sprite سنگین از بسته حذف شده و هیرو CSS شده — پس این نکته فقط برای بازگرداندن آیکون‌ها معتبر است.
- **صفحهٔ اول**: تم تیرهٔ زمردی برای امکانات؛ هیرو باید مدرن و کاملاً ایرانی باشد (کاشی فیروزه‌ای، قوس ایرانی، نستعلیق، معماری معاصر) — نه کلیشهٔ شتر/کویر/فانوس.
  🔧 **وضعیت v76:** `hero.mp4` به‌دلیل سرعت حذف شد و هیروی سبک CSS جای آن را گرفت (بار اول ۳۹۰px ≈ ۳۸۷KB). اگر ویدیو را خواستی، باید سبک‌تر از این باشد.
- **پشتیبانی:** تنها کانال عمومی **تیکت** است (تماس/واتساپ پشتیبانی حذف شد)؛ ویجت شناور مهمان را به ورود و کاربر را به تیکت‌هایش می‌برد.
- **قیمت کالاها** در نصب تازه **خاموش** است (`prices_enabled=0`) و فقط مدیر روشنش می‌کند؛ `/prices` در حالت خاموش 404 است.
- تو می‌خواهی **خودت** با ابزار هوش مصنوعی ویدیو/عکس بسازی و به من بدهی (پرامپت از من، تولید از تو، تنظیم نهایی از من).

## ۶) تاریخچهٔ کوتاه

- v23→v42: ممیزی امنیتی اول → آپلود/Leaflet/موبایل → پنل و رمز PBKDF2 → حساب مشتری و سفارش و چت → حذف ویرایش عمومی → OTP امن → چهار قابلیت خواستنی → استوری سراسری → تست نفوذ → رفع زوم موبایل → بازمعماری → سراسری‌سازی ۳۱ استان/۳۵۳ شهر → داشبوردها → دسته‌های ملی → آیکون sprite → هیروی اسکرولی و ویدیو.
- v72: اعلان‌ها و پیشنهادهای جست‌وجو. • v73: پیام‌رسان سه‌نقشی + فایل خصوصی. • v74: علاقه‌مندی یکپارچه. • v75: قیمت اختیاری و بودجهٔ بار اول.
- **v76 (نسخهٔ فعلی داخل ریپو)**: سرعت (حذف ویدیو/sprite، ‑۸۷٪)، نوار پایین شیشه‌ای، تیکت امن با پیوست، نقشه با ۱۷۳ دسته و «نزدیک من»، `/item/<id>`، سبد با تعداد، رضایت تلفن، لغو دومرحله‌ای. گزارش: `REPORT-v76.md` (۲۹/۲۹ مجموعه).

## ۷) وضعیت فعلی (۲۰۲۶-۰۸-۲۴، همه با اجرا بررسی شد)

- نسخهٔ تحویلی: **`bazarche-najafabad-v76 (1).zip`** در ریپوی 369 → استخراج‌شده در `/home/user/site/bazarche/bazarche` (۳۰۸ فایل، ۶.۲MB).
- اجرا در این ورک‌اسپیس: `cd /home/user/site/bazarche/bazarche && python3 run.py` → پورت **8080** روی `0.0.0.0`.
  کدهای وضعیتِ بررسی‌شده: `/`=200، `/catalog`=200، `/map`=200، `/login`=200، `/item/...`=200،
  `/prices`=404 (قیمت خاموش)، `/panel` بدون کلید=**403** و با کلید=**200**.
- کلید پنل این نصب محلی (فقط همین ورک‌اسپیس): از `python3 -c "import sys;sys.path.insert(0,'server');import db;print(db.owner_token())"`.
- DB تازه: **۶۱ جدول، ۱۷۳ دسته، صفر کسب‌وکار** → بعد از `python3 tools/seed_demo.py`: ۱۰ کسب‌وکار، ۳۱ کالا، ۱۹ نظر.
- آزمون‌ها: `tools/` شامل ۴۱ فایل است که **۲۴ تای آن‌ها `test_*.py`** هستند؛ گزارش v76 مدعی **۲۹/۲۹ مجموعهٔ موفق** است. بعد از هر تغییر، مجموعه‌ها را واقعاً اجرا کن.
- ⚠️ `ARCHITECTURE.md` و `README.md` داخل بسته هنوز قدیمی‌اند (سرِ v36 / v2–v3) — یک دور به‌روزرسانی سند لازم است.
- سرور و پکیج‌ها بین پیام‌ها نمی‌مانند؛ در شروع هر سشن دوباره راه‌اندازی کن.

## ۸) کارهای همیشگیِ خودِ تو (یادآوری در هر تحویل)

1. **چرخاندن توکن پنل مالک** — از پنل: «تولید کلید جدید» (به‌ویژه اگر لینک پنل جایی منتشر شده).
2. ~~حذف `data/bazarche.db` از ریپوی 369~~ → ✅ در ریپوی فعلی دیتابیسی نیست؛ فقط مراقب باش در آپلودهای بعدی وارد نشود.
3. **روی دامنهٔ واقعی**: تنظیم `site_url` + کلید پیامک (بدون کلید پیامک، ورود آنلاین ممکن نیست؛ کد فقط آفلاین روی صفحه می‌آید).
4. آیندهٔ نیازمند هاست + HTTPS: درگاه زرین‌پال، پوش‌نوتیفیکیشن.

## ۹) نکته‌های فنی که نباید در چت تازه فراموش شود

- نسخهٔ کش: هر نسخه `?vNN` در CSS/JS و `VERSION` در `site/sw.js` را بالا ببر (فعلی: v76).
- sprite آیکون‌ها: **هرگز** کوانتیزاسیون/`convert("RGB")` نکن (شفافیت را سیاه می‌کند).
- زیپ همیشه بدون `data/`، `raw/`، `shots/`، `__pycache__`.
- بعد از هر تغییر: `node --check` روی JS، اجرا شدن مجموعه‌های تست، و اسکن موبایل (۳۶۰/۳۹۰/۴۱۲).

## ۱۰) موارد باز و مبهم

1. **اسناد کهنهٔ داخل بسته** (`ARCHITECTURE.md` سرِ v36، `README.md` سرِ v2/v3) — بازنویسی بر اساس v76.
2. **نام زیپ**: هنوز `bazarche-najafabad-vNN.zip` است در حالی که سایت «بازارچهٔ ایران» شده — تصمیم با تو.
3. **موارد موبایل معلق** (از ممیزی‌های قدیمی): متن‌های ۱۰–۱۱ پیکسلی، بیرون‌زدگی چند پیکسلی tilt کارت‌ها در ۳۲۰px، پنل «همین حالا باز هستند» در موبایل.
4. **روش تحویل روی گیت‌هاب**: الان فقط یک زیپ در ریپو آپلود می‌شود (بدون تاریخچهٔ فایل‌ها). اگر بخواهی، می‌توانم درخت واقعی فایل‌ها را کامیت کنم تا diff هر نسخه دیده شود.

---

## ۶) ممیزی اصلاح‌شده (v90)

# 🔍 گزارش ممیزی فاز ۰ (اصلاح‌شده) — v90 (۲۰۲۶-۰۸-۲۵)

> ⚠️ نسخهٔ اول این گزارش چند نقص را **اشتباه** گزارش کرد (ابزار ممیزی خام بود:
> پس‌زمینه را اشتباه تشخیص می‌داد و label را نمی‌دید). این نسخه با اندازه‌گیری درست اصلاح شده.

## آنچه واقعاً سالم است ✅
- **کنتراست:** muted `#9fb0d0` روی همهٔ پس‌زمینه‌های واقعی = **۶٫۸–۸٫۶:۱** (WCAG AA ✅). اعداد ۲٫۴–۳٫۷ نسخهٔ قبل false-positive بودند.
- **ورودی جست‌وجو** label دارد (`<label class="sr-only" for="cq">`).
- **`.input`** از قبل `min-height:46px` دارد.
- **سرریز افقی ۰** (۸ صفحه×۳ عرض)؛ فونت <۱۲px هیچ؛ تصویر شکسته ۰.
- **هدرهای امنیتی** قوی (CSP/nosniff/XFO/Referrer/Permissions).
- **کارایی پایه از قبل خوب است:** gzip پیش‌فشرده، ETag/304، کش immutable برای fonts/vendor/img، lazy-load تصاویر (۱۴/۲۱)، asset نسخه‌دار `?v89`.

## فرصت‌های واقعی (نه باگ) ℹ️
1. **کارایی — تفکیک CSS:** pages.css ۱۶۰KB + main.css ۹۴KB هر صفحه بار می‌شوند؛ split/purge per-page سود دارد ولی ریفکتور بزرگ/پرریسک و نیازمند تأیید مرورگری. (immutable‌کردن css/js توصیه نشد: ۷ ارجاع بی‌نسخه دارد و ETag/304 هست.)
2. **قابلیت‌های افزوده (ارزش واقعی):** تم روشن؛ prompt نصب PWA (الهام از دیوار)؛ JSON-LD برای SEO؛ نمایشگر استوری؛ خوشه‌بندی نشانگر نقشه.
3. **هدف لمسی کوچک روی نقشه:** zoom کنترل Leaflet ~۱۸px — با یک قاعدهٔ CSS به ۴۴px می‌رسد (کوچک، بی‌ریسک).
4. **متن hero:** تیتر کمی شعاری است؛ بازنویسی عینی (سلیقه‌ای).

## نتیجهٔ صادقانه
سایت از نظر بصری/دسترس‌پذیری/امنیت/کاراییِ پایه **وضعیت خوبی دارد**. کار ارزشمندِ باقی‌مانده عمدتاً **افزودن قابلیت و طراحی** است، نه رفع باگ.

---

## ۷) برنامهٔ ارتقاء

# 🗺️ برنامه ارتقاء و بازبینی جامع «بازارچهٔ ایران» — v90+

> منبع: دانش‌نامهٔ اصلی + RULES.md + استانداردهای ۲۰۲۶ (Core Web Vitals، WCAG 2.2)
> + قابلیت‌های جدید (Stop Slop، UI/UX ProMAX، FireCrawl، Remotion).
> قانون حاکم: **هیچ چیزی جا نماند.** هر مورد «معیار پذیرش» + «اولویت» دارد.
> P0=همین حالا · P1=این نسخه‌ها · P2=بعدی · 🧊=موکول (نیازمند هاست+HTTPS)

---

## اصول حاکم (خط‌قرمز، همیشه)
- دروغ نه؛ هر «درست شد» با مدرک (curl / مرورگر / چک DB).
- موبایل‌اول ۳۶۰/۳۹۰/۴۱۲: سرریز صفر، لمس ≥۴۴px، فونت بدن ۱۴px.
- صفحهٔ اول مهم‌ترین سطح دیده‌شدن است.
- هیچ کنترل/لینک/متن نمایشی یا مرده نماند.
- سایت سبک‌تر؛ هر زیپ بدون `data/`؛ معماری لایه‌ای؛ امنیت اول.

---

## فاز ۰ — بازبینی/ممیزی (قبل از هر تغییر) [P0]
- [x] ۰٫۱ ممیزی بصری: `shot_sweep.py` (۴ نقش × ۳۶۰/۳۹/۴۱۲) + اسکرین‌شات تک‌تک صفحات؛ فهرست هر ناهنجاری. (نصب مجدد pw-browsers لازم است)
- [x] ۰٫۲ ممیزی عملکرد: LCP/INP/CLS آزمایشگاهی برای خانه/کاتالوگ/کسب‌وکار/چت؛ جدول اعداد در برابر آستانه (LCP≤۲٫۵s، INP≤۲۰ms، CLS≤۰٫۱).
- [x] ۰٫۳ ممیزی دسترس‌پذیری WCAG 2.2 AA: کنتراست ۴٫۵:۱، لمس ≥۲۴/۴۴، label ورودی‌ها، focus visible + Focus‑Not‑Obscured، reduced‑motion، `lang`/`dir`.
- [x] ۰٫۴ ممیزی امنیت: هدرها (CSP/XFO/nosniff/Referrer)، سقف OTP، sniff آپلود، CSRF، rate‑limit، نشت مسیر داخلی در خطا.
- [x] ۰٫۵ ممیزی «نمایشی/مرده»: هر دکمه/لینک/کارت بی‌اثر یا متن جاگذاری → واقعی یا حذف.
- [x] ۰٫۶ ممیزی متن با **Stop Slop**: ریزمتن فارسی (دکمه‌ها، empty‑state، خطاها، hero) — انسانی، عینی، بدون شعار و قید زائد.
- [x] ۰٫۷ ممیزی طراحی با **UI/UX ProMAX**: پالت، ریتم بصری، فاصله‌ها، کامپوننت‌ها؛ تطبیق با Material‑3 نوار پایین.
- [x] ۰٫۸ تحقیق رقبا با **FireCrawl**: الگوهای دیوار/GBP/Yelp (کارت کسب‌وکار، جستجو، نقشه) برای benchmark.

## فاز ۱ — پرفورمنس [P1]
- [ ] بودجهٔ بار اول ≈۳۹۰px (هدف ≤۳۸۷KB) را دوباره اندازه بگیر؛ هر رجنیست را توجیه کن.
- [ ] lazy‑load تصاویر زیر خط دید + `decoding=async` + ابعاد صریح (CLS).
- [ ] حذف CSS مرده؛ critical‑CSS برای hero.
- [ ] SW: cache‑first برای اسپرایت/CSS؛ bump درست `?vNN`.
- [ ] فونت: زیرمجموعهٔ فارسی + `font-display:swap`.

## فاز ۲ — طراحی/UX [P1]
- [ ] **تم روشن** / `prefers-color-scheme` (بازماندهٔ شناخته‌شده؛ الان فقط تیره).
- [ ] تعمیم زبان Material‑3 نوار پایین به هدر موبایل و تب‌ها.
- [ ] hero: تیتر/لید با Stop Slop بازنویسی؛ CTA شفاف.
- [ ] جستجو: پیشنهاد زنده، جستجوهای اخیر، حالت خالی/بی‌نتیجهٔ انسانی.
- [ ] کارت کسب‌وکار: بج/امتیاز/ساعت یکدست؛ story‑ring هماهنگ.

## فاز ۳ — قابلیت‌ها [P1]
- [ ] SEO: JSON‑LD (LocalBusiness) برای صفحهٔ کسب‌وکار، OpenGraph/Twitter، sitemap به‌روز.
- [ ] چت: نشانگر «در حال نوشتن»، گالری پیوست‌ها، خوانایی حباب‌ها.
- [ ] استوری: viewer تمام‌صفحهٔ روان + نوار پیشرفت + expiry ۲۴h شفاف.
- [ ] نقشه: خوشه‌بندی نشان‌ها در تراکم بالا؛ «نزدیک من» دقیق.
- [ ] رفع **405 به‌جای 404** (بازماندهٔ شناخته‌شده).

## فاز ۴ — پنل‌ها/ادمین [P2]
- [ ] داشبورد مالک/ادمین: کارت‌های آماری لینک‌دار (انجام‌شده v78) → تکمیل با نمودار روند هفتگی.
- [ ] چک‌باکس‌های متراکم پنل → فاصلهٔ WCAG (بازماندهٔ شناخته‌شده).
- [ ] گزارش‌گیری: پرمخاطب‌ها، نرخ تبدیل گفتگو، استوری‌های پربازدید.

## فاز ۵ — محتوا/استاندارد [P2]
- [ ] بازنویسی `ARCHITECTURE.md` و `README.md` (سرِ v36/v2؛ بازماندهٔ شناخته‌شده).
- [ ] یکسان‌سازی نام زیپ: «نجف‌آباد» vs «ایران» (بازماندهٔ شناخته‌شده).
- [ ] بازبینی WHATS‑NEW/ROADMAP تا با وضعیت واقعی v89 هم‌راستا شود.

## فاز ۶ — تست/سخت‌سازی [P0 همراه هر تغییر]
- [ ] گسترش suiteها برای قابلیت‌های جدید (چت typing، استوری viewer، JSON‑LD).
- [ ] نگه‌داشتن همهٔ مجموعه‌ها روی ۰ ناموفق (test_all/actions/gates/tickets/discovery).
- [ ] اسکن موبایل خودکار بعد از هر تغییر بصری (بدون سرریز/لمس/فونت).

## فاز ۷ — خروجی/تحویل [هر نسخه]
- [ ] زیپ تازه بدون `data/` + bump `?vNN`/`sw.js` + ثبت در CLAUDE.md + آپلود به ریپوی 369.
- [ ] چک‌لیست دامنهٔ واقعی: `site_url`، کلید پیامک، چرخاندن توکن پنل (G).

## 🧊 موکول (نیازمند هاست+HTTPS)
- [ ] پرداخت زرین‌پال · [ ] پوش‌نوتیفیکیشن.

## 🧰 ابزارهای جدید و نقش هرکدام
| ابزار | نقش در این برنامه |
|---|---|
| Stop Slop | فاز ۰٫۶ + همهٔ ریزمتن‌ها |
| UI/UX ProMAX | فاز ۰٫۷ + فاز ۲ |
| FireCrawl | فاز ۰٫۸ (تحقیق رقبا) + ممیزی صفحه‌های JS‑سنگین |
| Remotion | خروجی اختیاری: تیزر/موشن معرفی بازارچه برای اینستاگرام |

## ترتیب پیشنهادی
۰ (ممیزی) ← ۱ (پرفورمنس) ← ۲ (طراحی) ← ۳ (قابلیت) ← ۴/۵ ← ۶/۷ همراه هر فاز.
هر فاز که تمام شد تیک می‌خورد و برنامهٔ به‌روز دوباره نمایش داده می‌شود (قانون ۲).

---

# بخش I — به‌روزرسانی v90→v108 + وضعیت جاری (برای شروع صفحهٔ تازه)

> این بخش، شکاف بین نسخهٔ v90 (بدنهٔ بالا) و وضعیت واقعی فعلی v105 را پر می‌کند.
> ترتیب خواندن در چت تازه: ۱) HANDOFF.md ۲) RULES.md ۳) CLAUDE.md (لاگ کامل) ۴) همین فایل.

## I.۱) حقایق جاری (v108)
- منبع حقیقت: `https://github.com/rezadb369-wq/369.git`؛ تنها ریپوی حساب `369` است؛ **هرگز** `data/`، دیتابیس، توکن یا shots داخل ریپو/زیپ نرود.
- سورس: `/home/user/site/bazarche/bazarche`. اجرا: `python3 run.py` (پورت 8080). نکته: `app.py` گارد `__main__` ندارد؛ نقطهٔ ورود سرو `run.py` است (خودش `server/` و `tools/` را به sys.path اضافه و روی 0.0.0.0:8080 می‌بندد).
- آماده‌سازی تست مرورگری: `bash /home/user/setup-dev.sh` (نصب pylibs+pw-browsers، قابل بازتولید؛ بعد از تست پاک شود تا ورک‌اسپیس سبک بماند).
- تست سروری: `python3 tools/test_all.py` → **۱۵۳/۰** در v108. تست سطل بازیافت: `python3 tools/test_trash.py` → **۲۸/۲۸**. تست مرورگری: `PYTHONPATH=/home/user/pylibs PLAYWRIGHT_BROWSERS_PATH=/home/user/pw-browsers …`.
- تحویل: `bazarche-najafabad-vNN.zip` بدون `data/`. مارکرها: `?vNN` (×۳۶) و `site/sw.js = bazarche-vNN`.
- فعلی: **v108**، `?v108` ×۳۶، `sw bazarche-v108`، zip sha `2e9f4003` (۳۳۹ فایل).
- ورود مالک برای تست: OTP — POST `/login {phone}` سپس خواندن `code` از جدول `otp` و POST `/login/verify`. کلید پنل: `python3 -c "import sys;sys.path.insert(0,'server');import db;print(db.owner_token())"`.

## I.۲) معماری کلیدی (افزوده‌های v90→v107)
- **تم**: `<html data-theme="luxury" (تیره) | "light" (روشن)>`. توکن‌ها `tokens.css`؛ override روشن `theme-light.css` (کنتراست AA). دکمهٔ تم در `app.js`: از v104 آیکون **حالت فعلی** را نشان می‌دهد (شب=ماه، روز=آفتاب) — نه حالت مقصد. `html.theme-fade` (۳۸۰ms) برای محو شدن نرم رنگ‌ها هنگام تغییر تم. ذخیره در `localStorage['bz-theme']` + اسکریپت زودهنگام head.
- **استوری**: جدول `stories(biz_id,image,kind,caption,created,expires,duration REAL)`. جدول ناشناس `story_views(story_id, ts)` — بدون هیچ شناسه/تلفن/IP (حریم خصوصی، فقط شمار تجمیعی).
  - `POST /api/stories/<id>/view` ثبت بازدید ناشناس (در `route_post`، نه multipart). `GET /my/story/<id>/views` (فقط مالک) → `{total,last24h,per_day}`.
  - `/api/stories` مقدار `duration` را برمی‌گرداند. محدودیت استوری = **۳۰ ثانیه** (نه حجم)؛ کپ ۲۰MB حذف شد (MAX_BODY=30MB فقط سد امنیتی).
  - پخش‌کننده `stories.js::openGroup`: موتور پیشرفت **زمان‌واقعی** با `requestAnimationFrame` — عرض نوار فعال هر فریم از `video.currentTime/duration` (یا زمان سپری‌شده برای تصویر/WebM بدون هدر)؛ pause با `visibilitychange`؛ ۱۰۰٪ در پایان؛ safety timeout. ریل فعال نیمه‌شفاف (۰٫۳۵) تا لایهٔ سفید دیده شود.
  - پیش‌نمایش استوری خودی در پنل: `[data-story-preview]` → openGroup؛ استوری فروشنده در صفحهٔ کسب‌وکار: `[data-story-biz]`.
- **فشرده‌سازی سمت کلاینت** `site/assets/js/compress.js` (`window.BazarcheCompress`): تصویر=canvas→JPEG q0.82 تا ۱۶۰۰px (همیشه، حتی اگر بزرگ‌تر)؛ ویدیو=MediaRecorder (canvas+ترک صوتی منبع، vp9/vp8+opus) با برش ≤۳۰s قبل از آپلود (UI اسلایدر شروع/پایان)؛ فرم‌های `data-compress` خودکار وصل می‌شوند با «در حال فشرده‌سازی…» + پیش‌نمایش + «لغو». `chat.js` و `upload.js` هم همیشه re-encode می‌کنند. سرور `uploads.optimize_image/optimize_video` (Pillow اختیاری/ffmpeg) به‌عنوان safety-net.
- **آپلود با پیشرفت واقعی**: `window.UpBar` + `uploadWithProgress` (XHR `upload.onprogress`) در app.js؛ فرم‌های multipart با فایل (غیر `data-upload`) خودکار از این مسیر می‌روند.
- **چت**: فقط عکس (`views_chat.ACCEPT` jpeg/png/webp/gif)؛ تیک ارسال/خواندن؛ جداکنندهٔ روز.
- **نوار پایین**: استاندارد تمام‌عرض مات (v94/v97)، ۵ اسلات؛ اسلات ۴ همیشه «پنل دکان»(/my).
- **پنل‌ها**: «پنل دکان»(/my) کسب‌وکاری، «پنل من»(/me) شخصی؛ پنل ادمین `/panel` با Ctrl+K (v93).
- **سطل بازیافت (v105، حذف نرم ۷ روزه)**: جدول `trash(entity, ref_id, biz_id, title, payload=JSON کل سطر, deleted_at)` + ایندکس. توابع `delete_review`/`delete_item`/`delete_report` (db.py) و `features.story_delete` **قبل از** حذف قطعی، کل سطر را با `trash_put` در سطل ذخیره می‌کنند. `TRASH_DAYS=7`، `trash_put`، `trash_list(entities,biz_ids)`، `trash_restore(tid)` (بازگردانی با `INSERT OR REPLACE` از payload و سپس حذف از سطل)، `trash_purge()` (حذف قطعی ردیف‌های >۷ روز). مسیرها: `GET /my/trash`→`owner_trash` (مالک، فقط biz های خودش)، `GET /panel/trash`→`admin_trash` (ادمین، همه)؛ `POST /my/trash/<id>/restore` (مالک: سشن + بررسی مالکیت biz)، `POST /panel/trash/<id>/restore` (ادمین: کلید). `trash_purge()` هنگام شروع (make_server) و در جاروی ساعتی اجرا می‌شود. لینک nav: `OWNER_AREA_NAV` «/my/trash» + گروه «سیستم» ادمین «/panel/trash» (آیکن trash). **نکتهٔ امنیتی مهم**: احراز هویت POST ادمین از `self.admin_ok(form)`→`token_ok(form)` است که `key` را از **بدنهٔ فرم** می‌خواند نه query؛ پس فرم بازیابی ادمین باید `<input type="hidden" name="key">` داشته باشد (وگرنه ۴۰۳ حتی با کلید درست). بازیابی مالک سشن‌محور است و کلید نمی‌خواهد.

- **کارایی DB (v107)**: `connect()` یک اتصال مشترکِ هر thread برمی‌گرداند (`threading.local` + کلاس `_PersistentCon` که close() را بی‌اثر می‌کند) تا صدها `con.close()` موجود بدون تغییر کار کنند ولی اتصال بازاستفاده شود؛ صفحهٔ خانه از ≈۶۷ باز/بست اتصال به ۱ رسید (رندر ۵۸٫۹→۶٫۴ms).

## I.۳) تاریخچهٔ فشردهٔ v90→v107
- v90: ممیزی اصلاح‌شده (کنتراست AA)، JSON-LD کامل، prompt نصب PWA، zoom نقشه ۴۴px.
- v91: تم روشن (theme-light.css) + دکمهٔ تم + persistence.
- v92/v93: نوار آیکون شناور (رد شد)؛ Ctrl+K پنل.
- v94: نوار پایین مات از صفر (جایگزین شیشهٔ بد v92/v93).
- v95: استاندارد واکنش‌گرا (سرریز ۰ در ۳۶۰→۱۴۴۰) + رفع متن محو تم روشن.
- v96/v97: فونت‌های روز ۲۰٪ تیره‌تر (×۰٫۸)؛ نوار تمام‌عرض؛ فونت رنگی تیره‌تر.
- v98: فشرده‌سازی سرور (Pillow/ffmpeg) + تگ‌لاین هدر.
- v99: کامپرسور کلاینت compress.js + UX فشرده/لغو استوری.
- v100: فشرده‌سازی همیشه + محدودیت ۳۰s + برش + بازدید ناشناس story_views.
- v101: صدای استوری + پخش کامل ۳۰s (stories.duration) + پیش‌نمایش استوری خودی.
- v102: فاز۱ انیمیشن‌ها (نوار زمان، استوری فروشنده، fade تم).
- v103: **بازسازی** نوار زمان با rAF زمان‌واقعی (روش CSS حذف شد).
- v104: بررسی «برعکس بودن تم»: رنگ‌ها درست بودند؛ آیکون به حالت فعلی اصلاح شد.
- v105: **فاز ۲** — سطل بازیافت (حذف نرم ۷ روزه) برای استوری+محصول+نظر+گزارش با بازیابی در پنل مالک و ادمین. تست `tools/test_trash.py` ۲۸/۲۸؛ باگ احراز هویت فرم ادمین (کلید در بدنه) یافت و رفع شد.
- v106: رفع «منوی سه‌خط موبایل محو/گوشه»: همبرگر چهرهٔ دکمه گرفت (رنگ کامل + چیپ برند + قاب) و گارد ≤۴۰px تا ردیف هدر هرگز سرریز نکند و همبرگر نپرد زیر لبه. اسکرین‌شات ۳۲۰/۳۶۰/۴۱۲ تأیید کرد.
- v107: (۱) بعد از ورود، آیکون سبد از هدر موبایل حذف شد (در کشو و دسکتاپ می‌ماند) تا جا برای منو باز شود. (۲) **علت کندی پیدا و رفع شد**: هر کوئری یک connect/close جداگانهٔ SQLite بود (خانه ≈۶۷ اتصال!)؛ `connect()` حالا یک اتصال مشترک هر thread برمی‌گرداند (`_PersistentCon` با close بی‌اثر). رندر خانه ۵۸٫۹→۶٫۴ms و TTFB خانه ~۱۳۵→~۹ms.
- v108: رفع وارونگی متن بخش آپلود استوری (روز روشن/شب تیره): متن‌های `.cz-*` و آمار استوری از توکن پس‌زمینهٔ `--color-muted` به توکن متن `--color-muted-foreground` رفتند. + متن حالت روز ۵۰٪ تیره‌تر (foreground `#060a12`، muted `#242b35`) با تست واقعی Playwright تأیید شد.

## I.۴) قوانین رفتاری (خلاصه؛ متن کامل در RULES.md)
۱ حرف کاربر→پرامپت دقیق + نمایش کوتاه + اجرا. ۲ پیام بلند=تقسیم/فازبندی. ۳ منبع حقیقت=ریپوی 369. ۴ قوانین جدید فوراً در RULES/HANDOFF ثبت شود. ۵ اسکیل‌های معرفی‌شده (Stop Slop سبک نگارش؛ UI/UX ProMAX طراحی؛ FireCrawl تحقیق؛ Remotion ویدیو) جذب شدند — در Arena اسکیل خودکار لود نمی‌شود، ایجنت خودش باید بخواند. ۶ (v103) اگر راه‌حل به نتیجه نرسید به‌جای وصله، کلاً حذف و از نو با دقت ساخته شود؛ برای انیمیشن از گیت‌هاب بزرگ تحقیق شود؛ تست تا درست‌شدن ادامه یابد.

## I.۵) در صف (انجام‌نشده)
- ~~**فاز ۲**: حذف نرم با نگهداری ۷ روزه~~ — **انجام شد در v105** (سطل بازیافت استوری+محصول+نظر+گزارش، بازیابی در پنل مالک و ادمین، `tools/test_trash.py` ۲۸/۲۸).
- **فاز ۳**: استانداردسازی واکنش‌گرا موبایل/رایانه (۳۶۰/۳۹۰/۴۱۲ و دسکتاپ؛ نیازمند محیط مرورگر) + ارتقاهای پیشنهادی با تحقیق.
- بازماندهٔ قدیمی: `ARCHITECTURE.md`/`README.md` داخل بسته به‌روز نیستند؛ پنل شناور پشتیبانی، زرین‌پال، پوش‌نوتیفیکیشن (نیازمند هاست+HTTPS).

## I.۶) چک‌لیست تحویل هر نسخه
۱) bump `?vNN` (همهٔ server/*.py) + `sw.js`. ۲) `python3 tools/test_all.py`→۰ ناموفق. ۳) تست مرورگری واقعی (setup-dev.sh) + اسکرین‌شات. ۴) zip بدون data/ + sha. ۵) ثبت در CLAUDE.md. ۶) پاک‌سازی ابزار تست موقت. ۷) present_file.
