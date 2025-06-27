# bb_app/urls.py
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static

from bb_app.views import (
    home, login_view, logout_view, registrazione_utente,
    dashboard_cliente, dashboard_staff, dashboard_gestore,
    effettua_prenotazione, prenotazione_successo, storico_prenotazioni,
    scrivi_recensione, inserisci_recensione, visualizza_recensioni,
    lista_eventi, iscrizione_evento, eventi_iscritti,
    lista_incarichi,
#   login_vulnerabile

)

urlpatterns = [
    # ------------------------  Pagine pubbliche ------------------------
    path('',  home,  name='home'),
    path('login/',  login_view,  name='login'),
    path('logout/', logout_view, name='logout'),
    path('registrazione/', registrazione_utente, name='registrazione'),

    # ------------------------  Area Cliente ---------------------------
    path('cliente/dashboard/', dashboard_cliente, name='dashboard_cliente'),
    path('cliente/prenotazione/', effettua_prenotazione, name='effettua_prenotazione'),
    path('cliente/prenotazione/successo/<int:pren_id>/',
         prenotazione_successo, name='prenotazione_successo'),
    path('cliente/storico/', storico_prenotazioni, name='storico_prenotazioni'),
    path('cliente/recensioni/aggiungi/', scrivi_recensione, name='scrivi_recensione'),
    path('cliente/recensioni/nuova/camera/<int:id>/',
         inserisci_recensione, name='recensisci_camera'),
    path('cliente/recensioni/nuova/servizio/<int:id>/',
         inserisci_recensione, name='recensisci_servizio'),
    path('cliente/recensioni/nuova/evento/<int:id>/',
         inserisci_recensione, name='recensisci_evento'),

    # ------------------------  Eventi ---------------------------------
    path('eventi/', lista_eventi, name='iscrizione_eventi'),
    path('eventi/iscrizione/<int:evento_id>/',
         iscrizione_evento, name='iscrizione_evento'),
    path('eventi/iscritti/', eventi_iscritti, name='eventi_iscritti'),

    # ------------------------  Recensioni (lista) ---------------------
    path('recensioni/', visualizza_recensioni, name='visualizza_recensioni'),

    # ------------------------ Gestore ------------------------
    path('gestore/dashboard/', dashboard_gestore, name='dashboard_gestore'),

    # ------------------------ Staff ------------------------
    path('staff/dashboard/', dashboard_staff, name='dashboard_staff'),
    path('staff/incarichi/', lista_incarichi, name='staff_incarichi'),  # ← nuova rotta

    # ------------------------ Test SQL Injection ------------------------
 #   path("login_vulnerabile/", login_vulnerabile, name="login_vulnerabile"),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
