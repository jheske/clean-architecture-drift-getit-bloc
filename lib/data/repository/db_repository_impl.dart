import 'package:clean_architecture_drift_getit_bloc/data/repository/db_repository.dart';

import '../datasource/database/app_database.dart';
import '../datasource/remote/app_api_service.dart';

class DatabaseRepositoryImpl implements DatabaseRepository {
  final AppDatabase _db;
  final ApiService _apiService;

  DatabaseRepositoryImpl(this._db, this._apiService);
}
