# bb_app/views.py
import hashlib
from functools import wraps
from datetime import datetime

from django.http import HttpResponseForbidden
from django.shortcuts import render, redirect, get_object_or_404
from django.utils.timezone import now
from datetime import date
from . import models

from django.db.models import Case, When, Value, IntegerField


from .models import Prenotazione

from django.http import HttpResponseBadRequest, HttpResponseForbidden
from django.utils.timezone import now

# ------------------------------------------------------------------
#  Helper
# ------------------------------------------------------------------
def _hash_pwd(raw: str) -> str:
    return hashlib.sha256(raw.encode()).hexdigest()

def role_required(allowed_roles):
    def decorator(view_fn):
        @wraps(view_fn)
        def _wrapped(request, *args, **kwargs):
            if not request.session.get("is_authenticated"):
                return redirect("login")
            if request.session.get("ruolo") not in allowed_roles:
                return HttpResponseForbidden("Accesso negato")
            return view_fn(request, *args, **kwargs)
        return _wrapped
    return decorator

# ------------------------------------------------------------------
#  Pagine pubbliche
# ------------------------------------------------------------------
def home(request):
    utente = None
    if request.session.get("is_authenticated"):
        utente = models.Utente.objects.get(id=request.session["user_id"])
    return render(request, "bb_app/home.html", {
        "utente": utente,
        "hide_navbar": True
    })


# ------------------------------------------------------------------
#  Autenticazione
# ------------------------------------------------------------------
def login_view(request):
    if request.method == "POST":
        ruolo = request.POST.get("ruolo", "").strip()
        email = request.POST.get("email", "").strip()
        pwd = request.POST.get("password", "").strip()

        user = models.Utente.objects.filter(email=email, password=_hash_pwd(pwd), ruolo=ruolo).first()

        if not user:
            return render(request, "bb_app/login.html", {
                "error": "Credenziali o ruolo non validi",
                "hide_navbar": True
            })

        request.session.flush()
        request.session["user_id"] = user.id
        request.session["ruolo"] = user.ruolo
        request.session["is_authenticated"] = True

        return redirect("dashboard_" + user.ruolo.lower())

    return render(request, "bb_app/login.html", {"hide_navbar": True})


def logout_view(request):
    request.session.flush()
    return redirect("login")

# ------------------------------------------------------------------
#  Login vulnerabile utilizzato per SQL injection
# ------------------------------------------------------------------

from django.db import connection

# from django.db import connection
# from django.shortcuts import render

# def login_vulnerabile(request):
#     if request.method == "POST":
#         ruolo = request.POST.get("ruolo")
#         email = request.POST.get("email")
#         password = request.POST.get("password")
#
#         query = f"SELECT * FROM bb_app_utente WHERE ruolo = '{ruolo}' AND email = '{email}' AND password = '{password}'"
#         print("Eseguendo query:", query)

#         with connection.cursor() as cursor:
#             cursor.execute(query)
#             row = cursor.fetchone()

#         if row:
#             utente = {
#                 "nome": row[1],
#                 "cognome": row[2],
#             }
#             return render(request, "bb_app/dashboard_cliente.html", {"utente": utente})
#         else:
#             return render(request, "bb_app/login_vulnerabile.html", {
#                 "error": "Credenziali non valide (vulnerabile)",
#                 "hide_navbar": True
#             })

#     return render(request, "bb_app/login_vulnerabile.html", {"hide_navbar": True})

