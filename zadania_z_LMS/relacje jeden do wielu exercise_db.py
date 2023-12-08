from psycopg2 import connect, OperationalError, sql, DatabaseError

try:
    cnx = connect(
        user='postgres',
        password='coderslab',
        host='localhost',
        port='5433',
        database='exercises'
    )

    cursor = cnx.cursor()
    print('connected')
except OperationalError as err:
    print('Connection error')
    raise ValueError(f'Connection error: {err}')

query_create_schema = sql.SQL("""
CREATE SCHEMA IF NOT EXISTS {}
""").format(sql.Identifier('public'))

# jeden produkt ma wiele opinii
query_create_tb_opinions = sql.SQL("""
CREATE TABLE IF NOT EXISTS {schema_name}.{table_name} (
description TEXT PRIMARY KEY,
product_name VARCHAR(30),
FOREIGN KEY (product_name) REFERENCES {table_name_foreign}(product_name)
)
""").format(schema_name=sql.Identifier('public'),
            table_name_foreign=sql.Identifier('products'),
            table_name=sql.Identifier('opinions'))

query_insert_opinions_table = sql.SQL("""
    INSERT INTO {schema_name}.{table_name}(description, product_name)
    VALUES (%s,%s)
""").format(schema_name=sql.Identifier('public'),
            table_name=sql.Identifier('opinions'))

query_select = sql.SQL("""
SELECT * FROM {schema_name}.{table_name}
WHERE product_name='Velsvet'
""").format(schema_name=sql.Identifier('public'),
            table_name=sql.Identifier('opinions')
            )

with cnx:
    # try:
    #     cursor.execute(query_select)
    # except DatabaseError as error:
    #     print(error)

    try:
        cursor.execute(query_select)

        rows = cursor.fetchall()
        for row in rows:
            print(row)
    except DatabaseError as error:
        print(error)


