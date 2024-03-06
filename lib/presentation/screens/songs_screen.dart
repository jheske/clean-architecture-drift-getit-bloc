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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/bloc/song/songs_bloc.dart';
import '../../core/bloc/song/songs_state.dart';
import '../../domain/entity/song_entity.dart';

class SongsScreen extends StatefulWidget {
  const SongsScreen({super.key});

  @override
  State<SongsScreen> createState() => _SongsScreenState();
}

// State class for SongsScreen, which displays a list of Songs and their details,
// including artist name and duration.
class _SongsScreenState extends State<SongsScreen> {
  // Build method to construct the UI for SongsScreen.
  @override
  Widget build(BuildContext context) {
    // Return Scaffold widget with AppBar and body content.
    return Scaffold(
      appBar: _buildAppBar(),
      body: BlocBuilder<SongsBloc, SongsState>(
        builder: (_, state) {
          if (state is SongsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SongsDone) {
            return _buildSongsList(state.songs ?? []);
          } else if (state is SongsError) {
            return Center(child: Text(state.exception?.message ?? 'An error occurred'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  // Function to format song duration.
  String _formatDuration(int durationInSeconds) {
    Duration duration =
        Duration(seconds: durationInSeconds); // Convert duration to Duration object.
    String minutes = (duration.inMinutes % 60).toString().padLeft(2, '0'); // Calculate minutes.
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0'); // Calculate seconds.
    return '$minutes:$seconds'; // Return formatted duration string.
  }

  _buildAppBar() {
    return AppBar(
      title: const Text('Songs'), // Set app bar title.
      leading: IconButton(
        icon: const Icon(Icons.arrow_back), // Back arrow icon.
        onPressed: () {
          GoRouter.of(context).pop(); // Navigate back when the back arrow button is pressed.
        },
      ),
    );
  }

  _buildSongsList(List<SongEntity> songs) {
    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (BuildContext context, int index) {
        final song = songs[index]; // Get current song.
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Card(
            child: ListTile(
              leading: const Icon(Icons.music_note), // Optionally display an icon.
              title: Row(
                children: [
                  Text(
                    song.name ?? 'Unknown', // Display song name.
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8), // Spacer.
                  Text(
                    '(${_formatDuration(song.duration ?? 0)})', // Display formatted duration.
                  ),
                ],
              ),
              subtitle: Text(
                song.artistName ?? 'Unknown Artist', // Display artist name.
              ),
            ),
          ),
        );
      },
    );
  }
}
