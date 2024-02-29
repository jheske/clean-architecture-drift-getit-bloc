import 'dart:convert';

import 'package:clean_architecture_drift_getit_bloc/presentation/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';

import 'core/injection_container.dart';
import 'data/datasource/database/app_database.dart';
import 'data/repository/db_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeServiceLocator();

  final database = serviceLocator.get<AppDatabase>();
  final repository = serviceLocator.get<DatabaseRepository>();

  final themeStr =
      await rootBundle.loadString('assets/themes/app_painter_theme_F44336_redorange_light.json');
  final themeJson = json.decode(themeStr);

  final theme = ThemeDecoder.decodeThemeData(themeJson)!;

  runApp(MyApp(theme: theme));
}

class MyApp extends StatelessWidget {
  final ThemeData theme;

  const MyApp({super.key, required this.theme});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Clean Architecture',
      theme: theme,
      routerConfig: appRouter,
    );
  }
}
