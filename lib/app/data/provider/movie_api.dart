import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:morent/app/data/models/detail_response.dart';
import 'package:morent/app/data/models/movie_response.dart';

class MovieApi {
  final Dio dio;

  MovieApi(this.dio);

  Future<MovieResponse> getTrendingMovie(String period) async {
    try {
      final accessToken = dotenv.env['ACCESS_TOKEN'];
      final baseUrl = dotenv.env['BASE_URL'];

      String trendingMovieUrl = '$baseUrl/trending/movie/$period';

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

  Future<DetailMovieResponse> getDetailMovie(int movieId) async {
    try {
      final accessToken = dotenv.env['ACCESS_TOKEN'];
      final baseUrl = dotenv.env['BASE_URL'];

      String detailMovieUrl = '$baseUrl/movie/$movieId';

      final response = await dio.get(
        detailMovieUrl,
        options: Options(
          headers: {
            'accept': 'application/json',
            'Authorization': 'Bearer $accessToken',
          },
        ),
      );

      if (response.statusCode == 200) {
        final responseData = response.data;
        print('Error TRY Provider: $responseData');
        return DetailMovieResponse.fromJson(responseData);
      } else {
        throw Exception('Failed to load detail: $response');
      }
    } catch (e) {
      throw Exception('Error Fetching Detail Provider: $e');
    }
  }

  Future<MovieResponse> getPopularMovie() async {
    try {
      final accessToken = dotenv.env['ACCESS_TOKEN'];
      final baseUrl = dotenv.env['BASE_URL'];

      String trendingMovieUrl = '$baseUrl/movie/popular';

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
