import sqlite3

def find_sql_query(sql_query):

    with open(sql_query, "r") as file:
        sql = file.read()

    with sqlite3.connect("jornal.db") as conn:
        cur = conn.cursor()
        cur.executescript(sql)

if __name__ == "__main__":
    find_sql_query("query_1.sql")