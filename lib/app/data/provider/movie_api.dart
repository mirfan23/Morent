import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:morent/app/data/models/trending_movie_response.dart';

class MovieApi {
  final Dio dio;

  MovieApi(this.dio);

  Future<MovieResponse> getTrendingMovie(String period) async {
    try {
      final accessToken = dotenv.env['ACCESS_TOKEN'];

      String trendingMovieUrl =
          'https://api.themoviedb.org/3/trending/movie/$period';
      final response = await dio.get(
        trendingMovieUrl,
        options: Options(
          headers: {
            'accept': 'application/json',
            'Authorization': 'Bearer $accessToken',
          },
        ),
      );
      if (response.statusCode == 200) {
        final responseData = response.data;
        return MovieResponse.fromJson(responseData);
      } else {
        throw Exception('Failed to load trending movies: $response');
      }
    } catch (e) {
      throw Exception('Error fetching trending movies: $e');
    }
  }
}
