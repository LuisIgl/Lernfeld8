CREATE TABLE `quizduell`.`Account` (
    `AccountNr` INT NOT NULL,
    `Benutzername` TEXT NOT NULL,
    `Passwort` TEXT NOT NULL,
    PRIMARY KEY (`AccountNr`)
) ENGINE = InnoDB;

CREATE TABLE `quizduell`.`Kategorie` (
    `KategorieNr` INT NOT NULL,
    `Kategorie` TEXT NOT NULL,
    PRIMARY KEY (`KategorieNr`)
) ENGINE = InnoDB;

CREATE TABLE `quizduell`.`Fragen` (
    `FragenNr` INT NOT NULL,
    `Frage` TEXT NOT NULL,
    `KategorieNr` INT NOT NULL,
    PRIMARY KEY (`FragenNr`)
) ENGINE = InnoDB;

CREATE TABLE `quizduell`.`Antworten` (
    `AntwortenNr` INT NOT NULL,
    `FragenNr` INT NOT NULL,
    `Antwort` TEXT NOT NULL,
    `Richtig` BOOLEAN NOT NULL,
    PRIMARY KEY (`AntwortenNr`)
) ENGINE = InnoDB;

USE quizduell;

ALTER TABLE Antworten ADD FOREIGN KEY (FragenNr) REFERENCES Fragen (FragenNr);
ALTER TABLE Fragen ADD FOREIGN KEY (KategorieNr) REFERENCES Kategorie (KategorieNr);

INSERT INTO Account (AccountNr, Benutzername, Passwort) VALUES (001, 'admin', 'admin');

