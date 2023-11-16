import psycopg2
from faker import Faker
from datetime import datetime, timedelta
import random

# Connect to the PostgreSQL database
conn = psycopg2.connect(
    dbname='stopify_rest',
    user='postgres',
    password='root',
    host='localhost',
    port='5432'
)

# Create a cursor object using the cursor() method
cursor = conn.cursor()

# Initialize Faker
fake = Faker()

# Generate fake data for Artist table
def generate_artist_data(num):
    artists = []
    for _ in range(num):  # Change the range to generate more artists
        artist = (
            fake.email(),
            fake.name(),
            fake.password()
        )
        artists.append(artist)
    return artists

# Insert fake data into Artist table
def insert_artist_data(num):
    artists = generate_artist_data(num)
    for artist in artists:
        cursor.execute(
            'INSERT INTO "Artist" (email, name, password, createdAt, updatedAt) VALUES (%s, %s, %s, %s, %s)',
            (*artist, datetime.now(), datetime.now())
        )
    conn.commit()

# Generate fake data for ListenTo and LikeTo tables
def generate_listen_like_data(num):
    listens_likes = []
    for _ in range(num):  # Change the range to generate more data
        listen_like = (
            fake.word(),
            fake.word(),
            random.randint(1, 10),  # Assuming 10 artists exist in Artist table
            fake.date_time_this_year(),
        )
        listens_likes.append(listen_like)
    return listens_likes

# Insert fake data into ListenTo and LikeTo tables
def insert_listen_like_data(table_name, num):
    listens_likes = generate_listen_like_data(num)
    for listen_like in listens_likes:
        cursor.execute(
            f'INSERT INTO "{table_name}" (titleMusic, titleAlbum, idArtist, date) VALUES (%s, %s, %s, %s)',
            (*listen_like,)
        )
    conn.commit()

# Generate fake data for Poster table
def generate_poster_data(num):
    posters = []
    for _ in range(num):  # Change the range to generate more posters
        poster = (
            random.randint(1, 10),  # Assuming 10 artists exist in Artist table
            fake.word(),
            fake.date_time_this_decade(),
            fake.date_time_this_decade(),
            fake.image_url(),
            round(random.uniform(10, 100), 2),  # Random price between 10 and 100
            fake.text(),
            fake.date_time_this_year(),
            fake.date_time_this_year() + timedelta(days=30)  # End date 30 days from start date
        )
        posters.append(poster)
    return posters

# Insert fake data into Poster table
def insert_poster_data(num):
    posters = generate_poster_datanum()
    for poster in posters:
        cursor.execute(
            'INSERT INTO "Poster" (idArtist, title, createdAt, updatedAt, image, price, description, startDate, endDate) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)',
            (*poster,)
        )
    conn.commit()

# Call functions to insert fake data
insert_artist_data(10)
insert_listen_like_data('ListenTo',1000)
insert_listen_like_data('LikeTo',1000)
insert_poster_data(10)

# Close the cursor and connection
cursor.close()
conn.close()

print("Fake data insertion completed.")
