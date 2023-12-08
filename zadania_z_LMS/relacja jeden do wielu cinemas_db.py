from psycopg2 import connect, OperationalError, sql, DatabaseError

try:
    cnx = connect(
        user='postgres',
        password='coderslab',
        host='localhost',
        port='5433',
        database='cinemas'
    )

    cursor = cnx.cursor()
    print('connected')
except OperationalError as err:
    print('Connection error')
    raise ValueError(f'Connection error: {err}')
# jeden film am kilka komentów
query_create_tb_comments = sql.SQL("""
CREATE TABLE IF NOT EXISTS {table_name} (
content TEXT PRIMARY KEY,
movie_id INTEGER,
FOREIGN KEY (movie_id) REFERENCES {table_name_foreign}(movie_id))
""").format(table_name=sql.Identifier('comments'),
            table_name_foreign=sql.Identifier('movies'))

query_insert_comments_table = sql.SQL("""
    INSERT INTO {table_name}(content, movie_id)
    VALUES (%s,%s)
""").format(table_name=sql.Identifier('comments'))

query_select = sql.SQL("""
SELECT * FROM {table_name}
WHERE movie_id = 4
""").format(table_name=sql.Identifier('comments')
            )

with cnx:
    # try:
    #     cursor.execute(query_insert_comments_table, ('Bardzo trudny film, do przemyślenia', 4))
    # except DatabaseError as error:
    #     print(error)

    try:
        cursor.execute(query_select)

        rows = cursor.fetchall()
        for row in rows:
            print(row)
    except DatabaseError as error:
        print(error)
    finally:
        cursor.close()