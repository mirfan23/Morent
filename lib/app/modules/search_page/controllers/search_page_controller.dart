import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:morent/app/data/models/movie_model.dart';
import 'package:morent/app/data/services/search_movie/search_service.dart';

class SearchPageController extends GetxController {
  late SearchService searchService;

  TextEditingController searchTextController = TextEditingController();

  final posterImageUrl200 = dotenv.env['IMAGE_POSTER_200'];

  var isLoading = true.obs;
  var isError = false.obs;
  var searchMovies = <MovieModel>[].obs;

  @override
  void onInit() {
    searchService = Get.put(SearchService());
    searchTextController.addListener(() {
      fetchSearchMovie();
    });
    super.onInit();
  }

  @override
  void onClose() {
    searchTextController.dispose();
    super.onClose();
  }

  void fetchSearchMovie() async {
    try {
      final query = searchTextController.text;
      isLoading(true);
      isError(false);
      if (query.isNotEmpty) {
        await searchService.fectSearchMovie(query);
        searchMovies.assignAll(searchService.searchMovie);
      }
    } catch (e) {
      print('Error fetching trending movies Day: $e');
      isError(true);
    } finally {
      isLoading(false);
    }
  }
}
