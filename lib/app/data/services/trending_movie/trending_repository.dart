import 'package:morent/app/data/models/trending_movie_response.dart';
import 'package:morent/app/data/provider/movie_api.dart';

class TrendingRepository {
  final MovieApi api;

  TrendingRepository(this.api);

  Future<MovieResponse> getTrendingMovie(String period) =>
      api.getTrendingMovie(period);
}
