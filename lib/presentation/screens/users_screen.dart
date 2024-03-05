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
import 'package:clean_architecture_drift_getit_bloc/data/datasource/database/app_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/bloc/user/user_bloc.dart';
import '../../core/bloc/user/user_event.dart';
import '../../core/bloc/user/users_bloc.dart';
import '../../core/bloc/user/users_state.dart';
import '../../core/injection_container.dart';
import '../../data/repository/repository.dart';
import '../../domain/entity/user_entity.dart';

// This class represents the UsersScreen, which is a StatefulWidget used to display
// a list of users. It contains a Scaffold with an AppBar and body content to show
// the list of users fetched from the repository.

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key}); // Constructor for UsersScreen.

  @override
  State createState() => _UsersScreenState(); // Create state for UsersScreen.
}

// State class for UsersScreen.
class _UsersScreenState extends State<UsersScreen> {
  // Repository instance obtained from the service locator.
  final repository = serviceLocator.get<DatabaseRepository>();
  final db = serviceLocator.get<AppDatabase>();

  // Build method to construct the UI for UsersScreen.
  @override
  Widget build(BuildContext context) {
    // Return Scaffold widget with AppBar and body content.
    return Scaffold(
      appBar: _buildAppBar(),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (_, state) {
          if (state is UsersLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UsersDone) {
            return _buildUserList(state.users ?? []);
          } else if (state is UsersError) {
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
      title: const Text('Users'), // Set app bar title.
      leading: IconButton(
        icon: const Icon(Icons.arrow_back), // Back arrow icon.
        onPressed: () {
          GoRouter.of(context).pop(); // Navigate back when the back arrow button is pressed.
        },
      ),
    );
  }

  _buildUserList(List<UserEntity> users) {
    return users.isEmpty
        ? const Center(
            child: Text('No users found'),
          )
        : ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index]; // Get current user.
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Set selected user using Provider.
                    context.read<UserBloc>().add(
                          GetUser(id: user.id), // Dispatch UserEvent with user.
                        );
                    GoRouter.of(context)
                        .push('/user/${user.id}'); // Navigate to user details screen.
                  },
                  child: Text(user.username), // Display user username on button.
                ),
              );
            },
          );
  }
}
