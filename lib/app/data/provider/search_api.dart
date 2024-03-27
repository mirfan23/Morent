import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:morent/app/data/models/movie_response.dart';

class SearchApi {
  final Dio dio;

  SearchApi(this.dio);

  Future<MovieResponse> searchMovie(String query) async {
    try {
      final accessToken = dotenv.env['ACCESS_TOKEN'];
      final baseUrl = dotenv.env['BASE_URL'];

      String trendingMovieUrl = '$baseUrl/search/movie';

      int page = 1;
      bool hasMorePages = true;

      while (hasMorePages) {
        final response = await dio.get(trendingMovieUrl,
            options: Options(
              headers: {
                'accept': 'application/json',
                'Authorization': 'Bearer $accessToken',
              },
            ),
            queryParameters: {'query': query});
        if (response.statusCode == 200) {
          final responseData = response.data;
          return MovieResponse.fromJson(responseData);
        } else {
          throw Exception('Failed to load Saerch movies: $response');
        }
      }
    } catch (e) {
      throw Exception('Error fetching Saerch movies: $e');
    }
  }
}
