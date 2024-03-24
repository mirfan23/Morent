import 'package:morent/app/data/models/movie_response.dart';
import 'package:morent/app/data/provider/movie_api.dart';

class PopularRepository {
  final MovieApi api;

  PopularRepository(this.api);

  Future<MovieResponse> getPopularMovie() => api.getPopularMovie();
}