# ------------------------------------------------------------------
#  Registrazione
# ------------------------------------------------------------------
def registrazione_utente(request):
    if request.method == "POST":
        ruolo = request.POST.get("ruolo")
        email = request.POST.get("email", "").strip()
        password_raw = request.POST.get("password", "").strip()
        conferma_password = request.POST.get("conferma_password", "").strip()

        nome = request.POST.get("nome", "").strip()
        cognome = request.POST.get("cognome", "").strip()
        numero_documento = request.POST.get("numero_documento", "").strip()
        ruolo_staff = request.POST.get("ruolo_staff", "").strip()
        data_nomina = request.POST.get("data_nomina", "").strip()
        attivo = bool(request.POST.get("attivo"))

        if password_raw != conferma_password:
            return render(request, "bb_app/registrazione.html", {
                "error": "Le password non coincidono",
                "hide_navbar": True
            })

        if models.Utente.objects.filter(email=email).exists():
            return render(request, "bb_app/registrazione.html", {
                "error": "Email già registrata",
                "hide_navbar": True
            })

        if ruolo == models.Utente.Ruolo.CLIENTE:
            if not nome or not cognome:
                return render(request, "bb_app/registrazione.html", {
                    "error": "Nome e cognome obbligatori per il Cliente",
                    "hide_navbar": True
                })
            ruolo_staff = ""
            data_nomina = None
            attivo = None

        elif ruolo == models.Utente.Ruolo.STAFF:
            if not ruolo_staff:
                return render(request, "bb_app/registrazione.html", {
                    "error": "Specificare il ruolo dello staff",
                    "hide_navbar": True
                })
            nome = cognome = ""
            numero_documento = ""
            data_nomina = None
            attivo = None

        elif ruolo == models.Utente.Ruolo.GESTORE:
            if not data_nomina:
                return render(request, "bb_app/registrazione.html", {
                    "error": "Data nomina obbligatoria per Gestore",
                    "hide_navbar": True
                })
            nome = cognome = numero_documento = ruolo_staff = ""
        else:
            return render(request, "bb_app/registrazione.html", {
                "error": "Ruolo non valido",
                "hide_navbar": True
            })

        models.Utente.objects.create(
            ruolo=ruolo,
            email=email,
            password=_hash_pwd(password_raw),
            nome=nome,
            cognome=cognome,
            numero_documento=numero_documento or None,
            ruolo_staff=ruolo_staff or None,
            data_nomina=data_nomina or None,
            attivo=attivo
        )
        return redirect("login")

    return render(request, "bb_app/registrazione.html", {"hide_navbar": True})

# ------------------------------------------------------------------
#  Dashboard
# ------------------------------------------------------------------
@role_required([models.Utente.Ruolo.CLIENTE])
def dashboard_cliente(request):
    user_id = request.session["user_id"]
    utente = models.Utente.objects.get(id=user_id)
    return render(request, "bb_app/dashboard_cliente.html", {"utente": utente})

def dashboard_staff(request):
    user_id = request.session["user_id"]
    utente   = models.Utente.objects.get(id=user_id)
    return render(request,
                  "bb_app/dashboard_staff.html",
                  {"utente": utente})

@role_required([models.Utente.Ruolo.GESTORE])
def dashboard_gestore(request):
    user_id = request.session["user_id"]
    utente = models.Utente.objects.get(id=user_id)
    return render(request, "bb_app/dashboard_gestore.html", {"utente": utente})

# ------------------------------------------------------------------
#  INCARICHI (eventi a cui lo staff è stato assegnato)
# ------------------------------------------------------------------
@role_required([models.Utente.Ruolo.STAFF])
def lista_incarichi(request):
    user_id = request.session["user_id"]

    incarichi = (
        models.Assegnazione
        .objects
        .filter(utente_id=user_id,
                evento__data_evento__gte=date.today())
        .select_related("evento")
        .order_by("evento__data_evento")
    )

    return render(request,
                  "bb_app/incarichi_staff.html",
                  {"incarichi": incarichi})


