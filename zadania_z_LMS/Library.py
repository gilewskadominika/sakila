from psycopg2 import connect, OperationalError, sql, DatabaseError

try:
    cnx = connect(
        user='postgres',
        password='coderslab',
        host='localhost',
        port='5433',
        database='library'
    )

    cursor = cnx.cursor()
    print('connected')
except OperationalError as err:
    print('Connection error')
    raise ValueError(f'Connection error: {err}')

query_create_schema = sql.SQL("""
CREATE SCHEMA IF NOT EXISTS {}
""").format(sql.Identifier('library'))

query_create_tb_author = sql.SQL("""
CREATE TABLE IF NOT EXISTS {schema_name}.{table_name} (
id SERIAL,
name VARCHAR(30))
""").format(schema_name=sql.Identifier('library'),
            table_name=sql.Identifier('Author'))

query_create_tb_book = sql.SQL("""
CREATE TABLE IF NOT EXISTS {schema_name}.{table_name} (
id SERIAL,
ISBN VARCHAR(13),
name VARCHAR(30),
description TEXT,
is_loaned BOOL DEFAULT False)
""").format(schema_name=sql.Identifier('library'),
            table_name=sql.Identifier('Book'))

query_create_tb_client = sql.SQL("""
CREATE TABLE IF NOT EXISTS {schema_name}.{table_name} (
id SERIAL,
first_name VARCHAR(30),
last_name VARCHAR(50))
""").format(schema_name=sql.Identifier('library'),
            table_name=sql.Identifier('Client'))

query_create_tb_category = sql.SQL("""
CREATE TABLE IF NOT EXISTS {schema_name}.{table_name} (
id SERIAL,
name VARCHAR(40))
""").format(schema_name=sql.Identifier('library'),
            table_name=sql.Identifier('Category'))

query_insert_author_table = sql.SQL("""
    INSERT INTO {schema_name}.{table_name}(name)
    VALUES (%s), (%s), (%s), (%s), (%s)
""").format(schema_name=sql.Identifier('library'),
            table_name=sql.Identifier('Author'))

query_insert_book_table = sql.SQL("""
    INSERT INTO {schema_name}.{table_name}(ISBN, name, description, is_loaned)
    VALUES (%s,%s,%s,%s)
""").format(schema_name=sql.Identifier('library'),
            table_name=sql.Identifier('Book'))

query_insert_client_table = sql.SQL("""
    INSERT INTO {schema_name}.{table_name}(first_name, last_name)
    VALUES (%s,%s)
""").format(schema_name=sql.Identifier('library'),
            table_name=sql.Identifier('Client'))

query_select = sql.SQL("""
SELECT * FROM {schema_name}.{table_name}
""").format(schema_name=sql.Identifier('library'),
            table_name=sql.Identifier('Author'))

query_select = sql.SQL("""
SELECT name FROM {schema_name}.{table_name} WHERE id = 2
""").format(schema_name=sql.Identifier('library'),
            table_name=sql.Identifier('Author'))

query_select = sql.SQL("""
SELECT * FROM {schema_name}.{table_name}
""").format(schema_name=sql.Identifier('library'),
            table_name=sql.Identifier('Book'))

query_select = sql.SQL("""
SELECT name FROM {schema_name}.{table_name} WHERE id = 2
""").format(schema_name=sql.Identifier('library'),
            table_name=sql.Identifier('Book'))

query_select = sql.SQL("""
SELECT * FROM {schema_name}.{table_name}
""").format(schema_name=sql.Identifier('library'),
            table_name=sql.Identifier('Client'))

query_select = sql.SQL("""
SELECT first_name, last_name FROM {schema_name}.{table_name} WHERE id = 1
""").format(schema_name=sql.Identifier('library'),
            table_name=sql.Identifier('Client'))

query_delete_book_table = sql.SQL("""
DELETE FROM {schema_name}.{table_name} WHERE id = %s
""").format(schema_name=sql.Identifier('library'),
            table_name=sql.Identifier('Book'))

with cnx:
    # try:
    #     cursor.execute(query_select)
    # except DatabaseError as error:
    #     print(error)

    # try:
    #     cursor.execute(query_select)
    #
    #     rows = cursor.fetchall()
    #     for row in rows:
    #         print(row)
    # except DatabaseError as error:
    #     print(error)

    try:
        cursor.execute(query_delete_book_table, (11, ))
    except DatabaseError as error:
        print(error)

