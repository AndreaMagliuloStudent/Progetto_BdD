-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Giu 27, 2025 alle 22:24
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gestionale_bb`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add camera', 7, 'add_camera'),
(26, 'Can change camera', 7, 'change_camera'),
(27, 'Can delete camera', 7, 'delete_camera'),
(28, 'Can view camera', 7, 'view_camera'),
(29, 'Can add evento locale', 8, 'add_eventolocale'),
(30, 'Can change evento locale', 8, 'change_eventolocale'),
(31, 'Can delete evento locale', 8, 'delete_eventolocale'),
(32, 'Can view evento locale', 8, 'view_eventolocale'),
(33, 'Can add prenotazione', 9, 'add_prenotazione'),
(34, 'Can change prenotazione', 9, 'change_prenotazione'),
(35, 'Can delete prenotazione', 9, 'delete_prenotazione'),
(36, 'Can view prenotazione', 9, 'view_prenotazione'),
(37, 'Can add servizio extra', 10, 'add_servizioextra'),
(38, 'Can change servizio extra', 10, 'change_servizioextra'),
(39, 'Can delete servizio extra', 10, 'delete_servizioextra'),
(40, 'Can view servizio extra', 10, 'view_servizioextra'),
(41, 'Can add utente', 11, 'add_utente'),
(42, 'Can change utente', 11, 'change_utente'),
(43, 'Can delete utente', 11, 'delete_utente'),
(44, 'Can view utente', 11, 'view_utente'),
(45, 'Can add recensisce', 12, 'add_recensisce'),
(46, 'Can change recensisce', 12, 'change_recensisce'),
(47, 'Can delete recensisce', 12, 'delete_recensisce'),
(48, 'Can view recensisce', 12, 'view_recensisce'),
(49, 'Can add effettua', 13, 'add_effettua'),
(50, 'Can change effettua', 13, 'change_effettua'),
(51, 'Can delete effettua', 13, 'delete_effettua'),
(52, 'Can view effettua', 13, 'view_effettua'),
(53, 'Can add comprende', 14, 'add_comprende'),
(54, 'Can change comprende', 14, 'change_comprende'),
(55, 'Can delete comprende', 14, 'delete_comprende'),
(56, 'Can view comprende', 14, 'view_comprende'),
(57, 'Can add assegnazione', 15, 'add_assegnazione'),
(58, 'Can change assegnazione', 15, 'change_assegnazione'),
(59, 'Can delete assegnazione', 15, 'delete_assegnazione'),
(60, 'Can view assegnazione', 15, 'view_assegnazione'),
(61, 'Can add aggiunta', 16, 'add_aggiunta'),
(62, 'Can change aggiunta', 16, 'change_aggiunta'),
(63, 'Can delete aggiunta', 16, 'delete_aggiunta'),
(64, 'Can view aggiunta', 16, 'view_aggiunta'),
(65, 'Can add partecipa', 17, 'add_partecipa'),
(66, 'Can change partecipa', 17, 'change_partecipa'),
(67, 'Can delete partecipa', 17, 'delete_partecipa'),
(68, 'Can view partecipa', 17, 'view_partecipa');

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$THE7kRxHgGVHWTiaeADSLE$zZ6aUUxenNIuqLxgKg4cUJBtwjhFFQux1i3oqPjw9/w=', NULL, 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2025-06-26 16:13:07.166190');

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `bb_app_aggiunta`
--

CREATE TABLE `bb_app_aggiunta` (
  `id` bigint(20) NOT NULL,
  `prenotazione_id` bigint(20) NOT NULL,
  `servizio_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `bb_app_aggiunta`
--

INSERT INTO `bb_app_aggiunta` (`id`, `prenotazione_id`, `servizio_id`) VALUES
(1, 4, 5),
(3, 6, 1),
(4, 7, 1),
(6, 9, 1),
(7, 10, 1),
(8, 11, 1),
(9, 12, 1),
(10, 13, 5),
(11, 14, 1),
(12, 15, 1),
(13, 18, 1),
(14, 20, 3),
(15, 21, 4),
(16, 22, 5),
(17, 23, 1),
(18, 24, 3),
(19, 25, 3),
(20, 26, 3),
(21, 27, 3),
(22, 28, 3),
(23, 29, 5);

