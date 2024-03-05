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

import '../../core/bloc/user/user_bloc.dart';
import '../../core/bloc/user/user_state.dart';
import '../../domain/entity/user_entity.dart';

class UserScreen extends StatelessWidget {
  final String? id; // User ID.
  const UserScreen({super.key, this.id}); // Constructor for UserScreen.

  @override
  Widget build(BuildContext context) {
    // Obtain theme data from context.
    final theme = Theme.of(context);

    return BlocBuilder<LocalUserBloc, LocalUserState>(
      builder: (BuildContext context, state) {
        // Dispatch GetUser event with the provided id when LocalUserBloc is first initialized
        if (state is LocalUserLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LocalUserDone) {
          return _buildScreen(context, theme, state.user);
        } else if (state is LocalUserError) {
          return const Center(child: Text('Error loading user.'));
        } else {
          return const Center(child: Text('Unknown error.'));
        }
      },
    );
  }

  _buildAppBar(BuildContext context, UserEntity? user) {
    return AppBar(
      title: Text(user?.username ?? 'User not found'), // Set app bar title to user's username.
      leading: IconButton(
        icon: const Icon(Icons.arrow_back), // Back arrow icon.
        onPressed: () {
          GoRouter.of(context).pop(); // Navigate back when the back arrow button is pressed.
        },
      ),
    );
  }

  _buildScreen(BuildContext context, ThemeData theme, UserEntity? user) {
    return Scaffold(
      appBar: _buildAppBar(context, user),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User information section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Id:', style: theme.textTheme.titleMedium), // Display user ID.
                    const SizedBox(width: 10), // Spacer.
                    Text(user?.id.toString() ?? ''), // Display user's ID.
                  ],
                ),
                const SizedBox(height: 10), // Spacer.
                Row(
                  children: [
                    Text('Music Style:',
                        style: theme.textTheme.titleMedium), // Display music style.
                    const SizedBox(width: 10), // Spacer.
                    Text(user?.musicStyle ?? 'none') // Display user's music style.
                  ],
                ),
                const SizedBox(height: 10), // Spacer.
                Row(
                  children: [
                    Text('Favorite Song:',
                        style: theme.textTheme.titleMedium), // Display favorite song.
                    const SizedBox(width: 10), // Spacer.
                    Text(user?.favoriteSongName ?? 'none') // Display user's favorite song.
                  ],
                ),
              ],
            ),
          ),

          // Playlist title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Playlist', style: theme.textTheme.titleLarge), // Display playlist title.
          ),
          // ListView to display songs in the user's playlist
          Expanded(
            child: ListView.builder(
              itemCount: user?.playlist?.songs.length ?? 0,
              itemBuilder: (context, index) {
                final song = user?.playlist!.songs[index];
                return ListTile(
                  title: Text(song?.name ?? 'Unknown'), // Display song name.
                  subtitle:
                      Text('Artist: ${song?.artist?.name ?? "Unknown"}'), // Display artist name.
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
