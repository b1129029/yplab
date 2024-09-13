import sqlite3

def connect_table():
    sql_file_path = 'edema_measure.sql'
    db_file_path = 'edema_measure.db'

    conn = sqlite3.connect(db_file_path)
    cursor = conn.cursor()

    with open(sql_file_path, 'r', encoding='utf-8') as sql_file:
        sql_script = sql_file.read()

    cursor.executescript(sql_script)

    conn.commit()
    conn.close()
    print("success creat database")

if __name__ == '__main__':
    connect_table()