import 'package:clean_architecture_drift_getit_bloc/core/bloc/user/users_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/datasource/database/app_database.dart';
import '../data/datasource/database/app_database_impl.dart';
import '../data/datasource/remote/app_api_service.dart';
import '../data/repository/repository.dart';
import '../data/repository/repository_impl.dart';
import '../presentation/usecase/get_artist_usecase.dart';
import '../presentation/usecase/get_artists_usecase.dart';
import '../presentation/usecase/get_songs_usecase.dart';
import '../presentation/usecase/get_user_usecase.dart';
import '../presentation/usecase/get_users_usecase.dart';
import 'bloc/artist/artist_bloc.dart';
import 'bloc/artist/artists_bloc.dart';
import 'bloc/song/songs_bloc.dart';
import 'bloc/user/user_bloc.dart';

///
/// serviceLocator code adapted from this [SO answer](https://stackoverflow.com/a/76085459/5277309).
///

// Declaration of a singleton instance of GetIt for dependency injection.
final GetIt serviceLocator = GetIt.instance;

/// Function to initialize the service locator with required dependencies asynchronously.
Future<void> initializeServiceLocator() async {
  // Registering Dio instance as a singleton for making HTTP requests.
  serviceLocator.registerSingleton<Dio>(Dio());

  // Registering ApiService with the provided Dio instance.
  serviceLocator.registerSingleton<ApiService>(ApiService(serviceLocator()));

  // Initializing database connection and registering the instance.
  AppDatabase database = await _openDatabaseConnection();
  serviceLocator.registerSingleton<AppDatabase>(database);

  // Initializing repository and registering the instance.
  serviceLocator.registerSingleton<DatabaseRepository>(
    DatabaseRepositoryImpl(serviceLocator(), serviceLocator()),
  );

  //  UseCases are registered as singletons.
  serviceLocator.registerSingleton<GetUsersUseCase>(GetUsersUseCase(serviceLocator()));
  serviceLocator.registerSingleton<GetUserUseCase>(GetUserUseCase(serviceLocator()));
  serviceLocator.registerSingleton<GetArtistsUseCase>(GetArtistsUseCase(serviceLocator()));
  serviceLocator.registerSingleton<GetArtistUseCase>(GetArtistUseCase(serviceLocator()));
  serviceLocator.registerSingleton<GetSongsUseCase>(GetSongsUseCase(serviceLocator()));

  //  Blocs are registered as factories.
  serviceLocator.registerFactory<UsersBloc>(() => UsersBloc(serviceLocator()));
  serviceLocator.registerFactory<UserBloc>(() => UserBloc(serviceLocator()));
  serviceLocator.registerFactory<ArtistsBloc>(() => ArtistsBloc(serviceLocator()));
  serviceLocator.registerFactory<ArtistBloc>(() => ArtistBloc(serviceLocator()));
  serviceLocator.registerFactory<SongsBloc>(() => SongsBloc(serviceLocator()));
}

/// Generic function to retrieve an instance of a registered type from the service locator.
T get<T extends Object>() {
  return serviceLocator.get<T>();
}

/// Function to lazily register a singleton instance.
registerLazySingleton<T extends Object>(T Function() function) {
  serviceLocator.registerLazySingleton<T>(function);
}

/// Function to open a database connection asynchronously.
Future<AppDatabase> _openDatabaseConnection() async {
  return AppDatabaseImpl(); // Placeholder for opening database connection.
}
