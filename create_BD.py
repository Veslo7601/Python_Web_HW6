import sqlite3

def create_bd():

    with open("jornal.sql", "r") as file:
        sql = file.read()

    with sqlite3.connect("jornal.db") as conn:
        cur = conn.cursor()
        cur.executescript(sql)

if __name__ == "__main__":
    create_bd()