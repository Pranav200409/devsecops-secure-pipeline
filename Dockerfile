# 1. Use lightweight Python image
FROM python:3.11-slim

# 2. Secure environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# 3. Create a non-root user (Security Best Practice)
RUN addgroup --system appgroup && adduser --system --ingroup appgroup appuser

# 4. Set working directory
WORKDIR /app

# 5. Copy ONLY necessary files (Prevents copying .git or venv)
COPY requirements.txt .
COPY app/ ./app/

# 6. Install dependencies securely
RUN pip install --no-cache-dir -r requirements.txt

# 7. Secure the files: Give ownership to the non-root user
RUN chown -R appuser:appgroup /app

# 8. DROP ROOT PRIVILEGES: Switch to the restricted user
USER appuser

# 9. Expose Flask port
EXPOSE 5000

# 10. Run app
CMD ["python", "app/app.py"]