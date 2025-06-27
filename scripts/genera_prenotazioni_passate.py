from datetime import date, timedelta
from bb_app.models import Utente, Camera, Prenotazione, Effettua, Comprende

# Recupera l'utente
utente = Utente.objects.get(email="cliente@gmail.com")

# Prendi camere disponibili
camere = list(Camera.objects.filter(in_manutenzione=False)[:3])

# Crea prenotazioni completate nel passato
for i, camera in enumerate(camere):
    check_out = date.today() - timedelta(days=5 + i * 3)  # es. 22, 19, 16 giugno
    check_in = check_out - timedelta(days=2)              # es. 20, 17, 14 giugno

    pren = Prenotazione.objects.create(
        check_in=check_in,
        check_out=check_out,
        stato="completata",
        data_prenotazione=check_in - timedelta(days=1)
    )

    Effettua.objects.create(utente=utente, prenotazione=pren)

    Comprende.objects.create(
        prenotazione=pren,
        camera=camera,
        numero_ospiti=1,
        prezzo_finale=camera.prezzo_per_notte * 2
    )

print("✅ Prenotazioni completate create.")
