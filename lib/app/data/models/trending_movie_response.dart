import 'package:morent/app/data/models/trending_movie_model.dart';

class MovieResponse {
  final int page;
  final List<TrendingMovie> results;
  final int totalPages;
  final int totalResults;

  MovieResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return MovieResponse(
      page: json['page'] ?? 0,
      results: List<TrendingMovie>.from(
          json['results'].map((x) => TrendingMovie.fromJson(x))),
      totalPages: json['total_pages'] ?? 0,
      totalResults: json['total_results'] ?? 0,
    );
  }
}
