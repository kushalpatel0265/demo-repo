FROM python:3.11-slim

WORKDIR /app

# Minimal system deps (kept small)
RUN apt-get update && apt-get install -y --no-install-recommends build-essential && rm -rf /var/lib/apt/lists/*

# Install Python deps
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# App source
COPY app ./app

# CRITICAL: compile Python sources to surface SyntaxError in logs during build
# so the backend can parse & auto-fix core code.
# Intentionally inject invalid Python to break the build
RUN echo "def main(: pass" > app/break.py
RUN python -m compileall -q app

# Explicit failing command to guarantee build error
RUN false

# Run command (simple CLI app)
CMD ["python","app/main.py"]
