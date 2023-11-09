import 'package:dio/dio.dart';

import 'package:scanner_app/config/constants/environment.dart';
import 'package:scanner_app/domain/datasources/movies_datasources.dart';
import 'package:scanner_app/domain/entities/movie.dart';
import 'package:scanner_app/infrastructure/mappers/movie_mapper.dart';
import 'package:scanner_app/infrastructure/models/moviedb/moviedb_response.dart';

class MoviedbDataSource extends MoviesDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX'
      }));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');

    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster')
    .map(
      (moviedb) => MovieMapper.movieDBToEntity(moviedb)
      ).toList();

    return movies;
  }
}