# ------------------------------------------------------------------
#  Prenotazioni (cliente)
# ------------------------------------------------------------------
import locale
locale.setlocale(locale.LC_TIME, 'it_IT.UTF-8')
@role_required([models.Utente.Ruolo.CLIENTE])
def effettua_prenotazione(request):
    user_id = request.session["user_id"]
    utente = models.Utente.objects.get(id=user_id)

    camere = []
    servizi = []
    check_in = request.GET.get("check_in")
    check_out = request.GET.get("check_out")
    numero_ospiti = request.GET.get("numero_ospiti")

    tipologia_immagini = {
        "singola": "/static/img/camere/camera_singola.png",
        "doppia": "/static/img/camere/camera_doppia.png",
        "matrimoniale": "/static/img/camere/camera_matrimoniale.png",
        "suite": "/static/img/camere/suite.png"
    }

    if check_in and check_out and check_in < check_out:
        prenotate = models.Prenotazione.objects.filter(
            check_out__gt=check_in,
            check_in__lt=check_out
        ).values_list("comprende__camera_id", flat=True)

        camere = models.Camera.objects.exclude(id__in=prenotate).filter(in_manutenzione=False)

        try:
            ospiti = int(numero_ospiti)
            if ospiti == 1:
                camere = camere.filter(tipologia="singola")
            elif ospiti >= 2:
                camere = camere.filter(tipologia__in=["doppia", "matrimoniale", "suite"])
        except (ValueError, TypeError):
            camere = []

        for camera in camere:
            camera.immagine_url = tipologia_immagini.get(camera.tipologia, "")

        servizi = list(models.ServizioExtra.objects.all())

    if request.method == "POST":
        check_in_str = request.POST.get("check_in", "")
        check_out_str = request.POST.get("check_out", "")

        try:
            check_in = datetime.strptime(check_in_str, "%d %B %Y").date()
        except ValueError:
            try:
                check_in = datetime.strptime(check_in_str, "%Y-%m-%d").date()
            except ValueError:
                return render(request, "bb_app/prenotazione.html", {
                    "error": "Data check-in non valida.",
                    "camere": camere,
                    "servizi": servizi,
                    "check_in": check_in_str,
                    "check_out": check_out_str,
                    "numero_ospiti": numero_ospiti,
                })

        try:
            check_out = datetime.strptime(check_out_str, "%d %B %Y").date()
        except ValueError:
            try:
                check_out = datetime.strptime(check_out_str, "%Y-%m-%d").date()
            except ValueError:
                return render(request, "bb_app/prenotazione.html", {
                    "error": "Data check-out non valida.",
                    "camere": camere,
                    "servizi": servizi,
                    "check_in": check_in_str,
                    "check_out": check_out_str,
                    "numero_ospiti": numero_ospiti,
                })

        numero_ospiti = request.POST.get("numero_ospiti")
        camere_ids = request.POST.getlist("camere")
        servizi_ids = request.POST.getlist("servizi_extra")

        if not check_in or not check_out or not numero_ospiti or not camere_ids:
            return render(request, "bb_app/prenotazione.html", {
                "error": "Tutti i campi obbligatori devono essere compilati.",
                "camere": camere,
                "servizi": servizi,
                "check_in": check_in,
                "check_out": check_out,
                "numero_ospiti": numero_ospiti,
            })

        pren = models.Prenotazione.objects.create(
            check_in=check_in,
            check_out=check_out,
            stato="in attesa",
            data_prenotazione=now()
        )
        models.Effettua.objects.create(utente_id=user_id, prenotazione=pren)

        for camera_id in camere_ids:
            camera = get_object_or_404(models.Camera, id=camera_id)
            prezzo_finale = camera.prezzo_per_notte * ((pren.check_out - pren.check_in).days)
            models.Comprende.objects.create(
                prenotazione=pren,
                camera=camera,
                numero_ospiti=numero_ospiti,
                prezzo_finale=prezzo_finale
            )

        for servizio_id in servizi_ids:
            if servizio_id == "9999":
                continue
            servizio = get_object_or_404(models.ServizioExtra, id=servizio_id)
            models.Aggiunta.objects.create(prenotazione=pren, servizio=servizio)

        return redirect("prenotazione_successo", pren_id=pren.id)

    return render(request, "bb_app/prenotazione.html", {
        "camere": camere,
        "servizi": servizi,
        "check_in": check_in,
        "check_out": check_out,
        "numero_ospiti": numero_ospiti,
    })


@role_required([models.Utente.Ruolo.CLIENTE])
def prenotazione_successo(request, pren_id):
    prenotazione = get_object_or_404(models.Prenotazione, id=pren_id)
    return render(request, "bb_app/prenotazione_successo.html", {"prenotazione": prenotazione})

from .models import Prenotazione, Recensisce

