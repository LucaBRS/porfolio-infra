FROM python:3.12-slim

WORKDIR /app

# Installa uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

# Copia i file di progetto
COPY pyproject.toml .
COPY main.py .
COPY uv.lock .

# Installa le dipendenze con uv (molto più veloce di pip)
RUN uv sync --frozen --no-dev

# Avvia FastAPI tramite uv
CMD ["uv", "run", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
