import mysql.connector
from mysql.connector import Error
from getpass import getpass


def create_connection():
    """Erstellt eine Verbindung zur MariaDB-Datenbank."""
    try:
        connection = mysql.connector.connect(
            host='localhost',
            database='quiz_game',
            user='admin',  # Ändern Sie dies zu Ihrem MariaDB-Benutzernamen
            password=getpass('Enter database password: ')  # Sicherer Weg, das Passwort abzufragen
        )
        if connection.is_connected():
            return connection
    except Error as e:
        print(f"Fehler beim Verbinden zur MariaDB: {e}")
        return None


def update_question(connection, fragen_nr):
    """Aktualisiert den Text einer vorhandenen Frage."""
    try:
        cursor = connection.cursor()
        question = """SELECT Frage FROM Fragen WHERE FragenNr = %s"""
        cursor.execute(question, (fragen_nr,))  # Parameter als Tupel
        result = cursor.fetchone()  # Das Ergebnis der Abfrage abrufen
        if result:
            print(f"Die Frage lautet: {result[0]}")  # Ausgabe des Ergebnisses
        else:
            print("Frage nicht gefunden.")
        neue_frage = input("Neuer Fragetext: ")
        sql = """UPDATE Fragen SET Frage = %s WHERE FragenNr = %s"""
        cursor.execute(sql, (neue_frage, fragen_nr))
        connection.commit()
        print(f"Frage Nr. {fragen_nr} wurde aktualisiert.")
    except Error as e:
        print(f"Fehler beim Aktualisieren der Frage: {e}")


def add_question(connection, kategorie_nr):
    """Fügt eine Frage mit Antworten der Datenbank hinzu"""
    try:
        cursor = connection.cursor()
        neue_frage = input("Geben Sie eine neue Frage ein: ")
        sql = """INSERT INTO Fragen(Frage, KategorieNr) VALUES (%s, %s)"""
        cursor.execute(sql, (neue_frage, kategorie_nr))
        connection.commit()
        print("Frage wurde hinzugefügt")
        add_answers(connection, neue_frage)
    except Error as e:
        print(f"Fehler beim Hinzufügen der Frage: {e}")


def add_answers(connection, neue_frage):
    try:
        cursor = connection.cursor()
        get_fragenNr = """SELECT (FragenNr) FROM Fragen ORDER BY FragenNr DESC LIMIT 1;"""
        cursor.execute(get_fragenNr,)
        result = cursor.fetchone()
        if result:
            answer_right = input("Bitte geben Sie die richtige Antwort ein: ")
            answer_wrong1 = input("Bitte geben Sie die erste falsche Antwort ein: ")
            answer_wrong2 = input("Bitte geben Sie die zweite falsche Antwort ein: ")
            answer_wrong3 = input("Bitte geben Sie die dritte falsche Antwort ein: ")
            sql_right = """INSERT INTO Antworten(FragenNr, Antwort, Richtig) VALUES (%s, %s, true)"""
            sql_wrong1 = """INSERT INTO Antworten(FragenNr, Antwort) VALUES (%s, %s)"""
            sql_wrong2 = """INSERT INTO Antworten(FragenNr, Antwort) VALUES (%s, %s)"""
            sql_wrong3 = """INSERT INTO Antworten(FragenNr, Antwort) VALUES (%s, %s)"""
            cursor.execute(sql_right, (result[0], answer_right))
            cursor.execute(sql_wrong1, (result[0], answer_wrong1))
            cursor.execute(sql_wrong2, (result[0], answer_wrong2))
            cursor.execute(sql_wrong3, (result[0], answer_wrong3))
            connection.commit()
            print("Antworten wurden hinzugefügt")
    except Error as e:
        print(f"Fehler beim Hinzufügen der Frage: {e}")


def delete_question(connection, fragen_nr):
    """Löscht eine Frage aus der Datenbank."""
    try:
        cursor = connection.cursor()
        question = """SELECT Frage FROM Fragen WHERE FragenNr = %s"""
        cursor.execute(question, (fragen_nr,))  # Parameter als Tupel
        result = cursor.fetchone()  # Das Ergebnis der Abfrage abrufen
        if result:
            print(f"Die Frage lautet: {result[0]}")  # Ausgabe des Ergebnisses
            delete = input("Wenn Sie diese Frage wirklich löschen wollen, bestätigen Sie mit (y).")
            if delete.lower() == 'y':
                sql = """DELETE FROM Fragen WHERE FragenNr = %s"""
                cursor.execute(sql, (fragen_nr,))
                connection.commit()
                print(f"Frage Nr. {fragen_nr} wurde mit den zugehörigen Antworten gelöscht.")
        else: print("Frage nicht gefunden.")
    except Error as e:
        print(f"Fehler beim Löschen der Frage: {e}")


def main():
    connection = create_connection()
    if connection is not None:
        action = input("Möchten Sie eine Frage (a) aktualisieren, (b) löschen oder (c) eine neue erstellen? ")
        if action.lower() == 'a':
            fragen_nr = int(input("FragenNr der zu aktualisierenden Frage: "))
            update_question(connection, fragen_nr)
        elif action.lower() == 'b':
            fragen_nr = int(input("FragenNr der zu löschenden Frage: "))
            delete_question(connection, fragen_nr)
        # Hier können Sie weitere Optionen hinzufügen, z.B. für das Erstellen neuer Fragen.
        elif action.lower() == 'c':
            kategorie_nr = int(input("Wählen Sie die zur Frage zugehörigen Kategorie aus: "
                                     "Computerspiele (1), Kinofilme (2), Rund um die Welt (3), Im Labor (4), "
                                     "Wunder der Technik (5), Draußen im Grünen (6): "))
            add_question(connection, kategorie_nr)
        connection.close()
    else:
        print("Keine Verbindung zur Datenbank.")


if __name__ == '__main__':
    main()
