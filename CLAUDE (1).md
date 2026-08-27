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

## v91 (۲۰۲۶-۰۸-۲۶) — تم روشن (Light Theme)
- theme-light.css: override توکن‌های سطح/متن/شیشه/سایه زیر html[data-theme="light"] (کنتراست AA: متن ۱۵٫۶:۱، muted ۵٫۴:۱).
- دکمهٔ تعویض تم در هدر (app.js) + اسکریپت زودهنگام در head برای اعمال تم ذخیره‌شده بدون پرش (localStorage 'bz-theme').
- flip سطوح hard-code تیره (ورودی جست‌وجو، hero-mini، feat-band، کارت‌ها، گرادیان تیتر).
- تأیید بصری با playwright: کل صفحه روشن، persistence کار می‌کند.
- v90→v91؛ تست ۱۴۸/۰. zip: bazarche-najafabad-v91.zip (۳۳ فایل، بدون data، sha 0cb42358).

## v92 (۲۰۲-۰۸-۶) — بازطراحی نوار پایین (آیکون شناور)
- آیکون «home» جدید به sprite اضافه شد؛ «خانه» دیگر از store تکراری استفاده نمی‌کند.
- نوار پایین از رنگ‌های hard-code (theme-night: پس‌زمینهٔ تیرهٔ ثابت) به توکن برگشت تا در هر دو تم بدون تداخل با پنل‌ها/صفحه باشد.
- override روشن برای .site-header/.bottom-nav/.mobile-nav .panel (که theme-night تیره hard-code می‌کرد).
- تأیید بصری هر دو تم: نوار تیره در تاریک، روشنِ شیشه‌ای در روشن، حالت فعال فیروزه‌ای.
- v91→v92؛ تست ۱۴۸/۰. zip: bazarche-najafabad-v92.zip (۳۳ فایل، بدون data، sha fabbbb89).

## v93 (۲۰۲-۰۸-) — ارتقای پنل: جست‌وجوی سراسری (Ctrl+K)
- پالت فرمان در همهٔ صفحات پنل (panel_page): دکمهٔ «جست‌وجو Ctrl+K» در سربرگ +.modal.
- فهرست ۴۰ بخش پنل (OWNER_NAV) به‌صورت JSON تزریق و client-side فیلتر می‌شود؛ تایپ، «جست‌وجوی کسب‌وکار» هم پیشنهاد می‌دهد.
- میان‌برها: Ctrl/Cmd+K باز/بسته، Esc بستن، Enter رفتن به اولین نتیجه.
- CSS پالت در pages.css؛ JS سینتکس‌چک شد؛ رندر server-side تأیید (data-cmdk-root + ۴۰ بخش).
- v92→v93؛ تست ۱۴/۰. zip: bazarche-najafabad-v93.zip (۳۳ فایل، بدون data، sha b528cf16).

## v94 (۲۰۲-۰۸-) — بازطراحی کامل نوار پایین (از صفر)
- v92/v93 نوار شیشه‌ای/شفاف بود و متن صفحه از پشتش رد می‌شد (بدتر شد) → نسخه‌های بد حذف شدند.
- v94: نوار **مات** (background: var(--color-card)) بدون backdrop-filter؛ مرز + سایه؛ آیکون‌های خطی ضخیم‌تر (stroke 2, 23px)؛ حالت فعال پیل فیروزه‌ای.
- theme-night/theme-light دیگر نوار را شفاف نمی‌کنند (فقط هدر/درور).
- تأیید بصری هر دو تم: نوار جامد و خوانا، بدون bleed.
- v93→v94؛ تست ۱۴/۰. zip: bazarche-najafabad-v94.zip (۳۳ فایل، بدون data، sha ddd8f598). v92/v93 حذف شدند.

## v95 (۲۰۲-۰۸-) — استانداردسازی واکنش‌گرا + رفع متن‌های محو در تم روشن
- اسکن کنتراست (playwright) متن‌های hard-code روشن را که روی زمینهٔ روشن محو می‌شدند پیدا و با override تم روشن اصلاح کرد: btn-glass، باند CTA/feat، eyebrow طلایی/فیروزه‌ای، hero-badge، منوی موبایل، nav-count.
- موارد false-positive (متن سفید روی دکمهٔ فیروزه‌ای/گرادیان) دست‌نخورده ماندند.
- واکنش‌گرایی: سرریز افقی ۰ در عرض‌های ۳۶۰/۳۹۰/۴۱۲/۷۶/۱۰۲۴/۱۲۰/۱۴۴۰ روی صفحه‌های کلیدی → استاندارد موبایل+رایانه.
- v94→v95؛ تست ۱۴/۰. zip: bazarche-najafabad-v95.zip (۳۳ فایل، بدون data، sha b15a18bc).

