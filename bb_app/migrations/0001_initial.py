# Generated by Django 4.2 on 2025-06-26 15:42

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Camera',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('numero', models.IntegerField()),
                ('tipologia', models.CharField(choices=[('singola', 'Singola'), ('doppia', 'Doppia'), ('matrimoniale', 'Matrimoniale'), ('suite', 'Suite')], max_length=20)),
                ('prezzo_per_notte', models.DecimalField(decimal_places=2, max_digits=6)),
                ('in_manutenzione', models.BooleanField(default=False)),
                ('descrizione', models.TextField(blank=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='EventoLocale',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('titolo', models.CharField(choices=[('degustazione', 'Degustazione'), ('escursione', 'Escursione'), ('visita guidata', 'Visita Guidata'), ('serata a tema', 'Serata Tema')], max_length=30)),
                ('descrizione', models.TextField()),
                ('data_evento', models.DateField()),
                ('posti_disponibili', models.IntegerField()),
                ('costo', models.DecimalField(decimal_places=2, max_digits=6)),
            ],
        ),
        migrations.CreateModel(
            name='Prenotazione',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('check_in', models.DateField()),
                ('check_out', models.DateField()),
                ('stato', models.CharField(choices=[('in attesa', 'Attesa'), ('confermata', 'Confermata'), ('annullata', 'Annullata'), ('completata', 'Completata')], default='in attesa', max_length=15)),
                ('data_prenotazione', models.DateField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name='ServizioExtra',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tipo', models.CharField(choices=[('colazione', 'Colazione'), ('navetta', 'Navetta'), ('spa', 'Spa'), ('escursione', 'Escursione')], max_length=20)),
                ('descrizione', models.TextField()),
                ('prezzo', models.DecimalField(decimal_places=2, max_digits=6)),
            ],
        ),
        migrations.CreateModel(
            name='Utente',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nome', models.CharField(blank=True, max_length=50, null=True)),
                ('cognome', models.CharField(blank=True, max_length=50, null=True)),
                ('email', models.EmailField(max_length=254, unique=True)),
                ('password', models.CharField(max_length=128)),
                ('telefono', models.CharField(blank=True, max_length=20, null=True)),
                ('ruolo', models.CharField(choices=[('Cliente', 'Cliente'), ('Staff', 'Staff'), ('Gestore', 'Gestore')], max_length=10)),
                ('data_registrazione', models.DateField(blank=True, null=True)),
                ('numero_documento', models.CharField(blank=True, max_length=30, null=True)),
                ('newsletter', models.BooleanField(default=False)),
                ('note', models.TextField(blank=True, null=True)),
                ('ruolo_staff', models.CharField(blank=True, max_length=50, null=True)),
                ('data_nomina', models.DateField(blank=True, null=True)),
                ('attivo', models.BooleanField(blank=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Recensisce',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('data', models.DateField()),
                ('testo', models.TextField()),
                ('voto', models.IntegerField()),
                ('camera', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='bb_app.camera')),
                ('evento', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='bb_app.eventolocale')),
                ('servizio', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='bb_app.servizioextra')),
                ('utente', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='bb_app.utente')),
            ],
        ),
        migrations.CreateModel(
            name='Effettua',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('prenotazione', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='bb_app.prenotazione')),
                ('utente', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='bb_app.utente')),
            ],
        ),
        migrations.CreateModel(
            name='Comprende',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('numero_ospiti', models.PositiveIntegerField()),
                ('prezzo_finale', models.DecimalField(decimal_places=2, max_digits=8)),
                ('camera', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='bb_app.camera')),
                ('prenotazione', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='bb_app.prenotazione')),
            ],
        ),
        migrations.CreateModel(
            name='Assegnazione',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ruolo_evento', models.CharField(max_length=50)),
                ('evento', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='bb_app.eventolocale')),
                ('utente', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='bb_app.utente')),
            ],
        ),
        migrations.CreateModel(
            name='Aggiunta',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('prenotazione', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='bb_app.prenotazione')),
                ('servizio', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='bb_app.servizioextra')),
            ],
        ),
        migrations.CreateModel(
            name='Partecipa',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('data_iscrizione', models.DateField()),
                ('evento', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='bb_app.eventolocale')),
                ('utente', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='bb_app.utente')),
            ],
            options={
                'unique_together': {('utente', 'evento')},
            },
        ),
    ]
