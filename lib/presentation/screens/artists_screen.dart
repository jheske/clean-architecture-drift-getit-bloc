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
import '../../core/bloc/artist/artist_event.dart';
import '../../core/bloc/artist/artists_bloc.dart';
import '../../core/bloc/artist/artists_state.dart';
import '../../domain/entity/artist_entity.dart';

// This class represents the ArtistsScreen, which is a StatefulWidget used to display
// a list of artists. It contains a Scaffold with an AppBar and body content to show
// the list of artists fetched from the repository.
class ArtistsScreen extends StatefulWidget {
  const ArtistsScreen({super.key}); // Constructor for ArtistsScreen.

  @override
  State<ArtistsScreen> createState() => _ArtistsScreenState(); // Create state for ArtistsScreen.
}

// State class for ArtistsScreen.
class _ArtistsScreenState extends State<ArtistsScreen> {
  // Build method to construct the UI for ArtistsScreen.
  @override
  Widget build(BuildContext context) {
    // Return Scaffold widget with AppBar and body content.
    return Scaffold(
      appBar: _buildAppBar(),
      body: BlocBuilder<ArtistsBloc, ArtistsState>(
        builder: (_, state) {
          if (state is ArtistsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ArtistsDone) {
            return _buildArtistList(state.artists ?? []);
          } else if (state is ArtistsError) {
            return Center(child: Text(state.exception?.message ?? 'An error occurred'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text('Artists'), // Set app bar title.
      leading: IconButton(
        icon: const Icon(Icons.arrow_back), // Back arrow icon.
        onPressed: () {
          GoRouter.of(context).pop(); // Navigate back when the back arrow button is pressed.
        },
      ),
    );
  }

  _buildArtistList(List<ArtistEntity> artists) {
    return ListView.builder(
      itemCount: artists.length,
      itemBuilder: (BuildContext context, int index) {
        final artist = artists[index]; // Get current artist.
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 8.0),
          child: ElevatedButton(
            onPressed: () {
              // Set selected user using Provider.
              context.read<ArtistBloc>().add(
                    GetArtist(id: artist.id), // Dispatch UserEvent with user.
                  );
              GoRouter.of(context).push('/artist'); // Navigate to artist details screen.
            },
            child: Text(artist.name ?? ''), // Display artist name on button.
          ),
        );
      },
    );
  }
}

/*
      body: FutureBuilder(
        future: _repository.getArtists(), // Fetch list of artists asynchronously.
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // Show loading indicator while waiting for data.
          } else {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}'); // Show error message if data fetching fails.
            } else {
              final artists = snapshot.data as List<ArtistEntity>; // Get list of artists.
              return ListView.builder(
                itemCount: artists.length,
                itemBuilder: (BuildContext context, int index) {
                  final artist = artists[index]; // Get current artist.
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Provider.of<ArtistEntity>(context, listen: false)
                            .setArtist(artist); // Set selected artist using Provider.
                        GoRouter.of(context).push('/artist'); // Navigate to artist details screen.
                      },
                      child: Text(artist.name ?? ''), // Display artist name on button.
                    ),
                  );
                },
              );
            }
          }
        },
      ),

 */
