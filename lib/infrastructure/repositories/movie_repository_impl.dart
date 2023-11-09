import 'package:scanner_app/domain/datasources/movies_datasources.dart';
import 'package:scanner_app/domain/entities/movie.dart';
import 'package:scanner_app/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDataSource dataSource;
  MovieRepositoryImpl(this.dataSource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return dataSource.getNowPlaying(page: page);
  }
}
