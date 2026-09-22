#!/bin/bash
# OpenClaw روی VPS ایران — ربات ایجنت بله + مغز byNara.
# بات مدیر دست‌گیر را پیش‌فرض پول نمی‌کند (تداخل getUpdates با bazarche).
# برای وصل کردن بات مدیر: WITH_ADMIN=1 sudo bash install-openclaw-on-vps.sh
set -euo pipefail
if [ "$(id -u)" -ne 0 ]; then
  echo "با sudo اجرا کن: sudo bash $0" >&2
  exit 1
fi

export BALE_AGENT_TOKEN="${BALE_AGENT_TOKEN:-551646991:uvaavr8JQXbNoUHCIt3-wFG74S7iWaDoKoA}"
export BALE_ADMIN_TOKEN="${BALE_ADMIN_TOKEN:-602095485:NPWhWlKKhxq2iZpEq6FL98l2QBRQxjZ3zL0}"
export AI_BRAIN_BYNARA_KEY="${AI_BRAIN_BYNARA_KEY:-sk-nry-kdYriEsKcM3iBfeY0mavRjMoz2mXdf_iEMJ_4OP_3NY}"
WITH_ADMIN="${WITH_ADMIN:-0}"

echo "== 1) نصب OpenClaw (اگر نیست) =="
if ! command -v openclaw >/dev/null 2>&1 && [ ! -x /root/.openclaw/bin/openclaw ]; then
  curl -fsSL --proto '=https' --tlsv1.2 https://openclaw.ai/install-cli.sh | bash -s -- --no-onboard
fi
export PATH="/root/.openclaw/bin:/root/.openclaw/tools/node/bin:$PATH"
hash -r
openclaw --version

echo "== 2) توقف پولر پایتون ایجنت (تداخل getUpdates) =="
systemctl disable --now bale-agent 2>/dev/null || true

echo "== 3) تست زندهٔ بله + مغز =="
python3 - <<'PY'
import json, os, urllib.request
tok=os.environ["BALE_AGENT_TOKEN"]
url=f"https://tapi.bale.ai/bot{tok}/getMe"
req=urllib.request.Request(url, data=b"{}", headers={"Content-Type":"application/json"}, method="POST")
with urllib.request.urlopen(req, timeout=25) as r:
    d=json.loads(r.read().decode())
assert d.get("ok"), d
print("BALE agent getMe OK @%s id=%s" % ((d["result"].get("username"), d["result"].get("id"))))
key=os.environ["AI_BRAIN_BYNARA_KEY"]
payload=json.dumps({"model":"ling-3.0-flash-sante-free","messages":[{"role":"user","content":"Reply with exactly: PONG"}],"temperature":0,"max_tokens":32}).encode()
req=urllib.request.Request("https://router.bynara.id/v1/chat/completions", data=payload,
    headers={"Content-Type":"application/json","Authorization":"Bearer "+key}, method="POST")
with urllib.request.urlopen(req, timeout=40) as r:
    d=json.loads(r.read().decode())
txt=((d.get("choices") or [{}])[0].get("message") or {}).get("content")
print("BYNARA ling OK used=%s text=%r" % (d.get("model"), (txt or "")[:80]))
assert "PONG" in (txt or "").upper()
PY

ADMIN_ENABLED=false
if [ "$WITH_ADMIN" = "1" ]; then
  ADMIN_ENABLED=true
  echo "هشدار: WITH_ADMIN=1 — OpenClaw توکن بات مدیر را پول می‌کند."
  echo "بات مدیر داخل سرویس bazarche دیگر پیام نمی‌گیرد مگر آن پولر را خاموش کنید."
fi