INSERT INTO Kategorie (KategorieNr, Kategorie) VALUES (1, 'Computerspiele');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (11, 'In welchem Jahr spielt das Spiel "Red Dead Redemption"?', 1);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (101, 11, '1911', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (102, 11, '1492', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (103, 11, '1875', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (104, 11, '1923', false);

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (12, 'Was erscheint, wenn man einen zusätzlichen Lebenspilz bei Super Mario Bros. nimmt?', 1);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (105, 12, '1 up', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (106, 12, 'Die Charaktergröße verdoppelt sich', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (107, 12, 'Der Charakter wird langsamer', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (108, 12, 'Ein Feind erscheint und stiehlt ein Leben', false);

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (13, 'Welches ist KEIN Singspiel für die Konsole?', 1);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (109, 13, 'Start Singing', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (110, 13, 'SingStar', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (111, 13, 'Just Dance', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (112, 13, 'Karaoke Revolution', false);

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (14, 'Wie heißt das Smartphone-Spiel, bei dem der Spieler Obst mit einem Schwert zerteilt?', 1);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (113, 14, 'Fruit Ninja', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (114, 14, 'Vegetable Samurai', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (115, 14, 'Food Slashers', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (116, 14, 'Produce Slayer', false);

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (15, 'Wie heißt der erste Pilz-ähnliche Feind, dem man in "Super Mario Bros." (1985) begegnet?', 1);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (117, 15, 'Goombas', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (118, 15, 'Funghi Fighter', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (119, 15, 'Shroom Soldier', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (120, 15, 'Mushroom Menace', false);

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (16, 'Wie heißt der grün gekleidete Held des Spiels "Zelda"?', 1);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (121, 16, 'Link', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (122, 16, 'Robin', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (123, 16, 'Peter Pan', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (124, 16, 'Luigi', false);


INSERT INTO Kategorie (KategorieNr, Kategorie) VALUES (2, 'Kinofilme');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (21, 'In welchem der folgenden Filme heißen die Hauptfiguren Alex, Marty, Gloria und Melman?', 2);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (125, 21, 'Madagascar', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (126, 21, 'The Lion King', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (127, 21, 'Finding Nemo', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (128, 21, 'Toy Story', false);

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (22, 'In welchem Film kommen die Charaktere "Corporal Jake Sully", "Neytiri" und "Colonel Miles Quaritch" vor?', 2);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (129, 22, 'Avatar', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (130, 22, 'Jurassic Park', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (131, 22, 'Harry Potter und der Stein der Weisen', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (132, 22, 'Star Wars: Episode IV - Eine neue Hoffnung', false);

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (23, 'In welchem Film sind schreiende Kinder eine Energiequelle?', 2);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (133, 23, 'Die Monster AG', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (134, 23, 'Finding Nemo', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (135, 23, 'Toy Story', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (136, 23, 'The Lion King', false);

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (24, 'Im welchem Jahr wurde Disneys Zeichentrickfilm "Der König der Löwen" veröffentlicht?', 2);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (137, 24, '1994', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (138, 24, '2001', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (139, 24, '1989', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (140, 24, '2010', false);

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (25, 'Wann erschien der erste Teil von "Stirb langsam" mit Bruce Willis?', 2);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (141, 25, '1988', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (142, 25, '1995', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (143, 25, '2003', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (144, 25, '1976', false);

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (26, 'Wer spielt die Hauptfigur im Film "Dark Shadows" (2012)?', 2);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (145, 26, 'Jonny Depp', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (146, 26, 'Brad Pitt', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (147, 26, 'Tom Cruise', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (148, 26, 'Robert Downey Jr.', false);


INSERT INTO Kategorie (KategorieNr, Kategorie) VALUES (3, 'Rund um die Welt');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (31, 'Welches Land hat die größte Fläche?', 3);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (149, 31, 'Russland', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (150, 31, 'China', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (151, 31, 'Vereinigte Staaten', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (152, 31, 'Kanada', false);

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (32, 'Welcher Fluss ist der längste der Welt?', 3);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (153, 32, 'Nil', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (154, 32, 'Amazonas', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (155, 32, 'Jangtsekiang', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (156, 32, 'Mississippi', false);

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (33, 'Welches Land hat die meisten Einwohner?', 3);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (157, 33, 'China', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (158, 33, 'Indien', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (159, 33, 'Vereinigte Staaten', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (160, 33, 'Russland', false);

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (34, 'Welches Gebirge ist das höchste der Welt?', 3);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (161, 34, 'Himalaya', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (162, 34, 'Anden', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (163, 34, 'Rocky Mountains', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (164, 34, 'Alpen', false);

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (35, 'Welche Stadt wird oft als "Stadt der Liebe" bezeichnet?', 3);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (165, 35, 'Paris', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (166, 35, 'Rom', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (167, 35, 'Venedig', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (168, 35, 'Barcelona', false);

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (36, 'Welcher Ozean ist der größte?', 3);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (169, 36, 'Pazifischer Ozean', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (170, 36, 'Atlantischer Ozean', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (171, 36, 'Indischer Ozean', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (172, 36, 'Arktischer Ozean', false);


INSERT INTO Kategorie (KategorieNr, Kategorie) VALUES (4, 'Im Labor');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (41, 'Aerographit wurde 2012 als weltweit leichtestes Material vorgestellt. Woraus besteht es?', 4);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (173, 41, 'Kohlenstoff', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (174, 41, 'Siliziumdioxid', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (175, 41, 'Titanlegierungen', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (176, 41, 'Aluminiumoxid', false);

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (42, 'Wie schnell muss sich eine Rakete bewegen, um das Gravitationsfeld der Erde vollständig zu verlassen (Fluchtgeschwindigkeit)?', 4);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (177, 42, '40.320 km/h', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (178, 42, '41.720 km/h', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (179, 42, '39.512 km/h', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (180, 42, '38.420 km/h', false);

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (43, 'Aus wie vielen Atomen besteht ein Wasser-Molekül?', 4);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (181, 43, '3', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (182, 43, '6', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (183, 43, '10', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (184, 43, '2', false);

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (44, 'Ferdinand von Zeppelin erfand den Zeppelin. Mit welchem Gas flog der erste Zeppelin?', 4);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (185, 44, 'Wasserstoff', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (186, 44, 'Heliumgas', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (187, 44, 'Sauerstoffgas', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (188, 44, 'Stickstoffgas', false);

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (45, 'Was enthält "hartes Wasser"?', 4);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (189, 45, 'Magnesium & Calcium', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (190, 45, 'Natriumcarbonat', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (191, 45, 'Kaliumsulfat', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (192, 45, 'Magnesiumnitrat', false);

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (46, 'Wie oft würde unsere Erde in die Sonne passen (Volumen)?', 4);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (193, 46, '1 Mio. Mal', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (194, 46, '500 Mal', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (195, 46, '10 Mio. Mal', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (196, 46, '250 Tsd. Mal', false);


INSERT INTO Kategorie (KategorieNr, Kategorie) VALUES (5, 'Wunder der Technik');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (51, 'Alexander Grahamm Bell war der Erste, der ein Patent hierfür erhielt. Worum geht es?', 5);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (197, 51, 'Telefon', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (198, 51, 'Glühlampe', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (199, 51, 'Flugzeug', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (200, 51, 'Elektrischer Motor', false);

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (52, 'In welchem Jahr wurde das iPhone 4 veröffentlicht?', 5);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (201, 52, '2010', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (202, 52, '2009', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (203, 52, '2007', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (204, 52, '2011', false);

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (53, 'In welcher Stadt befindet sich das größte naturwissenschaftlich-technische Museum der Welt?', 5);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (205, 53, 'München', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (206, 53, 'Paris', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (207, 53, 'London', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (208, 53, 'New York', false);

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (54, 'Seit wann besteht in Deutschland Gurtpflicht für Pkw-Hersteller auf den Vordersitzen?', 5);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (209, 54, '1974', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (210, 54, '1971', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (211, 54, '1973', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (212, 54, '1976', false);

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (55, 'Wann wurde das erste Patent auf einen Sicherheitsgurt angemeldet und zugelassen?', 5);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (213, 55, '1903', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (214, 55, '1900', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (215, 55, '1902', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (216, 55, '1904', false);

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (56, 'Was bedeutet HDD im Zusammenhang mit Festplatten?', 5);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (217, 56, 'Hard Driven Disk', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (218, 56, 'High Definition Drive', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (219, 56, 'Hybrid Data Drive', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (220, 56, 'Hardware Data Disk', false);


INSERT INTO Kategorie (KategorieNr, Kategorie) VALUES (6, 'Draußen im Grünen');

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (61, 'Welche elektrische Spannung kann ein Zitteraal erzeugen?', 6);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (221, 61, '500 Volt', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (222, 61, '200 Volt', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (223, 61, '800 Volt', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (224, 61, '400 Volt', false);

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (62, 'Welche Farbe hat die Blüte einer Bananenstaude?', 6);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (225, 62, 'Lila', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (226, 62, 'Gelb', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (227, 62, 'Grün', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (228, 62, 'Rot', false);

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (63, 'Welche Schnecke gehört zu den giftigsten Tieren der Welt?', 6);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (229, 63, 'Kegelschnecke', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (230, 63, 'Gartenschnecke', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (231, 63, 'Weinbergschnecke', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (232, 63, 'Hausschnecke', false);

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (64, 'Welcher Fisch riecht nach Gurken?', 6);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (233, 64, 'Stint', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (234, 64, 'Thunfisch', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (235, 64, 'Forelle', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (236, 64, 'Lachs', false);

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (65, 'Wie heißt der Hauptbestandteil des Giftes von Kugelfischen?', 6);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (237, 65, 'Tetrodotoxin', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (238, 65, 'Quecksilber', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (239, 65, 'Cyanid', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (240, 65, 'Fischöl', false);

INSERT INTO Fragen (FragenNr, Frage, KategorieNr) VALUES (66, 'Was ist Bambus?', 6);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (241, 66, 'Ein Gras', true);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (242, 66, 'Ein Strauch', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (243, 66, 'Ein Baum ', false);
INSERT INTO Antworten (AntwortenNr, FragenNr, Antwort, Richtig) VALUES (244, 66, 'Eine Palme', false);