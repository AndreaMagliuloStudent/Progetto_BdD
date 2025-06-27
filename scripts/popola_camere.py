# popola_camere.py
from bb_app.models import Camera

TIPOLOGIE = ["singola", "doppia", "matrimoniale", "suite"]

for i in range(10, 21):  # crea camere da numero 10 a 20
    Camera.objects.create(
        numero=i,
        tipologia=TIPOLOGIE[i % len(TIPOLOGIE)],
        prezzo_per_notte=60 + (i % 4) * 20,
        in_manutenzione=False
    )

print("Camere create con successo.")
