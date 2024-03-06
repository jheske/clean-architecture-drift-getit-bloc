import 'dart:convert';

import 'package:clean_architecture_drift_getit_bloc/core/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_theme/json_theme.dart';

import 'core/bloc/artist/artist_bloc.dart';
import 'core/bloc/artist/artists_bloc.dart';
import 'core/bloc/artist/artists_event.dart';
import 'core/bloc/song/songs_bloc.dart';
import 'core/bloc/song/songs_event.dart';
import 'core/bloc/user/user_bloc.dart';
import 'core/bloc/user/users_bloc.dart';
import 'core/bloc/user/users_event.dart';
import 'core/injection_container.dart';
import 'data/datasource/database/app_database.dart';
import 'data/repository/repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeServiceLocator();

  final database = serviceLocator.get<AppDatabase>();
  final repository = serviceLocator.get<DatabaseRepository>();

  database.clearDatabase();

  final music = await repository.fetchMusic();
  repository.saveToDatabase(music);

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
    return MultiBlocProvider(
        providers: [
          BlocProvider<UsersBloc>(
            create: (context) => serviceLocator()..add(const GetUsers()),
          ),
          BlocProvider<UserBloc>(
            create: (context) => serviceLocator(),
          ),
          BlocProvider<ArtistsBloc>(
            create: (context) => serviceLocator()..add(const GetArtists()),
          ),
          BlocProvider<ArtistBloc>(
            create: (context) => serviceLocator(),
          ),
          BlocProvider<SongsBloc>(
            create: (context) => serviceLocator()..add(const GetSongs()),
          ),
        ],
        child: MaterialApp.router(
          title: 'Flutter Clean Architecture',
          theme: theme,
          routerConfig: appRouter,
        ));
  }
}
