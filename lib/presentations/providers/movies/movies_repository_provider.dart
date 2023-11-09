import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scanner_app/infrastructure/datasources/moviedb_datasource.dart';
import 'package:scanner_app/infrastructure/repositories/movie_repository_impl.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDataSource());
});
