CREATE TABLE `quizduell`.`Account` (
    `AccountNr` INT AUTO_INCREMENT NOT NULL,
    `Benutzername` VARCHAR(255) NOT NULL,
    `Passwort` VARCHAR(255) NOT NULL,
    `Punkte` INT,
    PRIMARY KEY (`AccountNr`)
) ENGINE = InnoDB;

CREATE TABLE `quizduell`.`Kategorie` (
    `KategorieNr` INT NOT NULL,
    `Kategorie` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`KategorieNr`)
) ENGINE = InnoDB;

CREATE TABLE `quizduell`.`Fragen` (
    `FragenNr` INT AUTO_INCREMENT NOT NULL,
    `Frage` VARCHAR(255) NOT NULL,
    `KategorieNr` INT NOT NULL,
    PRIMARY KEY (`FragenNr`)
) ENGINE = InnoDB, AUTO_INCREMENT=100;

CREATE TABLE `quizduell`.`Antworten` (
    `AntwortenNr` INT AUTO_INCREMENT NOT NULL,
    `FragenNr` INT NOT NULL,
    `Antwort` VARCHAR(255) NOT NULL,
    `Richtig` BOOLEAN NULL,
    PRIMARY KEY (`AntwortenNr`)
) ENGINE = InnoDB, AUTO_INCREMENT=500;

USE quizduell;

ALTER TABLE Antworten ADD FOREIGN KEY (FragenNr) REFERENCES Fragen (FragenNr) ON DELETE CASCADE;
ALTER TABLE Fragen ADD FOREIGN KEY (KategorieNr) REFERENCES Kategorie (KategorieNr);

INSERT INTO Account (Benutzername, Passwort, Punkte) VALUES ('admin', 'admin', 100);

