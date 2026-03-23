from __future__ import annotations

from pathlib import Path

from fastapi import FastAPI, File, Form, HTTPException, Request, UploadFile
from fastapi.responses import HTMLResponse, RedirectResponse
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates
from starlette.middleware.sessions import SessionMiddleware

from app.admin import (
    add_media_link_admin,
    create_entity_admin,
    empty_entity_form,
    get_admin_choices,
    get_admin_config,
    get_entity_admin,
    has_admin_password,
    list_entities_admin,
    remove_media_link_admin,
    save_media_upload_admin,
    update_entity_admin,
    verify_admin_password,
)
from app.repository import (
    get_homepage_context,
    get_people,
    get_person,
    get_place,
    get_places,
    get_timeline,
)
from app.storage import ensure_upload_root


BASE_DIR = Path(__file__).resolve().parent

app = FastAPI(title="Archivio Storico di Riva San Vitale")
app.add_middleware(SessionMiddleware, secret_key=get_admin_config().secret_key)
app.mount("/static", StaticFiles(directory=BASE_DIR / "static"), name="static")
app.mount("/uploads", StaticFiles(directory=ensure_upload_root()), name="uploads")
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


def _require_admin(request: Request) -> RedirectResponse | None:
    if not request.session.get("admin_authenticated"):
        return RedirectResponse("/admin/login", status_code=303)
    return None


def _admin_form_data(form_data: dict[str, str]) -> dict[str, object]:
    return {
        "entity_type": form_data.get("entity_type", "place"),
        "slug": form_data.get("slug", "").strip(),
        "title": form_data.get("title", "").strip(),
        "subtitle": form_data.get("subtitle", "").strip(),
        "summary": form_data.get("summary", "").strip(),
        "description_md": form_data.get("description_md", "").strip(),
        "language_code": form_data.get("language_code", "it").strip() or "it",
        "status": form_data.get("status", "draft"),
        "is_featured": form_data.get("is_featured") == "1",
        "sort_order": int(form_data.get("sort_order", "0") or 0),
        "metadata": form_data.get("metadata", "{}").strip() or "{}",
        "place_type": form_data.get("place_type", "other"),
        "current_name": form_data.get("current_name", "").strip(),
        "historical_name": form_data.get("historical_name", "").strip(),
        "address_text": form_data.get("address_text", "").strip(),
        "geo_notes": form_data.get("geo_notes", "").strip(),
        "given_name": form_data.get("given_name", "").strip(),
        "family_name": form_data.get("family_name", "").strip(),
        "display_name": form_data.get("display_name", "").strip(),
        "birth_date_label": form_data.get("birth_date_label", "").strip(),
        "death_date_label": form_data.get("death_date_label", "").strip(),
        "occupations": form_data.get("occupations", "").strip(),
        "biography_md": form_data.get("biography_md", "").strip(),
        "event_type": form_data.get("event_type", "other"),
        "date_label": form_data.get("date_label", "").strip(),
        "narrative_md": form_data.get("narrative_md", "").strip(),
        "document_type": form_data.get("document_type", "other"),
        "archive_reference": form_data.get("archive_reference", "").strip(),
        "editorial_notes_md": form_data.get("editorial_notes_md", "").strip(),
        "media_type": form_data.get("media_type", "image"),
        "file_path": form_data.get("file_path", "").strip(),
        "source_url": form_data.get("source_url", "").strip(),
        "mime_type": form_data.get("mime_type", "").strip(),
        "alt_text": form_data.get("alt_text", "").strip(),
        "caption": form_data.get("caption", "").strip(),
        "credit_line": form_data.get("credit_line", "").strip(),
        "rights_statement": form_data.get("rights_statement", "").strip(),
        "narrative_type": form_data.get("narrative_type", "article"),
        "lead": form_data.get("lead", "").strip(),
        "body_md": form_data.get("body_md", "").strip(),
        "organization_kind": form_data.get("organization_kind", "").strip(),
        "founded_date_label": form_data.get("founded_date_label", "").strip(),
        "dissolved_date_label": form_data.get("dissolved_date_label", "").strip(),
        "mission_md": form_data.get("mission_md", "").strip(),
        "theme_group": form_data.get("theme_group", "").strip(),
        "color_hex": form_data.get("color_hex", "").strip(),
        "icon_name": form_data.get("icon_name", "").strip(),
    }


@app.get("/admin/login", response_class=HTMLResponse)
def admin_login_page(request: Request) -> HTMLResponse:
    if request.session.get("admin_authenticated"):
        return RedirectResponse("/admin", status_code=303)
    return templates.TemplateResponse(
        "admin_login.html",
        {"request": request, "site_title": "Admin Login", "error": None},
    )


@app.post("/admin/login", response_class=HTMLResponse)
async def admin_login(request: Request, password: str = Form(...)) -> HTMLResponse | RedirectResponse:
    if not has_admin_password():
        return templates.TemplateResponse(
            "admin_login.html",
            {"request": request, "site_title": "Admin Login", "error": "ADMIN_PASSWORD non configurata sul server."},
            status_code=500,
        )
    if not verify_admin_password(password):
        return templates.TemplateResponse(
            "admin_login.html",
            {"request": request, "site_title": "Admin Login", "error": "Password non valida."},
            status_code=401,
        )
    request.session["admin_authenticated"] = True
    return RedirectResponse("/admin", status_code=303)


