import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/datasource/database/app_database.dart';
import '../data/datasource/database/app_database_impl.dart';
import '../data/datasource/remote/app_api_service.dart';
import '../data/repository/db_repository.dart';
import '../data/repository/db_repository_impl.dart';
import '../presentation/usecase/get_users_usecase.dart';

///
/// serviceLocator code adapted from this [SO answer](https://stackoverflow.com/a/76085459/5277309).
///

// Declaration of a singleton instance of GetIt for dependency injection.
final GetIt serviceLocator = GetIt.instance;

/// Function to initialize the service locator with required dependencies asynchronously.
Future<void> initializeServiceLocator() async {
  // Registering Dio instance as a singleton for making HTTP requests.
  serviceLocator.registerSingleton<Dio>(Dio());

  // Registering MusicApiService with the provided Dio instance.
  serviceLocator.registerSingleton<ApiService>(ApiService(serviceLocator()));

  // Initializing database connection and registering the instance.
  AppDatabase database = await _openDatabaseConnection();
  serviceLocator.registerSingleton<AppDatabase>(database);

  // Initializing repository and registering the instance.
  serviceLocator.registerSingleton<DatabaseRepository>(
    DatabaseRepositoryImpl(serviceLocator(), serviceLocator()),
  );

  serviceLocator.registerSingleton<GetUsersUseCase>(GetUsersUseCase(serviceLocator()));
  /*

  //Blocs
  sl.registerFactory<GetUsersFromDbBloc>(
    ()=> LocalUsersBloc(sl())
  );

  sl.registerFactory<GetUserFromDbBloc>(
    ()=> LocalUserBloc(sl(),sl(),sl())
  );
   */
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