## v96 (۲۰۲-۰۸-) — حالت روز: فونت‌ها ۲۰٪ تیره‌تر
- توکن‌های متن تم روشن دقیقاً ۲۰٪ تیره‌تر شدند (ضرب RGB در ۰٫۸):
  --color-foreground و --color-card-foreground: #10192e → #0d1425
  --color-muted-foreground: #5b6b85 → #49566a
- همهٔ متن‌ها (بدنه/تیتر/ثانویه) از این توکن‌ها می‌خوانند → یکنواخت تیره‌تر.
- v95→v96؛ تست ۱۴/۰. zip: bazarche-najafabad-v96.zip (۳۳ فایل، بدون data، sha 3304158d).

## v97 (۲۰۲-۰۸-) — نوار پایین استاندارد + ۲۰٪ تیره‌ترِ دوباره (فونت رنگی)
- نوار پایین از «پیل شناور گرد» به **نوار تب استاندارد تمام‌عرض** تبدیل شد: چسبیده به لبهٔ پایین (inset-inline:0; bottom:0)، مات، border-top، بدون شناوری؛ padding فوتر برای جلوگیری از پوشش.
- حالت روز: فونت‌های رنگی ۲۰٪ تیره‌تر (توکن‌های primary/success/info/danger + brand-200/300/400 و accent-300/400 ×۰٫۸؛ eyebrowها تیره‌تر).
- تأیید بصری: نوار تمام‌عرض (l:0,w:390,b:0)؛ رنگ‌ها تیره‌تر و خواناتر.
- v96→v97؛ تست ۱۴/۰. zip: bazarche-najafabad-v97.zip (۳۳ فایل، بدون data، sha 905016ae).

## v98 — day-text dark + header tagline + on-site media compression (sha d1ac2958, 333 files, 148/0)
- theme-light.css: appended `.brand-text small{color:#5b6b85}` (lighter tagline on light header bg rgba(255,255,255,.9); user premise of dark bg was false).
- server/uploads.py: added optional Pillow recompression `optimize_image` (resize to <=1600px + re-encode q82/optimize; keeps only if smaller) wired into save_image + save_media images; `optimize_video` best-effort via ffmpeg when present. Falls back to dependency-free metadata strip when Pillow absent (Pydroid: `pip install Pillow`).
- Verified: 3000x2000 JPEG 655KB -> 115KB (82.5% smaller, 1600px, valid). Bumped ?v97->?v98 (x34), sw bazarche-v98.

