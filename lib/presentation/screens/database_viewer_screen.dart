import 'package:drift/drift.dart';
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';

import '../../core/injection_container.dart';
import '../../data/datasource/database/app_database.dart';

class DatabaseViewsScreen extends StatelessWidget {
  // Database instance obtained from the service locator.
  final AppDatabase database = serviceLocator.get<AppDatabase>();

  // Constructor for DatabaseViewsScreen.
  DatabaseViewsScreen({super.key});

  // Build method to construct the UI for DatabaseViewsScreen.
  @override
  Widget build(BuildContext context) {
    // Return Scaffold widget with AppBar and body content.
    return Scaffold(
        appBar: AppBar(
          title: const Text('Database View'), // Set app bar title.
        ),
        body: DriftDbViewer(
          database as GeneratedDatabase,
        ));
  }
}
