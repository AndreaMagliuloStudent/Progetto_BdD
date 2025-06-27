from django.db import models
from django_mysql.models import EnumField

class Utente(models.Model):
    class Ruolo(models.TextChoices):
        CLIENTE = 'Cliente'
        STAFF = 'Staff'
        GESTORE = 'Gestore'

    nome = models.CharField(max_length=50, null=True, blank=True)
    cognome = models.CharField(max_length=50, null=True, blank=True)
    email = models.EmailField(unique=True)
    password = models.CharField(max_length=128)
    telefono = models.CharField(max_length=20, null=True, blank=True)
    ruolo = EnumField(choices=Ruolo.choices, default=Ruolo.CLIENTE)
    # Solo per clienti
    data_registrazione = models.DateField(null=True, blank=True)
    numero_documento = models.CharField(max_length=30, null=True, blank=True)
    newsletter = models.BooleanField(default=False)
    note = models.TextField(null=True, blank=True)
    # Solo per staff
    ruolo_staff = models.CharField(max_length=50, null=True, blank=True)
    # Solo per gestore
    data_nomina = models.DateField(null=True, blank=True)
    attivo = models.BooleanField(null=True, blank=True)

    def __str__(self):
        return self.email

class Camera(models.Model):
    class Tipologia(models.TextChoices):
        SINGOLA = 'singola'
        DOPPIA = 'doppia'
        MATRIMONIALE = 'matrimoniale'
        SUITE = 'suite'

    numero = models.CharField(max_length=10)
    tipologia = EnumField(choices=Tipologia.choices)
    prezzo_per_notte = models.DecimalField(max_digits=6, decimal_places=2)
    in_manutenzione = EnumField(choices=[('sì', 'sì'), ('no', 'no')])
    descrizione = models.TextField(null=True, blank=True)

    def __str__(self):
        return f"Camera {self.numero} ({self.tipologia})"


class ServizioExtra(models.Model):
    class Tipo(models.TextChoices):
        COLAZIONE = 'colazione'
        NAVETTA = 'navetta'
        SPA = 'spa'
        ESCURSIONE = 'escursione'

    tipo = EnumField(choices=Tipo.choices)
    descrizione = models.TextField(null=True, blank=True)
    prezzo = models.DecimalField(max_digits=6, decimal_places=2)

    def __str__(self):
        return self.tipo


class EventoLocale(models.Model):
    class Titolo(models.TextChoices):
        DEGUSTAZIONE = 'degustazione'
        ESCURSIONE = 'escursione'
        VISITA_GUIDATA = 'visita guidata'
        SERATA_TEMA = 'serata a tema'

    titolo = EnumField(choices=Titolo.choices)
    descrizione = models.TextField(null=True, blank=True)
    data_evento = models.DateField()
    posti_disponibili = models.PositiveIntegerField()
    costo = models.DecimalField(max_digits=6, decimal_places=2)

    def __str__(self):
        return f"{self.titolo} - {self.data_evento}"


class Prenotazione(models.Model):
    class Stato(models.TextChoices):
        ATTESA = 'in attesa'
        CONFERMATA = 'confermata'
        ANNULLATA = 'annullata'
        COMPLETATA = 'completata'

    check_in = models.DateField()
    check_out = models.DateField()
    stato = EnumField(choices=Stato.choices, default=Stato.ATTESA)
    data_prenotazione = models.DateField(auto_now_add=True)

    def __str__(self):
        return f"Prenotazione #{self.id}"


class Effettua(models.Model):
    utente = models.ForeignKey(Utente, on_delete=models.CASCADE)
    prenotazione = models.ForeignKey(Prenotazione, on_delete=models.CASCADE)

    class Meta:
        unique_together = ('utente', 'prenotazione')


class Comprende(models.Model):
    prenotazione = models.ForeignKey(Prenotazione, on_delete=models.CASCADE)
    camera = models.ForeignKey(Camera, on_delete=models.CASCADE)
    numero_ospiti = models.PositiveIntegerField()
    prezzo_finale = models.DecimalField(max_digits=8, decimal_places=2)

    class Meta:
        unique_together = ('prenotazione', 'camera')


class Aggiunta(models.Model):
    prenotazione = models.ForeignKey(Prenotazione, on_delete=models.CASCADE)
    servizio = models.ForeignKey(ServizioExtra, on_delete=models.CASCADE)

    class Meta:
        unique_together = ('prenotazione', 'servizio')


class Partecipa(models.Model):
    utente = models.ForeignKey(Utente, on_delete=models.CASCADE)
    evento = models.ForeignKey(EventoLocale, on_delete=models.CASCADE)
    data_iscrizione = models.DateField()

    class Meta:
        unique_together = ('utente', 'evento')


class Assegnazione(models.Model):
    utente = models.ForeignKey(Utente, on_delete=models.CASCADE)
    evento = models.ForeignKey(EventoLocale, on_delete=models.CASCADE)
    ruolo_evento = models.CharField(max_length=50)

    class Meta:
        unique_together = ('utente', 'evento')


class Recensisce(models.Model):
    utente = models.ForeignKey(Utente, on_delete=models.CASCADE)
    comprende = models.ForeignKey('Comprende', null=True, blank=True, on_delete=models.CASCADE)
    servizio = models.ForeignKey(ServizioExtra, null=True, blank=True, on_delete=models.CASCADE)
    evento = models.ForeignKey(EventoLocale, null=True, blank=True, on_delete=models.CASCADE)
    data = models.DateField()
    testo = models.TextField()
    voto = models.PositiveIntegerField()

    class Meta:
        constraints = [
            models.CheckConstraint(
                check=(
                    models.Q(comprende__isnull=False) |
                    models.Q(servizio__isnull=False) |
                    models.Q(evento__isnull=False)
                ),
                name="almeno_uno_valorizzato"
            )
        ]

