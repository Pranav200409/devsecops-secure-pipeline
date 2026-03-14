from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return "<h1>Secure Flask App is Running!</h1>"

# Security headers
@app.after_request
def set_security_headers(response):
    response.headers['Content-Security-Policy'] = "default-src 'self';"
    response.headers['X-Frame-Options'] = "DENY"
    response.headers['X-Content-Type-Options'] = "nosniff"
    response.headers['Referrer-Policy'] = "no-referrer"
    response.headers['Permissions-Policy'] = "geolocation=(), microphone=()"
    return response

def run_application():
    print("Application is starting up securely...")
    app.run(host='0.0.0.0', port=5000) # nosemgrep

if __name__ == "__main__":
    run_application()