import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:morent/app/data/models/detail_response.dart';
import 'package:morent/app/data/provider/movie_api.dart';
import 'package:morent/app/data/services/detail_movie/detail_repository.dart';

class DetailService extends GetxService {
  late DetailRepository repository;

  Future<DetailService> init() async {
    final dio = Dio();
    final api = MovieApi(dio);
    repository = DetailRepository(api);
    return this;
  }

  Future<DetailMovieResponse> fetchDetailMovie(int movieId) async {
    try {
      await init();
      return await repository.getDetailMovie(movieId);
    } catch (e) {
      throw Exception('Error fetching detail Service: $e');
    }
  }
}