@app.get("/admin/logout")
def admin_logout(request: Request) -> RedirectResponse:
    request.session.clear()
    return RedirectResponse("/admin/login", status_code=303)


@app.get("/admin", response_class=HTMLResponse)
def admin_dashboard(request: Request) -> HTMLResponse | RedirectResponse:
    redirect = _require_admin(request)
    if redirect:
        return redirect
    return templates.TemplateResponse(
        "admin_dashboard.html",
        {"request": request, "site_title": "Admin", "entities": list_entities_admin()},
    )


@app.get("/admin/entities/new", response_class=HTMLResponse)
def admin_new_entity_page(request: Request) -> HTMLResponse | RedirectResponse:
    redirect = _require_admin(request)
    if redirect:
        return redirect
    return templates.TemplateResponse(
        "admin_entity_form.html",
        {
            "request": request,
            "site_title": "Nuova entita",
            "entity": empty_entity_form(),
            "choices": get_admin_choices(),
            "error": None,
            "is_new": True,
        },
    )


@app.post("/admin/entities/new", response_class=HTMLResponse)
async def admin_create_entity(request: Request) -> HTMLResponse | RedirectResponse:
    redirect = _require_admin(request)
    if redirect:
        return redirect
    form = await request.form()
    data = _admin_form_data(dict(form))
    try:
        entity_id = create_entity_admin(data)
    except Exception as exc:
        entity = empty_entity_form()
        entity.update(data)
        entity["details"] = {}
        return templates.TemplateResponse(
            "admin_entity_form.html",
            {
                "request": request,
                "site_title": "Nuova entita",
                "entity": entity,
                "choices": get_admin_choices(),
                "error": str(exc),
                "is_new": True,
            },
            status_code=400,
        )
    return RedirectResponse(f"/admin/entities/{entity_id}", status_code=303)


@app.get("/admin/entities/{entity_id}", response_class=HTMLResponse)
def admin_entity_page(request: Request, entity_id: str) -> HTMLResponse | RedirectResponse:
    redirect = _require_admin(request)
    if redirect:
        return redirect
    entity = get_entity_admin(entity_id)
    if not entity:
        raise HTTPException(status_code=404, detail="Entita non trovata")
    return templates.TemplateResponse(
        "admin_entity_form.html",
        {
            "request": request,
            "site_title": entity["title"],
            "entity": entity,
            "choices": get_admin_choices(),
            "error": None,
            "is_new": False,
        },
    )


@app.post("/admin/entities/{entity_id}", response_class=HTMLResponse)
async def admin_update_entity(request: Request, entity_id: str) -> HTMLResponse | RedirectResponse:
    redirect = _require_admin(request)
    if redirect:
        return redirect
    form = await request.form()
    data = _admin_form_data(dict(form))
    try:
        update_entity_admin(entity_id, data)
    except Exception as exc:
        entity = get_entity_admin(entity_id) or empty_entity_form()
        entity.update(data)
        return templates.TemplateResponse(
            "admin_entity_form.html",
            {
                "request": request,
                "site_title": entity.get("title", "Modifica entita"),
                "entity": entity,
                "choices": get_admin_choices(),
                "error": str(exc),
                "is_new": False,
            },
            status_code=400,
        )
    return RedirectResponse(f"/admin/entities/{entity_id}", status_code=303)


@app.post("/admin/entities/{entity_id}/media")
async def admin_add_media_link(
    request: Request,
    entity_id: str,
    media_slug: str = Form(...),
    usage_role: str = Form("gallery"),
    caption_override: str = Form(""),
    sort_order: int = Form(0),
) -> RedirectResponse:
    redirect = _require_admin(request)
    if redirect:
        return redirect
    add_media_link_admin(entity_id, media_slug, usage_role, caption_override, sort_order)
    return RedirectResponse(f"/admin/entities/{entity_id}", status_code=303)


@app.post("/admin/entities/{entity_id}/media/remove")
async def admin_remove_media_link(
    request: Request,
    entity_id: str,
    media_slug: str = Form(...),
    usage_role: str = Form(...),
) -> RedirectResponse:
    redirect = _require_admin(request)
    if redirect:
        return redirect
    remove_media_link_admin(entity_id, media_slug, usage_role)
    return RedirectResponse(f"/admin/entities/{entity_id}", status_code=303)


@app.post("/admin/entities/{entity_id}/upload")
async def admin_upload_media_file(
    request: Request,
    entity_id: str,
    uploaded_file: UploadFile = File(...),
) -> RedirectResponse:
    redirect = _require_admin(request)
    if redirect:
        return redirect
    content = await uploaded_file.read()
    save_media_upload_admin(entity_id, uploaded_file.filename or "", uploaded_file.content_type, content)
    return RedirectResponse(f"/admin/entities/{entity_id}", status_code=303)