## v99 — client-side media compressor + compress/cancel UX on stories (sha d1a7c904, 334 files, 148/0)
- New site/assets/js/compress.js: in-browser compressor (window.BazarcheCompress). Images: canvas resize to 1600px + JPEG q0.82. Video: best-effort re-encode (canvas.captureStream + MediaRecorder vp9/webm, ~1.2Mbps, <=60s) with fallback to original (server ffmpeg still applies). No external/WASM lib.
- Auto-wires any form[data-compress]: shows «در حال فشرده‌سازی…» + progress, swaps compressed bytes via DataTransfer, shows preview + «لغو» cancel-before-publish, disables submit while busy.
- Wired both story forms in views_owner.py (data-compress + data-compress-input); COMPRESS_JS added to owner shell() so it loads on dashboard + /my/stories. CSS .cz* in pages.css.
- Chat already image-only + compressing + cancel (chat.js); verified only the 2 story_media inputs accept video/* (views_owner.py:491,1558); chat ACCEPT image-only.
- Browser E2E (Playwright, OTP owner login): 617KB jpg -> 107KB, «۶۰۳ کیلوبایت ← ۱۰۵ کیلوبایت», preview shown, cancel clears file, 0 JS errors. node --check compress.js OK.
- Bumped ?v98->?v99 (x35), sw bazarche-v99.

## v100 — always-compress + 30s story limit + trim + anonymised story views (sha 159ee856, 334 files, 148/0)
- compress.js v100: EVERY image/video re-encoded (never skipped, even if not smaller). VID_MAX_S=30; a clip >30s opens a trim UI (start/end range sliders, clamp <=30s) so the user picks the segment BEFORE upload; compressVideo seeks to start, records to end. chat.js + upload.js also always re-encode now.
- Removed the 20MB story cap in uploads.save_media (real rule = 30s; uploads.MAX_BODY 30MB stays only as a server safety net). Hint text now «هر استوری حداکثر ۳۰ ثانیه».
- Anonymised story views: new table story_views(story_id, ts) — NO customer/phone/IP. features.story_view_add/counts/stats. POST /api/stories/<id>/view (route_post, NOT multipart) records a view; stories.js fires it on each item shown. GET /my/story/<id>/views (owner-only) returns {total,last24h,per_day} aggregate only. owner_stories page shows count + «بازدیدها» button -> panel with counts + confidentiality note.
- Research: MediaRecorder trim via currentTime seek before start (vidcompress.com); aggregate-only anonymised analytics is truly anonymous / data-minimisation (countly, matomo).
- Tests: unit (21MB video accepted; stats aggregate-only) + Playwright E2E (VID_MAX_S=30, trim markup, image->JPEG, video->webm, view POST increments to 5, panel shows count+محرمانه, 0 JS errors). test_all 148/0. node --check all JS OK.
- Bumped ?v99->?v100 (x35), sw bazarche-v100.

## v101 — story sound + full 30s playback + owner self-preview (sha fd3e1a57, 335 files, 150/0)
User-reported bugs fixed:
- NO SOUND: compress.js recorded from canvas.captureStream only (silent) and the viewer was muted. Fix: mix the source audio track into the MediaRecorder stream (vp9/vp8+opus) and viewer plays with muted=false (autoplay-policy fallback to muted). Verified: compressed clip keeps 1 audio track.
- SHOWED <10s of a 30s clip: the viewer hard-capped video at setTimeout(next,15000) and MediaRecorder WebM has no duration header. Fix: store stories.duration (new column, seconds, clamped <=30), send it from compress.js via a hidden `duration` field, return it in /api/stories, and the viewer now times the advance from the stored duration. Verified: duration=30 stored + returned.
- COULDN'T VIEW OWN STORY: owner_stories rows are now clickable ([data-story-preview] JSON -> openGroup), stories.js loaded on /my/stories, thumbnail shows a ▶ tag for video and the row shows «N ثانیه». Verified: preview opens the viewer, video muted=false.
- DB: stories.duration REAL (schema + ALTER migration); features.stories_add(duration=0); stories_for_owner now returns bizslug.
- Tests: unit (duration stored) + Playwright E2E (audio track kept, duration in API, owner preview + unmuted, 0 JS errors). test_all 150/0. node --check OK.
- Bumped ?v100->?v101 (x36), sw bazarche-v101.

## v102 — real animations phase 1 (sha below): story bar + business story + theme fade (151/0)
User asked (big list, phased): real upload progress, real story duration bar, live animations, font readability+fade, 7-day soft-delete (stories+items+reviews+reports), view seller story on business page, responsive standardization, proactive upgrades. Decisions: fonts=both, soft-delete=stories+items+reviews+reports 7d, priority=agent-phased.
- PHASE 1 (this release):
  - #2 real story duration bar: .sv-progress spans now contain an <i> fill; render() computes real secs (video=duration, image=5s), sets --d and restarts a `svfill` width 0->100% animation. Verified: 8s clip fill grew 1.5->43px in 900ms, animationName=svfill, --d=8s.
  - #6 seller story on business page: verified [data-story-biz] opens the viewer (stories.js handler already present + loaded).
  - #4 fonts fade: theme toggle adds html.theme-fade for 380ms -> global colour/background/border/fill transition. Readability tokens already AA (dark muted #9fb0d0, light #49566a).
  - #1 real upload progress: multipart story/gallery forms already upload via XHR uploadWithProgress + UpBar (app.js intercept when file chosen & not data-upload); verified functions present.
- Tests: Playwright E2E (#2 bar animates over real duration + sound on, #6 business story opens, #4 theme-fade, #1 uploadWithProgress/UpBar present, 0 JS errors). test_all 151/0. node --check OK.
- Bumped ?v101->?v102 (x36), sw bazarche-v102.
- PHASE 2 (queued): 7-day soft-delete retention for stories+items+reviews+reports (deleted_at, audit list + restore in admin & owner panels). PHASE 3 (queued): responsive/mobile-desktop standardization sweep + proactive upgrades.

## v103 — REBUILD of phase-1 animations (real-time story bar) (sha below, 153/0)
User: phase 1 was broken; use the skills + big GitHub repos; research + test until right; rebuild from scratch instead of patching when it fails.
- Root causes found by reading the code: (1) `.sv-progress span.is-on` had a near-white track so the white fill was invisible; (2) the CSS `svfill` keyframe ran on a fixed timer, not real playback.
- REBUILT stories.js openGroup: a rAF progress engine — active bar width driven per-frame from `video.currentTime/duration` (true sync) or real elapsed time (image / WebM without duration header); stalls on buffer, freezes on tab-hidden (visibilitychange pause/resume with pausedAccum), lands 100% at end, safety timeout if playback stalls. Removed the CSS timer approach.
- CSS: active track now translucent (0.35) so the white fill shows; removed svfill animation.
- Verified (Playwright, measured): 6s video fill 15.8/31.2/47.1% @1/2/3s; pauses when hidden (48.8->48.8) and resumes; image story 0.3->21.2->41.2%; theme-fade active; 0 JS errors. Screenshot confirms visible fill.
- Research cited: SegmentedProgressBar (TOrnelas), insta-stories (rajat-mehra05), insta video progressbar gist — real-time currentTime sync pattern.
- Added RULES.md law 6 (rebuild-don't-patch; use big-GitHub/skills for animation research; test until right).
- test_all 153/0. Bumped ?v102->?v103 (x36), sw bazarche-v103.
- Still queued: PHASE 2 soft-delete 7d (stories+items+reviews+reports), PHASE 3 responsive sweep.

## v104 — theme "reversal" investigated: colors were correct; icon fixed (sha below, 153/0)
User said day/night text colors are reversed and "just swap fixes it". Measured in browser instead of swapping blindly:
- night (luxury): body bg rgb(10,17,34) fg rgb(244,242,234) = dark. day (light): bg rgb(238,242,249) fg rgb(13,20,37) = light. Screenshots confirm both. So the COLOR mapping is NOT reversed; swapping would break it.
- The real "reversed" feeling came from the toggle ICON showing the TARGET mode (sun at night, moon in day). Fixed: paint() now shows the CURRENT mode (moon at night, sun in day); tapping still flips theme. Verified: luxury->moon, light->sun.
- If a user still sees reversed colors, they are on an older zip; install v104.
- test_all 153/0. Bumped ?v103->?v104 (x36), sw bazarche-v104.

## v105 — PHASE 2: soft-delete recycle bin, 7-day retention, restorable (sha b6ebf4e0, 153/0 + 28/28)
User: "تمام فازهای مونده یکجا انجام بده؛ قوانین و دانش فراموش نشه" — do the remaining phases, keep rules+knowledge intact.
- DB (db.py): new `trash` table (entity, ref_id, biz_id, title, payload=full-row JSON, deleted_at) + index. `delete_review` / `delete_item` / `delete_report` now snapshot the full row via `trash_put` BEFORE the hard DELETE. `features.story_delete` does the same for stories. Added `TRASH_DAYS=7`, `trash_put`, `trash_list(entities,biz_ids)`, `trash_restore(tid)` (INSERT OR REPLACE the payload back, then drop the bin row), `trash_purge()` (hard-delete rows older than 7d).
- Routes (app.py): GET `/my/trash`->O.owner_trash (owner, biz-scoped), GET `/panel/trash`->P2.admin_trash (admin, all). POST `/my/trash/<id>/restore` (owner: session-gated + biz ownership check via db.businesses_of), POST `/panel/trash/<id>/restore` (admin: key-gated). `db.trash_purge()` runs at startup (make_server) and in the hourly sweep.
- Views: `owner_trash` (views_owner) + `admin_trash` (views_panel2) render the bin with a label map (استوری/محصول/نظر/گزارش), title, delete time, and a per-row restore button. Nav links added: OWNER_AREA_NAV "/my/trash" + admin "سیستم" group "/panel/trash" (trash icon).
- BUG FOUND + FIXED during HTTP test: admin POST routes authenticate via `self.admin_ok(form)` -> `token_ok(form)`, which reads `key` from the POST BODY, not the query string. My first restore form put the key only in the action URL -> 403 even with the correct key. Fixed: restore form now carries `<input type="hidden" name="key">` like every other admin form. (Owner restore is session-gated, needs no key.)
- Tests: NEW tools/test_trash.py = 28/28 (each of story/item/review/report: create->delete->in bin->restore->live again->gone from bin; owner biz-scoping shows own row and does not leak another biz; >7d row hard-purged and stays gone). HTTP: POST /panel/trash/<id>/restore with key in body -> 303 + item live again (1); wrong key -> 403 + item stays deleted (0); /my/trash unauth -> 303 /login; owner restore unauth -> 303 /login. test_all still 153/0.
- Bumped ?v104->?v105 (x36), sw bazarche-v105. Zip 339 files (no data/, no __pycache__), sha b6ebf4e0.
- Still queued: PHASE 3 responsive/mobile-desktop standardization sweep (needs browser env) + proactive upgrades.

## v106 — fix: mobile hamburger was faint + jammed in the corner (sha b00e0208, 153/0)
User: "منو سه خط بالا تو حالت موبایل انقدر رفته گوشه که محو شده" (the 3-line menu on mobile has gone so far into the corner it's faded).
- Measured first (Playwright at 320/360/412): the .nav-toggle was a 44px hit but drawn as a thin 3-line glyph in muted color rgb(159,176,208) with NO button face, sitting at the far corner -> read as faded/lost. Not actually clipped (left=12, overflow=0) but visually vanished; at the narrowest widths with more header icons the row could overflow and push it off-edge.
- Fix (main.css): gave .nav-toggle a real button face — full foreground icon color rgb(244,242,234), a brand-tinted chip background + border (color-mix primary 16%/38%), 22px icon, :active scale. And a <=400px guard so the header row never overflows: .brand flex:0 1 auto + .brand-text ellipsis, so the hamburger always stays on screen.
- Verified by screenshot: hamburger now a clear teal-bordered chip with bright icon at the corner; overflow=0 at 320/360/412.
- test_all 153/0, test_trash 28/0. Bumped ?v105->?v106 (x36), sw bazarche-v106. Zip 339 files sha b00e0208.

## v107 — free mobile header room (drop cart after login) + fix real slowness: 1 SQLite conn per request (sha 2703d7e8, 153/0)
User: (1) after login remove the top cart icon so the menu has room; (2) "سایتم کند شده تست بگیر ببین مشکل کجاست و حل کن".
- (1) ui.py: cart slot no longer returns on mobile when signed in — `cart_cls` is now always "btn-icon hide-mobile" (cart stays on desktop and in the mobile drawer). Frees a 44px slot for the hamburger.
- (2) PERF ROOT CAUSE (measured, not guessed): instrumented db.connect and found the home page opened ~67 separate SQLite connections per render (every query does connect()+close()). 58.9ms here, but on the phone that runs the server (Pydroid) that open/schema/close overhead ×67 is what made it feel slow. Server TTFB home was up to 135ms.
  - FIX (db.py): connect() now returns ONE per-thread connection reused for the whole request (threading.local), wrapped in _PersistentCon whose close() is a no-op so the hundreds of existing con.close() calls keep working. 67 opens -> 1. home() render 58.9ms -> 6.4ms; HTTP home TTFB 70-135ms -> ~9-13ms (~10x).
  - Verified test_all 153/0 + test_trash 28/0 with the pooled connection (no transaction/close regressions).
- Considered then REJECTED: making CSS/JS Cache-Control immutable (risk of stale SW SHELL prewarm since SHELL uses unversioned URLs; SW already makes repeat loads instant and cold FCP measured ~440ms). Reverted that edit.
- Bumped ?v106->?v107 (x36), sw bazarche-v107. Zip 339 files sha 2703d7e8.

## v108 — fix story-upload text inversion (light in day / dark in night) + day-mode text 50% darker (sha 2e9f4003, 153/0)
User (screenshot, light mode): the story-upload section texts are LIGHT in day mode and DARK in night mode (inverted), and asked that ALL day-mode texts become 50% darker with a real test.
- ROOT CAUSE: the compress/trim UI text (.cz-status/.cz-size/.cz-trim-msg/.cz-trim-row) and story-stats used `color: var(--color-muted)` — the SURFACE token (light #e7ecf5 in day, dark #1b2547 at night) — instead of the TEXT token. So text was light-on-light in day and dark-on-dark at night. Fixed to `var(--color-muted-foreground)` (pages.css).
- Day-mode 50% darker (theme-light.css): --color-foreground #0d1425 -> #060a12, --color-card-foreground same, --color-muted-foreground #49566a -> #242b35 (RGB x0.5).
- REAL TEST (Playwright, computed styles): light body = rgb(6,10,18), .text-muted = rgb(36,43,53) (exactly 50% darker); night unchanged rgb(244,242,234)/rgb(159,176,208). Light screenshot confirms readable dark text.
- test_all 153/0, test_trash 28/0. Bumped ?v107->?v108 (x36), sw bazarche-v108. Zip 339 files sha 2e9f4003.