@role_required([models.Utente.Ruolo.CLIENTE])
def storico_prenotazioni(request):
    utente_id = request.session.get("user_id")
    today = date.today()

    ordini = (
        Prenotazione.objects
                    .filter(effettua__utente__id=utente_id)
                    .order_by("-data_prenotazione")
    )

    recensioni_camera = set(
        Recensisce.objects
                  .filter(utente_id=utente_id, comprende__isnull=False)
                  .values_list("comprende_id", flat=True)
    )
    recensioni_servizio = set(
        Recensisce.objects
                  .filter(utente_id=utente_id, servizio__isnull=False)
                  .values_list("servizio_id", flat=True)
    )
    recensioni_evento = set(
        Recensisce.objects
                  .filter(utente_id=utente_id, evento__isnull=False)
                  .values_list("evento_id", flat=True)
    )

    for pren in ordini:
        if pren.check_out < today:
            pren.stato = "completata"
        elif pren.check_in > today:
            pren.stato = "in attesa"
        else:
            pren.stato = "in corso"

        pren.soggiorno_terminato = pren.check_out < today
        pren.camere_recensite   = recensioni_camera
        pren.servizi_recensiti  = recensioni_servizio
        pren.eventi_recensiti   = recensioni_evento

    return render(request, "bb_app/storico_prenotazioni.html", {"ordini": ordini})

# ------------------------------------------------------------------
#  Eventi e recensioni (cliente)
# ------------------------------------------------------------------
@role_required([models.Utente.Ruolo.CLIENTE])
def lista_eventi(request):
    user_id = request.session["user_id"]

    eventi = (
        models.EventoLocale.objects
        .filter(data_evento__gte=date.today())
        .order_by("data_evento")
    )

    iscritti = set(
        models.Partecipa.objects
        .filter(utente_id=user_id)
        .values_list("evento_id", flat=True)
    )

    return render(request, "bb_app/eventi.html", {
        "eventi": eventi,
        "iscritti": iscritti
    })

@role_required([models.Utente.Ruolo.CLIENTE])
def iscrizione_evento(request, evento_id):
    evento = get_object_or_404(models.EventoLocale, pk=evento_id)
    user_id = request.session["user_id"]

    gia_iscritto = models.Partecipa.objects.filter(utente_id=user_id, evento_id=evento_id).exists()
    errore = None

    if request.method == "POST":
        if gia_iscritto:
            errore = "Sei già iscritto a questo evento."
        elif evento.posti_disponibili <= 0:
            errore = "Non ci sono più posti disponibili per questo evento."
        else:
            models.Partecipa.objects.create(
                utente_id=user_id,
                evento_id=evento_id,
                data_iscrizione=date.today()
            )
            evento.posti_disponibili -= 1
            evento.save()

            return render(request, "bb_app/iscrizione_successo.html", {
                "evento": evento
            })

    return render(request, "bb_app/iscrizione_evento.html", {
        "evento": evento,
        "gia_iscritto": gia_iscritto,
        "errore": errore
    })

@role_required([models.Utente.Ruolo.CLIENTE])
def eventi_iscritti(request):
    user_id = request.session["user_id"]
    eventi_partecipati = models.Partecipa.objects.filter(
        utente_id=user_id
    ).select_related("evento").order_by("evento__data_evento")

    return render(request, "bb_app/eventi_iscritti.html", {
        "eventi_partecipati": eventi_partecipati
    })

