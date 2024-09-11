-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

--inserting new user
INSERT INTO 'USERS' ('username', 'email', 'password_hash')
VALUES ('johndoe', 'johndoe@example.com', 'hashed_password_here');

--new playlist for user with user_id = 1
INSERT INTO 'PLAYLISTS' ('name', 'description', 'user_id')
VALUES ('Mellow', 'A calm relaxing track', 1);

--new song insert
INSERT INTO 'SONGS' ('title', 'duration', 'genre', 'release_date')
VALUES ('Song Title', '00:03:33', 'Jazz', '2024-08-23');

--combine song with artists
INSERT INTO 'SONG_ARTISTS' ('song_id', 'artist_id')
--assuem 1 is song_id and 1 is also artist_id
VALUES(1,1)

--add song to playlist
INSERT INTO 'PLAYLIST_SONG' ('playlist_id', 'song_id')
--assuem playlist_id is 1 and also song_id is 1
VALUES (1,1)

--update playlist's name
UPDATE 'PLAYLISTS' SET 'NAME' = 'Mellow Vibe'
WHERE 'PLAYLISTS_id' = 1;

--delete song from playlist
DELETE FROM 'PLAYLIST_songs'
WHERE 'PLAYLISTS_id' = 1 AND 'SONG_id' = 1;

--selecting all songs in specified playlist along with artist name
SELECT 'PLAYLIST_details.playlist_name', 'PLAYLIST_details.song_title', 'PLAYLIST_details.artist_name'
FROM 'PLAYLIST_details'
WHERE 'PLAYLIST_details.playlist_name' = 'Mellow Vibe';

--delete playlist
DELETE FROM 'PLAYLISTS'
WHERE 'PLAYLIST_id' = 1;

