/// Copyright (C) 2024 Jill Heske
/// This file is part of flutter-clean-architecture-drift-retrofit.
///
/// flutter-clean-architecture-drift-retrofit is free software: you can redistribute it and/or modify
/// it under the terms of the Apache License, Version 2.0, as published by
/// the Apache Software Foundation.
///
/// flutter-clean-architecture-drift-retrofit is distributed in the hope that it will be useful,
/// but WITHOUT ANY WARRANTY; without even the implied warranty of
/// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
/// Apache License, Version 2.0 for more details.
///
/// You should have received a copy of the Apache License, Version 2.0
/// along with flutter-clean-architecture-drift-retrofit. If not, see <https:///www.apache.org/licenses/LICENSE-2.0>.
class MusicDataSource {
  static dynamic musicDataSource = {
    "Users": [
      {
        "username": "User 1",
        "favorite_song_name": "Song 1",
        "music_style": "Rock",
        "playlist": {
          "name": "Old rocks",
          "songs": [1, 2]
        }
      },
      {
        "username": "User 2",
        "favorite_song_name": "Song 4",
        "music_style": "Blues",
        "playlist": {
          "name": "Blues Mix",
          "songs": [3, 4]
        }
      },
      {
        "username": "User 3",
        "favorite_song_name": "Song 5",
        "music_style": "Jazz",
        "playlist": {
          "name": "Jazz Mix",
          "songs": [5, 6]
        }
      },
      {
        "username": "User 4",
        "favorite_song_name": "Song 6",
        "music_style": "Pop",
        "playlist": {
          "name": "Pop Mix",
          "songs": [3, 6, 7, 9]
        }
      },
      {
        "username": "User 5",
        "favorite_song_name": "Song 9",
        "music_style": "Folk",
        "playlist": {
          "name": "User 5's Mix",
          "songs": [4, 7, 9, 10]
        }
      }
    ],
    "Songs": [
      {
        "id": 1,
        "name": "Song 1",
        "duration": 250,
        "genre": "Rock",
        "album": "Rock Album",
        "artist_id": 1
      },
      {
        "id": 2,
        "name": "Song 2",
        "duration": 280,
        "genre": "Rock",
        "album": " Rock Album",
        "artist_id": 1
      },
      {
        "id": 3,
        "name": "Song 3",
        "duration": 210,
        "genre": "Blues",
        "album": "Blues Album",
        "artist_id": 2
      },
      {
        "id": 4,
        "name": "Song 4",
        "duration": 320,
        "genre": "Blues",
        "album": "Blues Album",
        "artist_id": 2
      },
      {
        "id": 5,
        "name": "Song 5",
        "duration": 270,
        "genre": "Jazz",
        "album": "Jazz Album",
        "artist_id": 3
      },
      {
        "id": 6,
        "name": "Song 6",
        "duration": 360,
        "genre": "Jazz",
        "album": "Jazz Album",
        "artist_id": 3
      },
      {
        "id": 7,
        "name": "Song 7",
        "duration": 230,
        "genre": "Pop",
        "album": "Pop Album",
        "artist_id": 4
      },
      {
        "id": 8,
        "name": "Song 8",
        "duration": 200,
        "genre": "Pop",
        "album": "Pop Album",
        "artist_id": 4
      },
      {
        "id": 9,
        "name": " Song 9",
        "duration": 240,
        "genre": "Folk",
        "album": "Folk Album",
        "artist_id": 5
      },
      {
        "id": 10,
        "name": "Song 10",
        "duration": 280,
        "genre": "Folk",
        "album": "Folk Album",
        "artist_id": 5
      }
    ],
    "Artists": [
      {"id": 1, "name": "Artist 1", "age": 40, "music_style": "Rock"},
      {"id": 2, "name": "Artist 2", "age": 36, "music_style": "Blues"},
      {"id": 3, "name": "Artist 3", "age": 65, "music_style": "Jazz"},
      {"id": 4, "name": "Artist 4", "age": 21, "music_style": "Folk"},
      {"id": 5, "name": "Artist 5", "age": 33, "music_style": "Pop"}
    ]
  };
}
