# DevSecOps Secure Pipeline (Flask)

A hands-on DevSecOps project demonstrating shift-left security and automated CI security scanning.

## 🔐 Security Features Implemented

### Local Developer Security

* Pre-commit secret detection using TruffleHog
* SAST vulnerability detection using Semgrep
* Commit blocking for insecure code

### CI/CD Security (GitHub Actions)

* Automatic secret scanning on every push
* Static Application Security Testing (SAST)
* Pipeline fails if vulnerabilities are detected

## 🧱 Architecture

Developer → Pre-commit Hooks → GitHub → GitHub Actions Security Scan → Secure Code Only

## Vulnerabilities Prevented

* Hardcoded API keys
* XSS vulnerabilities
* Unsafe Flask configurations

## Tools Used

* Python Flask
* TruffleHog
* Semgrep
* GitHub Actions

## How to Run

```bash
pip install -r requirements.txt
flask --app app run
```

## Project Goal

Simulate real-world DevSecOps workflow where insecure code never reaches production repositories.