INSERT INTO Kategorie (KategorieNr, Kategorie) VALUES (1, 'Computerspiele');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (11, 'In welchem Jahr spielt das Spiel "Red Dead Redemption"?', 1);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (101, 11, '1911', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (102, 11, '1492');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (103, 11, '1875');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (104, 11, '1923');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (12, 'Was erscheint, wenn man einen zusätzlichen Lebenspilz bei Super Mario Bros. nimmt?', 1);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (105, 12, '1 up', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (106, 12, 'Die Charaktergröße verdoppelt sich');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (107, 12, 'Der Charakter wird langsamer');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (108, 12, 'Ein Feind erscheint und stiehlt ein Leben');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (13, 'Welches ist KEIN Singspiel für die Konsole?', 1);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (109, 13, 'Start Singing', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (110, 13, 'SingStar');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (111, 13, 'Just Dance');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (112, 13, 'Karaoke Revolution');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (14, 'Wie heißt das Smartphone-Spiel, bei dem der Spieler Obst mit einem Schwert zerteilt?', 1);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (113, 14, 'Fruit Ninja', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (114, 14, 'Vegetable Samurai');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (115, 14, 'Food Slashers');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (116, 14, 'Produce Slayer');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (15, 'Wie heißt der erste Pilz-ähnliche Feind, dem man in "Super Mario Bros." (1985) begegnet?', 1);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (117, 15, 'Goombas', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (118, 15, 'Funghi Fighter');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (119, 15, 'Shroom Soldier');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (120, 15, 'Mushroom Menace');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (16, 'Wie heißt der grün gekleidete Held des Spiels "Zelda"?', 1);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (121, 16, 'Link', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (122, 16, 'Robin');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (123, 16, 'Peter Pan');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (124, 16, 'Luigi');


INSERT INTO Kategorie (KategorieNr, Kategorie) VALUES (2, 'Kinofilme');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (21, 'In welchem der folgenden Filme heißen die Hauptfiguren Alex, Marty, Gloria und Melman?', 2);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (125, 21, 'Madagascar', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (126, 21, 'The Lion King');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (127, 21, 'Finding Nemo');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (128, 21, 'Toy Story');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (22, 'In welchem Film kommen die Charaktere "Corporal Jake Sully", "Neytiri" und "Colonel Miles Quaritch" vor?', 2);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (129, 22, 'Avatar', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (130, 22, 'Jurassic Park');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (131, 22, 'Harry Potter und der Stein der Weisen');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (132, 22, 'Star Wars: Episode IV - Eine neue Hoffnung');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (23, 'In welchem Film sind schreiende Kinder eine Energiequelle?', 2);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (133, 23, 'Die Monster AG', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (134, 23, 'Finding Nemo');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (135, 23, 'Toy Story');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (136, 23, 'The Lion King');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (24, 'Im welchem Jahr wurde Disneys Zeichentrickfilm "Der König der Löwen" veröffentlicht?', 2);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (137, 24, '1994', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (138, 24, '2001');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (139, 24, '1989');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (140, 24, '2010');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (25, 'Wann erschien der erste Teil von "Stirb langsam" mit Bruce Willis?', 2);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (141, 25, '1988', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (142, 25, '1995');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (143, 25, '2003');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (144, 25, '1976');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (26, 'Wer spielt die Hauptfigur im Film "Dark Shadows" (2012)?', 2);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (145, 26, 'Jonny Depp', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (146, 26, 'Brad Pitt');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (147, 26, 'Tom Cruise');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (148, 26, 'Robert Downey Jr.');


INSERT INTO Kategorie (KategorieNr, Kategorie) VALUES (3, 'Rund um die Welt');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (31, 'Welches Land hat die größte Fläche?', 3);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (149, 31, 'Russland', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (150, 31, 'China');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (151, 31, 'Vereinigte Staaten');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (152, 31, 'Kanada');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (32, 'Welcher Fluss ist der längste der Welt?', 3);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (153, 32, 'Nil', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (154, 32, 'Amazonas');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (155, 32, 'Jangtsekiang');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (156, 32, 'Mississippi');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (33, 'Welches Land hat die meisten Einwohner?', 3);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (157, 33, 'China', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (158, 33, 'Indien');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (159, 33, 'Vereinigte Staaten');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (160, 33, 'Russland');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (34, 'Welches Gebirge ist das höchste der Welt?', 3);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (161, 34, 'Himalaya', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (162, 34, 'Anden');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (163, 34, 'Rocky Mountains');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (164, 34, 'Alpen');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (35, 'Welche Stadt wird oft als "Stadt der Liebe" bezeichnet?', 3);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (165, 35, 'Paris', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (166, 35, 'Rom');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (167, 35, 'Venedig');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (168, 35, 'Barcelona');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (36, 'Welcher Ozean ist der größte?', 3);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (169, 36, 'Pazifischer Ozean', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (170, 36, 'Atlantischer Ozean');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (171, 36, 'Indischer Ozean');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (172, 36, 'Arktischer Ozean');


INSERT INTO Kategorie (KategorieNr, Kategorie) VALUES (4, 'Im Labor');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (41, 'Aerographit wurde 2012 als weltweit leichtestes Material vorgestellt. Woraus besteht es?', 4);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (173, 41, 'Kohlenstoff', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (174, 41, 'Siliziumdioxid');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (175, 41, 'Titanlegierungen');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (176, 41, 'Aluminiumoxid');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (42, 'Wie schnell muss sich eine Rakete bewegen, um das Gravitationsfeld der Erde vollständig zu verlassen (Fluchtgeschwindigkeit)?', 4);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (177, 42, '40.320 km/h', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (178, 42, '41.720 km/h');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (179, 42, '39.512 km/h');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (180, 42, '38.420 km/h');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (43, 'Aus wie vielen Atomen besteht ein Wasser-Molekül?', 4);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (181, 43, '3', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (182, 43, '6');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (183, 43, '10');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (184, 43, '2');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (44, 'Ferdinand von Zeppelin erfand den Zeppelin. Mit welchem Gas flog der erste Zeppelin?', 4);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (185, 44, 'Wasserstoff', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (186, 44, 'Heliumgas');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (187, 44, 'Sauerstoffgas');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (188, 44, 'Stickstoffgas');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (45, 'Was enthält "hartes Wasser"?', 4);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (189, 45, 'Magnesium & Calcium', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (190, 45, 'Natriumcarbonat');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (191, 45, 'Kaliumsulfat');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (192, 45, 'Magnesiumnitrat');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (46, 'Wie oft würde unsere Erde in die Sonne passen (Volumen)?', 4);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (193, 46, '1 Mio. Mal', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (194, 46, '500 Mal');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (195, 46, '10 Mio. Mal');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (196, 46, '250 Tsd. Mal');


INSERT INTO Kategorie (KategorieNr, Kategorie) VALUES (5, 'Wunder der Technik');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (51, 'Alexander Grahamm Bell war der Erste, der ein Patent hierfür erhielt. Worum geht es?', 5);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (197, 51, 'Telefon', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (198, 51, 'Glühlampe');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (199, 51, 'Flugzeug');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (200, 51, 'Elektrischer Motor');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (52, 'In welchem Jahr wurde das iPhone 4 veröffentlicht?', 5);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (201, 52, '2010', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (202, 52, '2009');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (203, 52, '2007');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (204, 52, '2011');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (53, 'In welcher Stadt befindet sich das größte naturwissenschaftlich-technische Museum der Welt?', 5);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (205, 53, 'München', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (206, 53, 'Paris');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (207, 53, 'London');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (208, 53, 'New York');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (54, 'Seit wann besteht in Deutschland Gurtpflicht für Pkw-Hersteller auf den Vordersitzen?', 5);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (209, 54, '1974', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (210, 54, '1971');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (211, 54, '1973');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (212, 54, '1976');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (55, 'Wann wurde das erste Patent auf einen Sicherheitsgurt angemeldet und zugelassen?', 5);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (213, 55, '1903', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (214, 55, '1900');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (215, 55, '1902');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (216, 55, '1904');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (56, 'Was bedeutet HDD im Zusammenhang mit Festplatten?', 5);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (217, 56, 'Hard Driven Disk', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (218, 56, 'High Definition Drive');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (219, 56, 'Hybrid Data Drive');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (220, 56, 'Hardware Data Disk');


INSERT INTO Kategorie (KategorieNr, Kategorie) VALUES (6, 'Draußen im Grünen');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (61, 'Welche elektrische Spannung kann ein Zitteraal erzeugen?', 6);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (221, 61, '500 Volt', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (222, 61, '200 Volt');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (223, 61, '800 Volt');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (224, 61, '400 Volt');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (62, 'Welche Farbe hat die Blüte einer Bananenstaude?', 6);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (225, 62, 'Lila', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (226, 62, 'Gelb');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (227, 62, 'Grün');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (228, 62, 'Rot');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (63, 'Welche Schnecke gehört zu den giftigsten Tieren der Welt?', 6);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (229, 63, 'Kegelschnecke', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (230, 63, 'Gartenschnecke');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (231, 63, 'Weinbergschnecke');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (232, 63, 'Hausschnecke');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (64, 'Welcher Fisch riecht nach Gurken?', 6);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (233, 64, 'Stint', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (234, 64, 'Thunfisch');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (235, 64, 'Forelle');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (236, 64, 'Lachs');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (65, 'Wie heißt der Hauptbestandteil des Giftes von Kugelfischen?', 6);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (237, 65, 'Tetrodotoxin', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (238, 65, 'Quecksilber');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (239, 65, 'Cyanid');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (240, 65, 'Fischöl');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (66, 'Was ist Bambus?', 6);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (241, 66, 'Ein Gras', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (242, 66, 'Ein Strauch');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (243, 66, 'Ein Baum ');
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort) VALUES (244, 66, 'Eine Palme');