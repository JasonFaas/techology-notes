from http.server import BaseHTTPRequestHandler, HTTPServer
from datetime import datetime

class TimeHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        now = datetime.now().isoformat()
        self.send_response(200)
        self.send_header('Content-type','text/plain')
        self.end_headers()
        self.wfile.write(now.encode())

if __name__ == '__main__':
    server = HTTPServer(('', 8080), TimeHandler)
    server.serve_forever()
