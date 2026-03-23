from __future__ import annotations

from pathlib import Path

from fastapi import FastAPI, HTTPException, Request
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates

from app.repository import (
    get_homepage_context,
    get_people,
    get_person,
    get_place,
    get_places,
    get_timeline,
)


BASE_DIR = Path(__file__).resolve().parent

app = FastAPI(title="Archivio Storico di Riva San Vitale")
app.mount("/static", StaticFiles(directory=BASE_DIR / "static"), name="static")
templates = Jinja2Templates(directory=str(BASE_DIR / "templates"))


@app.get("/", response_class=HTMLResponse)
def homepage(request: Request) -> HTMLResponse:
    context = get_homepage_context()
    return templates.TemplateResponse("home.html", {"request": request, **context})


@app.get("/timeline", response_class=HTMLResponse)
def timeline_page(request: Request) -> HTMLResponse:
    return templates.TemplateResponse(
        "timeline.html",
        {"request": request, "events": get_timeline(), "site_title": "Timeline"},
    )


@app.get("/luoghi", response_class=HTMLResponse)
def places_page(request: Request) -> HTMLResponse:
    return templates.TemplateResponse(
        "places.html",
        {"request": request, "places": get_places(), "site_title": "Luoghi"},
    )


@app.get("/persone", response_class=HTMLResponse)
def people_page(request: Request) -> HTMLResponse:
    return templates.TemplateResponse(
        "people.html",
        {"request": request, "people": get_people(), "site_title": "Persone"},
    )


@app.get("/luoghi/{slug}", response_class=HTMLResponse)
def place_page(request: Request, slug: str) -> HTMLResponse:
    place = get_place(slug)
    if not place:
        raise HTTPException(status_code=404, detail="Luogo non trovato")
    return templates.TemplateResponse(
        "place.html",
        {"request": request, "place": place, "site_title": place["title"]},
    )


@app.get("/persone/{slug}", response_class=HTMLResponse)
def person_page(request: Request, slug: str) -> HTMLResponse:
    person = get_person(slug)
    if not person:
        raise HTTPException(status_code=404, detail="Persona non trovata")
    return templates.TemplateResponse(
        "person.html",
        {"request": request, "person": person, "site_title": person["title"]},
    )