@role_required([models.Utente.Ruolo.CLIENTE])
def scrivi_recensione(request):
    user_id = request.session["user_id"]
    today = date.today()

    prenotazioni_completate = models.Prenotazione.objects.filter(
        effettua__utente_id=user_id,
        check_out__lt=today
    )
    print(f"Prenotazioni completate trovate: {prenotazioni_completate.count()}")

    comprende_rec = set(models.Recensisce.objects.filter(
        utente_id=user_id, comprende__isnull=False
    ).values_list("comprende_id", flat=True))
    serv_rec = set(models.Recensisce.objects.filter(
        utente_id=user_id, servizio__isnull=False
    ).values_list("servizio_id", flat=True))
    ev_rec = set(models.Recensisce.objects.filter(
        utente_id=user_id, evento__isnull=False
    ).values_list("evento_id", flat=True))

    camere_recensibili = []
    servizi_recensibili = []
    eventi_recensibili = []

    for pren in prenotazioni_completate:
        camere = pren.comprende_set.exclude(id__in=comprende_rec).select_related("camera")
        print(f"Prenotazione {pren.id} ha {camere.count()} camere recensibili")
        for c in camere:
            c.prenotazione = pren
            camere_recensibili.append(c)

        servizi = pren.aggiunta_set.exclude(servizio_id__in=serv_rec).select_related("servizio")
        print(f"Prenotazione {pren.id} ha {servizi.count()} servizi recensibili")
        for s in servizi:
            s.prenotazione = pren
            servizi_recensibili.append(s)

    eventi = models.Partecipa.objects.filter(
        utente_id=user_id,
        evento__data_evento__lt=today
    ).exclude(evento_id__in=ev_rec).select_related("evento")
    print(f"Eventi recensibili trovati: {eventi.count()}")
    eventi_recensibili.extend(eventi)

    # Debug finale
    print(f"Camere recensibili: {len(camere_recensibili)}")
    print(f"Servizi recensibili: {len(servizi_recensibili)}")
    print(f"Eventi recensibili: {len(eventi_recensibili)}")

    return render(request, "bb_app/scrivi_recensione.html", {
        "camere": camere_recensibili,
        "servizi_extra": servizi_recensibili,
        "eventi": eventi_recensibili
    })

@role_required([models.Utente.Ruolo.CLIENTE])
def inserisci_recensione(request, id):
    user_id = request.session["user_id"]
    tipo = request.GET.get("tipo")
    id_elemento = id

    if request.method == "POST":
        voto = int(request.POST.get("voto"))
        testo = request.POST.get("testo")

        if tipo == "camera":
            recensione_esistente = models.Recensisce.objects.filter(
                utente_id=user_id, comprende_id=id_elemento
            ).exists()
        elif tipo == "servizio":
            recensione_esistente = models.Recensisce.objects.filter(
                utente_id=user_id, servizio_id=id_elemento
            ).exists()
        elif tipo == "evento":
            recensione_esistente = models.Recensisce.objects.filter(
                utente_id=user_id, evento_id=id_elemento
            ).exists()
        else:
            return HttpResponseForbidden("Tipo non valido")

        if recensione_esistente:
            return HttpResponseBadRequest("Hai già recensito questo elemento.")

        nuova = models.Recensisce(
            utente_id=user_id,
            voto=voto,
            testo=testo,
            data=now().date()
        )

        if tipo == "camera":
            nuova.comprende_id = id_elemento
        elif tipo == "servizio":
            nuova.servizio_id = id_elemento
        elif tipo == "evento":
            nuova.evento_id = id_elemento

        nuova.save()
        return render(request, "bb_app/recensione_successo.html")

    return render(request, "bb_app/recensioni.html", {
        "tipo": tipo,
        "id_elemento": id_elemento,
    })

@role_required([models.Utente.Ruolo.CLIENTE])
def visualizza_recensioni(request):
    utente_id = request.session.get("user_id")

    recensioni = (
        models.Recensisce.objects
        .filter(utente_id=utente_id)
        .select_related(
            "comprende__camera",
            "comprende__prenotazione",
            "servizio",
            "evento",
        )
        .annotate(
            tipo_idx=Case(
                When(comprende__isnull=False, then=Value(0)),
                When(servizio__isnull=False,  then=Value(1)),
                default=Value(2),
                output_field=IntegerField(),
            )
        )
        .order_by("tipo_idx", "-data")
    )

    for r in recensioni:
        if r.comprende:
            r.data_fine = r.comprende.prenotazione.check_out
        elif r.servizio:
            aggiunta = (
                models.Aggiunta.objects
                .filter(
                    servizio=r.servizio,
                    prenotazione__effettua__utente_id=utente_id
                )
                .order_by("-prenotazione__check_out")
                .first()
            )
            r.data_fine = aggiunta.prenotazione.check_out if aggiunta else None
        elif r.evento:
            r.data_fine = r.evento.data_evento
        else:
            r.data_fine = None

    return render(request, "bb_app/recensioni_list.html", {"recensioni": recensioni})




