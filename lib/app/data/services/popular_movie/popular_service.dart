import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:morent/app/data/models/movie_model.dart';
import 'package:morent/app/data/provider/movie_api.dart';
import 'package:morent/app/data/services/popular_movie/popular_repository.dart';

class PopularService extends GetxService {
  late PopularRepository repository;

  Future<PopularService> init() async {
    final dio = Dio();
    final api = MovieApi(dio);
    repository = PopularRepository(api);
    return this;
  }

  final poularMovie = <MovieModel>[].obs;

  Future<void> fetchPopularMovies() async {
    try {
      await init();
      final poularMovieResponse = await repository.getPopularMovie();
      poularMovie.assignAll(poularMovieResponse.results);
    } catch (e) {
      print('Error fetching trending movies: $e');
    }
  }
}
