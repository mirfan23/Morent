import 'package:morent/app/data/models/detail_response.dart';
import 'package:morent/app/data/provider/movie_api.dart';

class DetailRepository {
  final MovieApi api;

  DetailRepository(this.api);

  Future<DetailMovieResponse> getDetailMovie(int movieId) =>
      api.getDetailMovie(movieId);
}
