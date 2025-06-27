
# Sistema Informativo – B&B Magliulo

Questo progetto nasce con l'obiettivo di digitalizzare la gestione operativa del Bed & Breakfast *Magliulo*, superando le attuali procedure manuali. Il sistema, sotto forma di web application sviluppata in **Django** con **MySQL**, fornisce strumenti intuitivi per gestire prenotazioni, eventi locali, servizi extra e recensioni. L'applicazione migliora l'efficienza organizzativa e offre un'esperienza utente moderna e responsive.

Alla base del sistema vi è un database relazionale strutturato che memorizza tutte le informazioni rilevanti: clienti, staff, gestori, camere, prenotazioni, eventi e feedback. L’accesso alle funzionalità è differenziato in base al ruolo dell’utente (Cliente, Staff, Gestore), con interfacce personalizzate e sicure.

---

##  Indice

- [Modello Entità/Relazione](#modello-entitàrelazione)
- [Funzionalità Principali](#funzionalità-principali)
- [Tecnologie Utilizzate](#tecnologie-utilizzate)
- [Installazione](#installazione)
- [Configurazione del Database](#configurazione-del-database)
- [Utilizzo](#utilizzo)
- [Sicurezza](#sicurezza)
- [Licenza](#licenza)

---

##  Modello Entità/Relazione

Il database è stato progettato con un modello E/R che centralizza le informazioni sull’**entità Utente**, specializzata in tre categorie disgiunte: *Cliente*, *Staff* e *Gestore*. L'entità viene gestita tramite una singola tabella relazionale, arricchita da attributi opzionali per i diversi ruoli.

![B6B_Magliulo_e-r_risolto](https://github.com/user-attachments/assets/21a6b7fe-0cc5-41e3-a67e-7b3060daa783)

Le principali entità sono:
- `Utente (Cliente, Staff, Gestore)`
- `Camera`
- `Prenotazione`
- `ServizioExtra`
- `EventoLocale`
- `Recensione`

Sono presenti numerose relazioni N:M (es. Partecipazione a eventi, Assegnazione dello staff, Aggiunta di servizi) e vincoli logici che garantiscono la coerenza (es. solo chi ha partecipato può recensire).

---

## ⚙ Funzionalità Principali

Registrazione e autenticazione per ruoli (Cliente, Staff, Gestore)
Il sistema supporta un processo di registrazione e login differenziato in base al ruolo.

I clienti possono effettuare prenotazioni, iscriversi agli eventi e lasciare recensioni.

Gli utenti staff visualizzano gli incarichi evento assegnati.

I gestori accedono a una dashboard amministrativa per la gestione di camere, eventi e utenti.

Gestione delle prenotazioni
I clienti possono selezionare un intervallo di date, scegliere le camere disponibili e aggiungere servizi extra.
Il sistema gestisce automaticamente lo stato delle prenotazioni (in attesa, in corso, completata o annullata), in base alla data corrente.

Gestione degli eventi locali
Gli eventi includono titolo, descrizione, data e posti disponibili.
I clienti possono iscriversi agli eventi fino a esaurimento posti.
Gli utenti staff vengono assegnati ai singoli eventi con un ruolo specifico (es. Chef, Guida, Barman).

Recensioni vincolate all’esperienza reale
I clienti possono recensire camere, servizi extra o eventi solo se effettivamente utilizzati tramite una prenotazione o partecipazione.
È consentita una sola recensione per elemento.

Dashboard personale e storico

I clienti accedono a un archivio delle prenotazioni, con possibilità di recensire gli elementi utilizzati.

Gli utenti staff vedono l’elenco degli eventi futuri a cui sono stati assegnati, con data e ruolo.

---

## 🛠️ Tecnologie Utilizzate

| Componente | Tecnologia |
|------------|------------|
| Backend    | Django (Python) |
| Frontend   | HTML, CSS, Bootstrap |
| Database   | MySQL (XAMPP / MariaDB) |
| Sicurezza  | CSRF token, SHA256 hashing, Cookie session |

---

## 🧪 Installazione

Assicurarsi di avere:
- Python ≥ 3.9
- Django ≥ 4.x
- MySQL installato (via XAMPP)

Dopo aver clonato il progetto, eseguire:

```bash
python manage.py makemigrations
python manage.py migrate
```

---

## 🧱 Configurazione del Database

Tutte le tabelle verranno generate automaticamente tramite il file `models.py`. I dati utente sono organizzati nella tabella `Utente`, che distingue tra *Cliente*, *Staff* e *Gestore* usando un campo `ruolo`.

Le relazioni includono:
- `Effettua`, `Comprende`, `Aggiunta`, `Partecipa`, `Assegnazione`, `Recensisce`

---

## 🚀 Utilizzo

Dopo la configurazione, avviare il server con:

```bash
python manage.py runserver
```

Aprire il browser su: [http://localhost:8000](http://localhost:8000)

**Funzionalità utente:**
- Creare un account
- Eseguire il login
- Accedere a una dashboard dedicata
- Prenotare camere e servizi
- Partecipare a eventi locali
- Lasciare recensioni (camere, eventi, servizi extra)

---

## 🔐 Sicurezza

Il sistema implementa:
- **Hashing password** con SHA256
- **Protezione CSRF** integrata in tutte le form
- **Gestione sessioni** via cookie sicuri
- **Validazione accessi** con controllo ruolo e flag `is_authenticated`
- **Test anti-SQL Injection** con SQLMap (per validare la sicurezza del login)

---

## 📄 Licenza

Questo progetto è stato realizzato da **Andrea Magliulo** per il corso di **Basi di Dati** – Università degli Studi, A.A. 2024/2025.  
Uso didattico e personale. Non destinato alla distribuzione commerciale.
