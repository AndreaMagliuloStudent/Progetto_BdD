
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

## ⚙️ Funzionalità Principali

**Per i clienti:**
- Registrazione e login
- Prenotazione camere + servizi extra
- Iscrizione a eventi locali
- Scrittura recensioni (post-soggiorno)

**Per lo staff:**
- Visualizzazione eventi assegnati
- Ruolo operativo specifico per evento

**Per i gestori:**
- Dashboard di controllo
- Creazione e modifica di eventi e camere
- Accesso a statistiche e informazioni utenti

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
