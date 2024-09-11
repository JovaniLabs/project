-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it

--Tuned Database

--Users table
CREATE TABLE IF NOT EXISTS `USERS` (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

--Playlists table
CREATE TABLE IF NOT EXISTS `PLAYLISTS`(
    playlist_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    user_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES USERS(user_id) ON DELETE CASCADE
);

--Songs table
CREATE TABLE IF NOT EXISTS `SONGS`(
    song_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    duration TIME,
    genre VARCHAR(50),
    release_date DATE
);

--Artists table
CREATE TABLE IF NOT EXISTS `ARTISTS`(
    artist_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    debut_year INT
);

--Album table
CREATE TABLE IF NOT EXISTS `ALBUMS`(
    album_id INT PRIMARY KEY,
    release_date DATE,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50)
);

--PLAYLIST_SONG table join with tables PLAYLISTS and SONGS
CREATE TABLE IF NOT EXISTS `PLAYLIST_SONG`(
    playlist_id INT,
    song_id INT,
    PRIMARY KEY (playlist_id, song_id),
    FOREIGN KEY (playlist_id) REFERENCES PLAYLISTS(playlist_id) ON DELETE CASCADE,
    FOREIGN KEY (song_id) REFERENCES SONGS(song_id) ON DELETE CASCADE
);

--SONG_ARTISTS table join with tables SONGS and ARTISTS
CREATE TABLE IF NOT EXISTS `SONG_ARTISTS`(
    artist_id INT,
    song_id INT,
    PRIMARY KEY (artist_id, song_id),
    FOREIGN KEY (artist_id) REFERENCES ARTISTS(artist_id) ON DELETE CASCADE,
    FOREIGN KEY (song_id) REFERENCES SONGS(song_id) ON DELETE CASCADE
);

--ALBUM_SONGS table join with ALBUMS and SONGS table.
CREATE TABLE IF NOT EXISTS `ALBUM_SONGS`(
    song_id INT,
    album_id INT,
    PRIMARY KEY (song_id, album_id),
    FOREIGN KEY (song_id) REFERENCES SONGS(song_id) ON DELETE CASCADE,
    FOREIGN KEY (album_id) REFERENCES ALBUM(album_id) ON DELETE CASCADE
);

--create an index on SONGS table will search by title faster
CREATE INDEX IF NOT EXISTS `idx_song_title` ON SONGS(title);

--create view to get all SONGS in a playlist along with artist names
CREATE VIEW IF NOT EXISTS `PLAYLIST_DETAILS` as
SELECT 'PLAYLISTS.name' AS 'PLAYLIST_name', 'SONGS.title' AS 'SONG_title',
'ARTISTS.name' AS 'ARTIST_name'
FROM PLAYLIST_SONGS
JOIN SONGS ON PLAYLIST_SONGS.song_id = SONGS.song_id
JOIN SONG_ARTISTS ON SONGS.song_id = SONG_ARTISTS.song_id
JOIN ARTISTS ON SONG_ARTISTS.artist_id = ARTISTS.artist_id
JOIN PLAYLISTS ON PLAYLIST_SONGS.playlist_id = PLAYLISTS.playlist_id;
