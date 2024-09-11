# Design Document

By Jovani Velasco

Video overview: <https://youtu.be/VmTdNku4Eqk>

## Scope

In this section you should answer the following questions:

* What is the purpose of your database?
The purpose of this project would be to organize and manage data related to
users favorte songs, artists, playlist and albums. This project would allow
users to efficiently  store, retrieve and interact with their music preferences
this project would be like Spotify.

* Which people, places, things, etc. are you including in the scope of your database?
Storage and retrieval of songs, artists, albums and playlists.
Users would create and manage playlists containing favorite songs. Songs would
store information about the song such as title, duration, genre and release date.
Artists would have data about the artists including name, genre and debute year.
Albums would contain detail of the album which are title, release date and genre.
Playlists would have the users favorite songs

* Which people, places, things, etc. are *outside* the scope of your database?
Monetization features for example track song purchases or streaming revenue
Advanced analytics such as machine learning recommendations and detailed user
behavior analysis.

## Functional Requirements

In this section you should answer the following questions:

* What should a user be able to do with your database?
User cpabilities would include creating and managing playlists also including
the ability to search for songs, artists and albums in order to retrieve
information. The users would also be allowed to explore the songs associated
with specific artists and albums.

* What's beyond the scope of what a user should be able to do with your database?
users will not be able to interact with other user's playlists. Custom
recommendations no automated song or playlist recommendations will be provided
based on user preferences.

## Representation

### Entities

In this section you should answer the following questions:

* Which entities will you choose to represent in your database?
songs, artists, albums and playlists

* What attributes will those entities have?
for songs:song_id(PRIMARY KEY), title, duration, genre and release date.
for artists:artist_id(PRIMARY KEY), name, genre and debut_year.
for albums:album_id(PRIMARY KEY), title, release_date and gengre.
for playlists: playlist_id(PRIMARY KEY), name, description, created_at, user_id
(Foreign Key to Users)

* Why did you choose the types you did?
for songs:the song_id is an integer auto-incremented key, which is ensuring
unique identification. This will maintain organization making the retrieval of
songs related data faster.
for artists: artist_id is an integer auto-incremented key this will ensure
unique identification. This is essential in order to maintain the relationship
between songs and artist and so it can be efficiently managed.
for albums:album_id is an integer auto-incremented key that will ensure ensure
unique identification.The album_id is crucial in keeping data organized and
consistant when it comes to album data related queries.
for playlists: playlist_id is an integer auto-incremented key that will ensure
unique ifentification.

* Why did you choose the constraints you did?
for songs: the title is a string and would ensure clear identification of songs.
The combination of songs_id and title will allow for clear identification of songs
in various relationships such as playlists and albums.
for artists: name is a string with constraint to avoid duplicates. The name string
would not allow an artist to be added multiple times by mistake.
for albums: title is a string with a unique constraint to avoid duplicate album
entries. If two albums have the same name it would cause complications for users
trying to reference or searching for them.
for playlists: name is a string with a constraint to ensure it is unique for
each user. The possibility that two users would create the same playlist name for
example favorites is going to happen however if a constraint is enforced so that
no name for the same user is applied would help keep data more organized.

### Relationships

* In this section you should include your entity relationship diagram and describe the relationships between the entities in your database.
![Tune Diagram](Tuned_Diagram.png)

Users to Playlist:one-to-many each user can create multiple playlists
Songs to Artists:many-to-many a song can be performed by multiple artists and an
artist can have multiple songs.
Songs to Albums:many-to-many a song can appear in multiple albums and and album
can contain multiple songs.
Playlists to Songs: many-to-many a playlist can contain multiple songs and a
song can belong to multiple playlists.

## Optimizations

In this section you should answer the following questions:

* Which optimizations (e.g., indexes, views) did you create? Why?
Created song_id, artists_id and album_id to optimize the speed of queries that
frequently search or join on these fields.

## Limitations

In this section you should answer the following questions:

* What are the limitations of your design?
scalability the current design may need further optimization or migration to a
distributed database system to handle a very large user base.

complex queries: the many-to-many relationships could lead to complex queries that
might affect performance with very large datasets.

* What might your database not be able to represent very well?
advanced metadata: the database might not be able to efficiently handle or represent
advanced metadata such as detailed song analytics or multi-dimensional artist
collaborations.


