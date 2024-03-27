import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:morent/app/data/models/movie_model.dart';
import 'package:morent/app/data/provider/search_api.dart';
import 'package:morent/app/data/services/search_movie/search_repository.dart';

class SearchService extends GetxService {
  late SearchRepository repository;

  Future<SearchService> init() async {
    final dio = Dio();
    final api = SearchApi(dio);
    repository = SearchRepository(api);
    return this;
  }

  final searchMovie = <MovieModel>[].obs;

  Future<void> fectSearchMovie(String query) async {
    try {
      await init();
      final searchMovieResponse = await repository.searchMovie(query);
      searchMovie.assignAll(searchMovieResponse.results);
    } catch (e) {
      print('Error fetching trending movies: $e');
    }
  }
}
