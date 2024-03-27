import 'package:morent/app/data/models/movie_response.dart';
import 'package:morent/app/data/provider/search_api.dart';

class SearchRepository {
  final SearchApi api;

  SearchRepository(this.api);

  Future<MovieResponse> searchMovie(String query) => api.searchMovie(query);
}
