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

import '../../core/bloc/artist/artist_bloc.dart';
import '../../core/bloc/artist/artist_state.dart';
import '../../domain/entity/artist_entity.dart';

// This class represents the ArtistScreen, which is a StatefulWidget used to display
// information about a specific artist. It contains a Scaffold with an AppBar and
// body content to show details about the artist, including their age, music style,
// and a list of songs associated with them.

class ArtistScreen extends StatefulWidget {
  const ArtistScreen({super.key}); // Constructor for ArtistScreen.

  @override
  State createState() => _ArtistScreenState(); // Create state for ArtistScreen.
}

// State class for ArtistScreen.
class _ArtistScreenState extends State<ArtistScreen> {
  // Build method to construct the UI for ArtistScreen.
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Obtain theme data from context.

    return BlocBuilder<ArtistBloc, ArtistState>(
      builder: (BuildContext context, state) {
        // Dispatch GetArtist event with the provided id when ArtistBloc is first initialized
        if (state is ArtistLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ArtistDone) {
          return _buildScreen(context, theme, state.artist);
        } else if (state is ArtistError) {
          return const Center(child: Text('Error loading artist.'));
        } else {
          return const Center(child: Text('Unknown error.'));
        }
      },
    );
  }

  _buildAppBar(BuildContext context, ArtistEntity? artist) {
    return AppBar(
      title: Text(artist?.name ?? 'Artist not found'), // Set app bar title to user's username.
      leading: IconButton(
        icon: const Icon(Icons.arrow_back), // Back arrow icon.
        onPressed: () {
          GoRouter.of(context).pop(); // Navigate back when the back arrow button is pressed.
        },
      ),
    );
  }

  _buildScreen(BuildContext context, ThemeData theme, ArtistEntity? artist) {
    return Scaffold(
      appBar: _buildAppBar(context, artist),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display artist's age.
            Text('Age: ${artist?.age ?? 0}', style: theme.textTheme.titleMedium),
            const SizedBox(height: 10), // Spacer.
            // Display artist's music style.
            Text(
              'Music Style: ${artist?.musicStyle ?? 'none'}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20), // Spacer.
            // Display section header for songs.
            Text('Songs:', style: theme.textTheme.titleMedium),
            const SizedBox(height: 10), // Spacer.
            // FutureBuilder to asynchronously fetch and display songs associated with the artist.
            _buildSongList(context, artist),
          ],
        ),
      ),
    );
  }

  _buildSongList(BuildContext context, ArtistEntity? artist) {
    final songs = artist?.songs ?? []; // Get list of songs associated with the artist.

    return SizedBox(
        height: 200, // Limit height to allow scrolling
        child: ListView.builder(
          itemCount: songs.length,
          itemBuilder: (context, index) {
            final song = songs[index]; // Get current song.
            return ListTile(
              title: Text(song.name ?? ''), // Display song name.
              subtitle: Text('Duration: ${song.duration}'), // Display song duration.
            );
          },
        ));
  }
}