-- --------------------------------------------------------

--
-- Struttura della tabella `bb_app_assegnazione`
--

CREATE TABLE `bb_app_assegnazione` (
  `id` bigint(20) NOT NULL,
  `ruolo_evento` varchar(50) NOT NULL,
  `evento_id` bigint(20) NOT NULL,
  `utente_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `bb_app_assegnazione`
--

INSERT INTO `bb_app_assegnazione` (`id`, `ruolo_evento`, `evento_id`, `utente_id`) VALUES
(1, 'Chef', 1, 8),
(2, 'Reception', 4, 4),
(3, 'Guida cucina', 2, 8);

-- --------------------------------------------------------

--
-- Struttura della tabella `bb_app_camera`
--

CREATE TABLE `bb_app_camera` (
  `id` bigint(20) NOT NULL,
  `numero` int(11) NOT NULL,
  `tipologia` enum('singola','doppia','matrimoniale','suite') NOT NULL,
  `prezzo_per_notte` decimal(6,2) NOT NULL,
  `in_manutenzione` tinyint(1) NOT NULL,
  `descrizione` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `bb_app_camera`
--

INSERT INTO `bb_app_camera` (`id`, `numero`, `tipologia`, `prezzo_per_notte`, `in_manutenzione`, `descrizione`) VALUES
(1, 101, 'singola', 50.00, 0, NULL),
(2, 102, 'doppia', 75.00, 0, NULL),
(3, 103, 'matrimoniale', 90.00, 0, NULL),
(4, 201, 'suite', 150.00, 0, NULL),
(5, 10, 'matrimoniale', 100.00, 0, NULL),
(6, 11, 'suite', 120.00, 0, NULL),
(7, 12, 'singola', 60.00, 0, NULL),
(8, 13, 'doppia', 80.00, 0, NULL),
(9, 14, 'matrimoniale', 100.00, 0, NULL),
(10, 15, 'suite', 120.00, 0, NULL),
(11, 16, 'singola', 60.00, 0, NULL),
(12, 17, 'doppia', 80.00, 0, NULL),
(13, 18, 'matrimoniale', 100.00, 0, NULL),
(14, 19, 'suite', 120.00, 0, NULL),
(15, 20, 'singola', 60.00, 0, NULL),
(16, 10, 'matrimoniale', 100.00, 0, NULL),
(17, 11, 'suite', 120.00, 0, NULL),
(18, 12, 'singola', 60.00, 0, NULL),
(19, 13, 'doppia', 80.00, 0, NULL),
(20, 14, 'matrimoniale', 100.00, 0, NULL),
(21, 15, 'suite', 120.00, 0, NULL),
(22, 16, 'singola', 60.00, 0, NULL),
(23, 17, 'doppia', 80.00, 0, NULL),
(24, 18, 'matrimoniale', 100.00, 0, NULL),
(25, 19, 'suite', 120.00, 0, NULL),
(26, 20, 'singola', 60.00, 0, NULL),
(27, 101, 'doppia', 80.00, 0, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `bb_app_comprende`
--

CREATE TABLE `bb_app_comprende` (
  `id` bigint(20) NOT NULL,
  `numero_ospiti` int(10) UNSIGNED NOT NULL CHECK (`numero_ospiti` >= 0),
  `prezzo_finale` decimal(8,2) NOT NULL,
  `camera_id` bigint(20) NOT NULL,
  `prenotazione_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `bb_app_comprende`
--

INSERT INTO `bb_app_comprende` (`id`, `numero_ospiti`, `prezzo_finale`, `camera_id`, `prenotazione_id`) VALUES
(1, 2, 300.00, 2, 4),
(2, 2, 270.00, 3, 5),
(3, 2, 450.00, 4, 6),
(4, 2, 90.00, 3, 7),
(5, 2, 100.00, 24, 8),
(6, 2, 200.00, 5, 9),
(7, 2, 480.00, 6, 10),
(8, 2, 240.00, 8, 11),
(9, 2, 320.00, 12, 12),
(10, 2, 200.00, 9, 13),
(11, 1, 50.00, 1, 14),
(12, 2, 100.00, 1, 15),
(13, 2, 480.00, 10, 18),
(14, 2, 400.00, 27, 19),
(15, 1, 100.00, 1, 20),
(16, 1, 100.00, 1, 21),
(17, 1, 100.00, 1, 22),
(18, 2, 300.00, 16, 23),
(19, 1, 150.00, 1, 25),
(20, 1, 150.00, 1, 26),
(21, 1, 150.00, 1, 27),
(22, 1, 150.00, 1, 28),
(23, 2, 300.00, 20, 29);

-- --------------------------------------------------------

--
-- Struttura della tabella `bb_app_effettua`
--

CREATE TABLE `bb_app_effettua` (
  `id` bigint(20) NOT NULL,
  `prenotazione_id` bigint(20) NOT NULL,
  `utente_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `bb_app_effettua`
--

INSERT INTO `bb_app_effettua` (`id`, `prenotazione_id`, `utente_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 11, 1),
(12, 12, 1),
(13, 13, 1),
(14, 14, 1),
(15, 15, 1),
(16, 16, 1),
(17, 17, 1),
(18, 18, 1),
(19, 19, 1),
(20, 20, 1),
(21, 21, 1),
(22, 22, 1),
(23, 23, 1),
(24, 24, 2),
(25, 25, 1),
(26, 26, 1),
(27, 27, 1),
(28, 28, 1),
(29, 29, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `bb_app_eventolocale`
--

CREATE TABLE `bb_app_eventolocale` (
  `id` bigint(20) NOT NULL,
  `titolo` enum('degustazione','escursione','visita guidata','serata a tema') NOT NULL,
  `descrizione` longtext NOT NULL,
  `data_evento` date NOT NULL,
  `posti_disponibili` int(11) NOT NULL,
  `costo` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `bb_app_eventolocale`
--

INSERT INTO `bb_app_eventolocale` (`id`, `titolo`, `descrizione`, `data_evento`, `posti_disponibili`, `costo`) VALUES
(1, 'degustazione', 'Un tour guidato con degustazione dei migliori vini della regione.', '2025-07-05', 14, 25.00),
(2, 'escursione', 'Passeggiata nei sentieri montani con guida ambientale certificata.', '2025-07-12', 19, 30.00),
(3, 'visita guidata', 'Scoperta del centro storico con guida turistica esperta.', '2025-07-20', 9, 15.00),
(4, 'serata a tema', 'Cena con musica dal vivo e piatti tipici locali.', '2025-07-27', 24, 35.00),
(5, 'degustazione', 'Evento esclusivo per clienti selezionati. Posti esauriti.', '2025-08-03', 0, 40.00),
(6, 'degustazione', 'Degustazione primavera', '2025-03-15', 0, 20.00),
(7, 'visita guidata', 'Tour guidato al castello antico', '2025-04-10', 0, 18.00),
(8, 'serata a tema', 'Serata Jazz & Wine', '2025-05-20', 0, 30.00),
(9, 'degustazione', 'Degustazione di vini locali', '2025-06-24', 10, 15.00),
(10, 'degustazione', 'Degustazione vini locali', '2025-06-21', 10, 20.00);

-- --------------------------------------------------------

--
-- Struttura della tabella `bb_app_partecipa`
--

CREATE TABLE `bb_app_partecipa` (
  `id` bigint(20) NOT NULL,
  `data_iscrizione` date NOT NULL,
  `evento_id` bigint(20) NOT NULL,
  `utente_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `bb_app_partecipa`
--

INSERT INTO `bb_app_partecipa` (`id`, `data_iscrizione`, `evento_id`, `utente_id`) VALUES
(1, '2025-06-27', 1, 1),
(2, '2025-02-20', 6, 1),
(3, '2025-03-28', 7, 1),
(4, '2025-04-25', 8, 1),
(5, '2025-06-27', 3, 1),
(6, '2025-06-27', 2, 1),
(7, '2025-06-23', 9, 1),
(8, '2025-06-19', 10, 1),
(9, '2025-06-27', 4, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `bb_app_prenotazione`
--

CREATE TABLE `bb_app_prenotazione` (
  `id` bigint(20) NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `stato` enum('in attesa','confermata','in corso','completata','annullata') NOT NULL,
  `data_prenotazione` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `bb_app_prenotazione`
--

INSERT INTO `bb_app_prenotazione` (`id`, `check_in`, `check_out`, `stato`, `data_prenotazione`) VALUES
(1, '2025-06-26', '2025-06-28', 'in corso', '2025-06-26'),
(2, '2025-06-26', '2025-06-28', 'in corso', '2025-06-26'),
(3, '2025-07-02', '2025-07-04', 'in attesa', '2025-06-27'),
(4, '2025-06-28', '2025-07-02', 'in attesa', '2025-06-27'),
(5, '2025-06-28', '2025-07-01', 'in attesa', '2025-06-27'),
(6, '2025-06-28', '2025-07-01', 'in attesa', '2025-06-27'),
(7, '2025-07-01', '2025-07-02', 'in attesa', '2025-06-27'),
(8, '2025-06-28', '2025-06-29', 'in attesa', '2025-06-27'),
(9, '2025-06-28', '2025-06-30', 'in attesa', '2025-06-27'),
(10, '2025-06-28', '2025-07-02', 'in attesa', '2025-06-27'),
(11, '2025-06-28', '2025-07-01', 'in attesa', '2025-06-27'),
(12, '2025-06-28', '2025-07-02', 'in attesa', '2025-06-27'),
(13, '2025-06-29', '2025-07-01', 'in attesa', '2025-06-27'),
(14, '2025-07-01', '2025-07-02', 'in attesa', '2025-06-27'),
(15, '2025-06-20', '2025-06-22', 'completata', '2025-06-27'),
(16, '2025-06-21', '2025-06-23', 'completata', '2025-06-27'),
(17, '2025-06-22', '2025-06-24', 'completata', '2025-06-27'),
(18, '2025-06-28', '2025-07-02', 'in attesa', '2025-06-27'),
(19, '2025-06-12', '2025-06-17', 'completata', '2025-06-27'),
(20, '2025-04-10', '2025-04-12', 'completata', '2025-06-27'),
(21, '2025-03-05', '2025-03-07', 'completata', '2025-06-27'),
(22, '2025-01-15', '2025-01-18', 'completata', '2025-06-27'),
(23, '2025-06-28', '2025-07-01', 'in attesa', '2025-06-27'),
(24, '2024-06-01', '2024-06-03', 'completata', '2025-06-27'),
(25, '2025-06-22', '2025-06-25', 'completata', '2025-06-27'),
(26, '2025-06-22', '2025-06-25', 'completata', '2025-06-27'),
(27, '2025-06-22', '2025-06-25', 'completata', '2025-06-27'),
(28, '2025-06-17', '2025-06-20', 'completata', '2025-06-27'),
(29, '2025-06-28', '2025-07-01', 'in attesa', '2025-06-27');

-- --------------------------------------------------------

--
-- Struttura della tabella `bb_app_recensisce`
--

CREATE TABLE `bb_app_recensisce` (
  `id` bigint(20) NOT NULL,
  `data` date NOT NULL,
  `testo` longtext NOT NULL,
  `voto` int(11) NOT NULL,
  `evento_id` bigint(20) DEFAULT NULL,
  `servizio_id` bigint(20) DEFAULT NULL,
  `utente_id` bigint(20) NOT NULL,
  `comprende_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `bb_app_recensisce`
--

INSERT INTO `bb_app_recensisce` (`id`, `data`, `testo`, `voto`, `evento_id`, `servizio_id`, `utente_id`, `comprende_id`) VALUES
(2, '2025-06-27', 'ok!', 1, NULL, 1, 1, NULL),
(4, '2025-06-27', 'servizio pessimo', 1, NULL, 3, 1, NULL),
(7, '2025-06-27', 'ottino', 4, NULL, NULL, 1, 12),
(8, '2025-06-27', 'good', 2, NULL, NULL, 1, 15),
(9, '2025-06-27', 'buono', 3, 6, NULL, 1, NULL),
(10, '2025-06-27', 'ok va bene', 2, NULL, NULL, 1, 17),
(11, '2025-06-27', 'okay', 3, 7, NULL, 1, NULL),
(12, '2025-06-27', '3', 3, NULL, NULL, 1, 21),
(13, '2025-06-27', 'VERY WELL', 5, NULL, NULL, 1, 20),
(19, '2025-06-27', 'Buona', 2, NULL, 16, 1, NULL),
(22, '2025-06-27', 'Buona', 2, NULL, 15, 1, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `bb_app_servizioextra`
--

CREATE TABLE `bb_app_servizioextra` (
  `id` bigint(20) NOT NULL,
  `tipo` enum('colazione','navetta','spa','escursione','culla','letto aggiuntivo') NOT NULL,
  `descrizione` longtext NOT NULL,
  `prezzo` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `bb_app_servizioextra`
--

INSERT INTO `bb_app_servizioextra` (`id`, `tipo`, `descrizione`, `prezzo`) VALUES
(1, 'culla', 'Culla per bambini', 15.00),
(3, 'colazione', 'Colazione continentale inclusa', 7.00),
(4, 'navetta', 'Servizio navetta da/per aeroporto', 20.00),
(5, 'spa', 'Accesso giornaliero alla spa', 15.00),
(6, 'escursione', 'Tour guidato dei dintorni', 30.00),
(7, 'letto aggiuntivo', 'Letto supplementare per ospite aggiuntivo', 25.00),
(15, 'navetta', 'Servizio navetta per gli ospiti', 20.00),
(16, 'navetta', 'Servizio navetta per gli ospiti', 15.00);

-- --------------------------------------------------------

--
-- Struttura della tabella `bb_app_utente`
--

CREATE TABLE `bb_app_utente` (
  `id` bigint(20) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `cognome` varchar(50) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(128) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `ruolo` enum('Cliente','Staff','Gestore') NOT NULL,
  `data_registrazione` date DEFAULT NULL,
  `numero_documento` varchar(30) DEFAULT NULL,
  `newsletter` tinyint(1) NOT NULL,
  `note` longtext DEFAULT NULL,
  `ruolo_staff` varchar(50) DEFAULT NULL,
  `data_nomina` date DEFAULT NULL,
  `attivo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `bb_app_utente`
--

INSERT INTO `bb_app_utente` (`id`, `nome`, `cognome`, `email`, `password`, `telefono`, `ruolo`, `data_registrazione`, `numero_documento`, `newsletter`, `note`, `ruolo_staff`, `data_nomina`, `attivo`) VALUES
(1, 'Andrea', 'Magliulo', 'cliente@gmail.com', 'a60b85d409a01d46023f90741e01b79543a3cb1ba048eaefbe5d7a63638043bf', NULL, 'Cliente', NULL, '132321312', 0, NULL, NULL, NULL, NULL),
(2, 'Andrea', 'Magliulo', 'andrea@example.com', 'password123', NULL, 'Cliente', '2024-06-01', 'AA123456', 0, NULL, NULL, NULL, NULL),
(3, 'Admin', 'Gestore', 'admin@gmail.com', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', NULL, 'Gestore', NULL, NULL, 0, NULL, NULL, '2025-06-27', 1),
(4, 'Giulia', 'Bianchi', 'reception@magliulo.it', '5145dba3b6bda2d610d2c5c435a1c2481eefd3146b6a7e004ad73f794386e031', NULL, 'Staff', NULL, NULL, 0, NULL, 'Receptionist', NULL, NULL),
(5, 'Laura', 'Verdi', 'housekeeping@magliulo.it', '01ead8eb84fc6cdf0db9b7de73a8f544a1517c2ba96eef420f1fd07736887209', NULL, 'Staff', NULL, NULL, 0, NULL, 'Housekeeping', NULL, NULL),
(6, 'Sara', 'Verdi', 'guida@magliulo.it', 'pbkdf2_sha256$...hash...', NULL, 'Staff', NULL, NULL, 0, NULL, 'Guida', NULL, NULL),
(7, 'Marco', 'Rossi', 'eventi@magliulo.it', 'cd7966c7cf778089b25c3d35c8c804c84e85f1c0530657251e06706e48747cde', NULL, 'Staff', NULL, NULL, 0, NULL, 'Event Coordinator', NULL, NULL),
(8, 'Chef', 'Magliulo', 'chef@magliulo.it', 'fa0990ab6f2ecfd562611cedad67152e8c1117f91c22d15094d1e242314243af', NULL, 'Staff', NULL, NULL, 0, NULL, 'Chef', NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(16, 'bb_app', 'aggiunta'),
(15, 'bb_app', 'assegnazione'),
(7, 'bb_app', 'camera'),
(14, 'bb_app', 'comprende'),
(13, 'bb_app', 'effettua'),
(8, 'bb_app', 'eventolocale'),
(17, 'bb_app', 'partecipa'),
(9, 'bb_app', 'prenotazione'),
(12, 'bb_app', 'recensisce'),
(10, 'bb_app', 'servizioextra'),
(11, 'bb_app', 'utente'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Struttura della tabella `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-06-26 15:42:15.317196'),
(2, 'auth', '0001_initial', '2025-06-26 15:42:15.675641'),
(3, 'admin', '0001_initial', '2025-06-26 15:42:15.758116'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-06-26 15:42:15.762425'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-06-26 15:42:15.767793'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-06-26 15:42:15.802065'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-06-26 15:42:15.844644'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-06-26 15:42:15.851998'),
(9, 'auth', '0004_alter_user_username_opts', '2025-06-26 15:42:15.856011'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-06-26 15:42:15.884129'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-06-26 15:42:15.885972'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-06-26 15:42:15.890078'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-06-26 15:42:15.897359'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-06-26 15:42:15.905116'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-06-26 15:42:15.912628'),
(16, 'auth', '0011_update_proxy_permissions', '2025-06-26 15:42:15.916545'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-06-26 15:42:15.923584'),
(18, 'bb_app', '0001_initial', '2025-06-26 15:42:16.584760'),
(19, 'sessions', '0001_initial', '2025-06-26 15:42:16.606885'),
(20, 'bb_app', '0002_alter_camera_tipologia_alter_eventolocale_titolo_and_more', '2025-06-26 16:10:44.547191'),
(21, 'bb_app', '0003_alter_servizioextra_tipo', '2025-06-26 22:06:06.204575'),
(22, 'bb_app', '0004_alter_prenotazione_stato', '2025-06-27 01:02:06.370006');

-- --------------------------------------------------------

--
-- Struttura della tabella `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('8w12lxh5wyzqpgfkhplo1j0wuijx6j9j', 'eyJ1c2VyX2lkIjo4LCJydW9sbyI6IlN0YWZmIiwiaXNfYXV0aGVudGljYXRlZCI6dHJ1ZX0:1uVF2B:VMWM_F-jsDixVccgVe-cdx4I_jkVjYgDd4329uRFN6k', '2025-07-11 19:46:51.935085');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indici per le tabelle `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indici per le tabelle `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indici per le tabelle `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indici per le tabelle `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indici per le tabelle `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indici per le tabelle `bb_app_aggiunta`
--
ALTER TABLE `bb_app_aggiunta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bb_app_aggiunta_prenotazione_id_76b958db_fk_bb_app_pr` (`prenotazione_id`),
  ADD KEY `bb_app_aggiunta_servizio_id_44fc5659_fk_bb_app_servizioextra_id` (`servizio_id`);

--
-- Indici per le tabelle `bb_app_assegnazione`
--
ALTER TABLE `bb_app_assegnazione`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bb_app_assegnazione_evento_id_34fecb6d_fk_bb_app_eventolocale_id` (`evento_id`),
  ADD KEY `bb_app_assegnazione_utente_id_648f1695_fk_bb_app_utente_id` (`utente_id`);

--
-- Indici per le tabelle `bb_app_camera`
--
ALTER TABLE `bb_app_camera`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `bb_app_comprende`
--
ALTER TABLE `bb_app_comprende`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bb_app_comprende_camera_id_bc59b32b_fk_bb_app_camera_id` (`camera_id`),
  ADD KEY `bb_app_comprende_prenotazione_id_e35d6818_fk_bb_app_pr` (`prenotazione_id`);

--
-- Indici per le tabelle `bb_app_effettua`
--
ALTER TABLE `bb_app_effettua`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bb_app_effettua_prenotazione_id_3c230462_fk_bb_app_pr` (`prenotazione_id`),
  ADD KEY `bb_app_effettua_utente_id_b645619e_fk_bb_app_utente_id` (`utente_id`);

--
-- Indici per le tabelle `bb_app_eventolocale`
--
ALTER TABLE `bb_app_eventolocale`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `bb_app_partecipa`
--
ALTER TABLE `bb_app_partecipa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bb_app_partecipa_utente_id_evento_id_6154557e_uniq` (`utente_id`,`evento_id`),
  ADD KEY `bb_app_partecipa_evento_id_1b5dd969_fk_bb_app_eventolocale_id` (`evento_id`);

--
-- Indici per le tabelle `bb_app_prenotazione`
--
ALTER TABLE `bb_app_prenotazione`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `bb_app_recensisce`
--
ALTER TABLE `bb_app_recensisce`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bb_app_recensisce_evento_id_4713610d_fk_bb_app_eventolocale_id` (`evento_id`),
  ADD KEY `bb_app_recensisce_servizio_id_0285f17f_fk_bb_app_se` (`servizio_id`),
  ADD KEY `bb_app_recensisce_utente_id_be52f98c_fk_bb_app_utente_id` (`utente_id`),
  ADD KEY `bb_app_recensisce_comprende_id_0b9677e2_fk_bb_app_comprende_id` (`comprende_id`);

--
-- Indici per le tabelle `bb_app_servizioextra`
--
ALTER TABLE `bb_app_servizioextra`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `bb_app_utente`
--
ALTER TABLE `bb_app_utente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indici per le tabelle `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indici per le tabelle `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indici per le tabelle `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT per la tabella `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `bb_app_aggiunta`
--
ALTER TABLE `bb_app_aggiunta`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT per la tabella `bb_app_assegnazione`
--
ALTER TABLE `bb_app_assegnazione`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `bb_app_camera`
--
ALTER TABLE `bb_app_camera`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT per la tabella `bb_app_comprende`
--
ALTER TABLE `bb_app_comprende`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT per la tabella `bb_app_effettua`
--
ALTER TABLE `bb_app_effettua`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT per la tabella `bb_app_eventolocale`
--
ALTER TABLE `bb_app_eventolocale`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `bb_app_partecipa`
--
ALTER TABLE `bb_app_partecipa`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT per la tabella `bb_app_prenotazione`
--
ALTER TABLE `bb_app_prenotazione`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT per la tabella `bb_app_recensisce`
--
ALTER TABLE `bb_app_recensisce`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT per la tabella `bb_app_servizioextra`
--
ALTER TABLE `bb_app_servizioextra`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT per la tabella `bb_app_utente`
--
ALTER TABLE `bb_app_utente`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT per la tabella `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT per la tabella `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Limiti per la tabella `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Limiti per la tabella `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Limiti per la tabella `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Limiti per la tabella `bb_app_aggiunta`
--
ALTER TABLE `bb_app_aggiunta`
  ADD CONSTRAINT `bb_app_aggiunta_prenotazione_id_76b958db_fk_bb_app_pr` FOREIGN KEY (`prenotazione_id`) REFERENCES `bb_app_prenotazione` (`id`),
  ADD CONSTRAINT `bb_app_aggiunta_servizio_id_44fc5659_fk_bb_app_servizioextra_id` FOREIGN KEY (`servizio_id`) REFERENCES `bb_app_servizioextra` (`id`);

--
-- Limiti per la tabella `bb_app_assegnazione`
--
ALTER TABLE `bb_app_assegnazione`
  ADD CONSTRAINT `bb_app_assegnazione_evento_id_34fecb6d_fk_bb_app_eventolocale_id` FOREIGN KEY (`evento_id`) REFERENCES `bb_app_eventolocale` (`id`),
  ADD CONSTRAINT `bb_app_assegnazione_utente_id_648f1695_fk_bb_app_utente_id` FOREIGN KEY (`utente_id`) REFERENCES `bb_app_utente` (`id`);

--
-- Limiti per la tabella `bb_app_comprende`
--
ALTER TABLE `bb_app_comprende`
  ADD CONSTRAINT `bb_app_comprende_camera_id_bc59b32b_fk_bb_app_camera_id` FOREIGN KEY (`camera_id`) REFERENCES `bb_app_camera` (`id`),
  ADD CONSTRAINT `bb_app_comprende_prenotazione_id_e35d6818_fk_bb_app_pr` FOREIGN KEY (`prenotazione_id`) REFERENCES `bb_app_prenotazione` (`id`);

--
-- Limiti per la tabella `bb_app_effettua`
--
ALTER TABLE `bb_app_effettua`
  ADD CONSTRAINT `bb_app_effettua_prenotazione_id_3c230462_fk_bb_app_pr` FOREIGN KEY (`prenotazione_id`) REFERENCES `bb_app_prenotazione` (`id`),
  ADD CONSTRAINT `bb_app_effettua_utente_id_b645619e_fk_bb_app_utente_id` FOREIGN KEY (`utente_id`) REFERENCES `bb_app_utente` (`id`);

--
-- Limiti per la tabella `bb_app_partecipa`
--
ALTER TABLE `bb_app_partecipa`
  ADD CONSTRAINT `bb_app_partecipa_evento_id_1b5dd969_fk_bb_app_eventolocale_id` FOREIGN KEY (`evento_id`) REFERENCES `bb_app_eventolocale` (`id`),
  ADD CONSTRAINT `bb_app_partecipa_utente_id_41ee0243_fk_bb_app_utente_id` FOREIGN KEY (`utente_id`) REFERENCES `bb_app_utente` (`id`);

--
-- Limiti per la tabella `bb_app_recensisce`
--
ALTER TABLE `bb_app_recensisce`
  ADD CONSTRAINT `bb_app_recensisce_comprende_id_0b9677e2_fk_bb_app_comprende_id` FOREIGN KEY (`comprende_id`) REFERENCES `bb_app_comprende` (`id`),
  ADD CONSTRAINT `bb_app_recensisce_evento_id_4713610d_fk_bb_app_eventolocale_id` FOREIGN KEY (`evento_id`) REFERENCES `bb_app_eventolocale` (`id`),
  ADD CONSTRAINT `bb_app_recensisce_servizio_id_0285f17f_fk_bb_app_se` FOREIGN KEY (`servizio_id`) REFERENCES `bb_app_servizioextra` (`id`),
  ADD CONSTRAINT `bb_app_recensisce_utente_id_be52f98c_fk_bb_app_utente_id` FOREIGN KEY (`utente_id`) REFERENCES `bb_app_utente` (`id`);

--
-- Limiti per la tabella `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
