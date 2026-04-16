import os
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

# Inizializza l'app FastAPI con metadati visibili nella documentazione
app = FastAPI(
    title="Luca Barsottini - Portfolio API",
    description="API del portfolio personale",
    version="1.0.0"
)

# CORS — legge le origini consentite dall'env var ALLOWED_ORIGINS
# Formato: "https://lucabarsottini.dev,http://localhost:3000"
allowed_origins = os.getenv("ALLOWED_ORIGINS", "").split(",")

app.add_middleware(
    CORSMiddleware,
    allow_origins=allowed_origins,
    allow_methods=["GET"],
    allow_headers=["*"],
)

# Endpoint di health check — Caddy e monitoring lo usano
# per sapere se l'API è viva
@app.get("/health")
def health():
    return {"status": "ok"}

# Endpoint di test — ritornerà i tuoi dati reali in futuro
@app.get("/")
def root():
    return {
        "message": "Portfolio API",
        "author": "Luca Barsottini",
        "role": "Data Engineer"
    }

# Endpoint progetti — in futuro leggerà da BigQuery
@app.get("/projects")
def get_projects():
    return {
        "projects": [
            {
                "name": "Portfolio Pipeline",
                "description": "Pipeline dati con Kestra e Bruin",
                "stack": ["Kestra", "Bruin", "BigQuery", "GCP"]
            }
        ]
    }