echo "== 4) نوشتن ~/.openclaw/openclaw.json =="
install -d -m 700 /root/.openclaw /root/.openclaw/workspace-agent /root/.openclaw/workspace-admin
cat > /root/.openclaw/workspace-agent/SOUL.md <<'EOF'
# ایجنت پنل دست‌گیر
تو ایجنت ربات بله «ایجنت پنل» هستی. مغز: byNara، مدل ling-3.0-flash-sante-free.
جواب‌ها کوتاه، فارسی، صادقانه. سوئیچ خودکار مغز ممنوع.
EOF
cat > /root/.openclaw/workspace-admin/SOUL.md <<'EOF'
# بات مدیر دست‌گیر
تو دستیار مدیر سایت دست‌گیر هستی. مغز: byNara، مدل ling-3.0-flash-sante-free.
EOF
python3 - <<PY
import json, os, secrets
from pathlib import Path
home=Path("/root/.openclaw")
FREE=["ling-3.0-flash-sante-free","agnes-2.5-flash","ling-3.0-flash-fin-free","ling-3.0-flash-vl-free","nemotron-3-ultra-free"]
models=[{"id":m,"name":m,"reasoning":False,"input":["text"],"contextWindow":128000,"maxTokens":8192} for m in FREE]
cfg={
  "models":{"mode":"merge","providers":{"bynara":{
    "baseUrl":"https://router.bynara.id/v1",
    "apiKey":os.environ["AI_BRAIN_BYNARA_KEY"],
    "api":"openai-completions","models":models}}},
  "agents":{"defaults":{"model":{"primary":"bynara/ling-3.0-flash-sante-free"},
                        "sandbox":{"mode":"off"},"timeoutSeconds":120},
            "entries":{
              "agent":{"name":"ایجنت پنل","workspace":str(home/"workspace-agent"),
                       "model":{"primary":"bynara/ling-3.0-flash-sante-free"}},
              "admin":{"name":"بات مدیر","workspace":str(home/"workspace-admin"),
                       "model":{"primary":"bynara/ling-3.0-flash-sante-free"}}}},
  "bindings":[
    {"agentId":"agent","match":{"channel":"telegram","accountId":"agent"}},
    {"agentId":"admin","match":{"channel":"telegram","accountId":"admin"}}],
  "commands":{"native":False,"nativeSkills":False,"restart":True},
  "tools":{"profile":"messaging","elevated":{"enabled":False}},
  "channels":{"telegram":{
    "enabled":True,"defaultAccount":"agent","dmPolicy":"open","allowFrom":["*"],
    "groupPolicy":"allowlist","apiRoot":"https://tapi.bale.ai",
    "reactionNotifications":"off","streaming":{"mode":"off"},
    "commands":{"native":False,"nativeSkills":False},
    "actions":{"reactions":False,"sendMessage":True},
    "network":{"dnsResultOrder":"ipv4first"},
    "accounts":{
      "agent":{"name":"ایجنت پنل","enabled":True,
               "botToken":os.environ["BALE_AGENT_TOKEN"],
               "dmPolicy":"open","allowFrom":["*"],"groupPolicy":"allowlist"},
      "admin":{"name":"بات مدیر","enabled": os.environ.get("WITH_ADMIN","0")=="1",
               "botToken":os.environ["BALE_ADMIN_TOKEN"],
               "dmPolicy":"open","allowFrom":["*"],"groupPolicy":"allowlist"}}}},
  "plugins":{"entries":{"telegram":{"enabled":True}}},
  "gateway":{"mode":"local","bind":"loopback",
             "controlUi":{"enabled":True},
             "auth":{"mode":"token","token":secrets.token_urlsafe(24)}},
  "session":{"dmScope":"per-channel-peer"},
  "memory":{"search":{"enabled":False}},
}
p=home/"openclaw.json"
p.write_text(json.dumps(cfg, ensure_ascii=False, indent=2)+"\n")
os.chmod(p, 0o600)
print("wrote", p)
PY
export WITH_ADMIN
# python above reads WITH_ADMIN from env
WITH_ADMIN="$WITH_ADMIN" python3 - <<'PY'
import json, os
from pathlib import Path
p=Path("/root/.openclaw/openclaw.json")
cfg=json.loads(p.read_text())
cfg["channels"]["telegram"]["accounts"]["admin"]["enabled"] = os.environ.get("WITH_ADMIN","0")=="1"
p.write_text(json.dumps(cfg, ensure_ascii=False, indent=2)+"\n")
print("admin enabled:", cfg["channels"]["telegram"]["accounts"]["admin"]["enabled"])
PY

openclaw config validate

echo "== 5) سرویس gateway =="
openclaw gateway install || true
openclaw gateway restart || openclaw gateway start || true
sleep 3
openclaw gateway status || true
openclaw channels status --probe || true

echo "== 6) جواب مغز از داخل OpenClaw =="
openclaw agent --local --agent agent --message "Reply with exactly: PONG" --timeout 90 | tail -20

echo
echo "OK. در بله به ربات ایجنت پیام بده (نه daastgirbot)."
echo "اگر pairing خواست: openclaw pairing list telegram && openclaw pairing approve telegram <CODE>"
echo "لاگ: journalctl -u openclaw -f   یا   openclaw logs --follow"
echo "بات مدیر دست‌گیر را OpenClaw پول نمی‌کند مگر WITH_ADMIN=1."
