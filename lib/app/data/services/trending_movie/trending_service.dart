import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:morent/app/data/models/movie_model.dart';
import 'package:morent/app/data/provider/movie_api.dart';
import 'package:morent/app/data/services/trending_movie/trending_repository.dart';

class TrendingService extends GetxService {
  late TrendingRepository repository;

  Future<TrendingService> init() async {
    final dio = Dio();
    final api = MovieApi(dio);
    repository = TrendingRepository(api);
    return this;
  }

  final trendingMovie = <MovieModel>[].obs;

  Future<void> fetchTrendingMovies(String period) async {
    try {
      await init();
      final trendingMovies = await repository.getTrendingMovie(period);
      trendingMovie.assignAll(trendingMovies.results);
    } catch (e) {
      print('Error fetching trending movies: $e');
    }
  }
}
