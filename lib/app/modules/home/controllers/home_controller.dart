import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:morent/app/data/models/movie_model.dart';
import 'package:morent/app/data/services/popular_movie/popular_service.dart';
import 'package:morent/app/data/services/trending_movie/trending_service.dart';

class HomeController extends GetxController {
  late TrendingService trendingService;
  late PopularService popularService;

  var activeIndex = 0.obs;

  final posterImageUrl = dotenv.env['IMAGE_POSTER_500'];
  final backdropUrl = dotenv.env['IMAGE_BACKDROP'];

  /*Trending Day*/
  var isLoadingDay = true.obs;
  var isErrorDay = false.obs;
  var trendingMoviesDay = <MovieModel>[].obs;

  /*Trending Week*/
  var isLoadingWeek = true.obs;
  var isErrorWeek = false.obs;
  var trendingMoviesWeek = <MovieModel>[].obs;

  /*Popular Movie*/
  var isLoadingPopular = true.obs;
  var isErrorPopular = false.obs;
  var popularMovies = <MovieModel>[].obs;

  /*Default Value for Toggle Button*/
  var selectedPeriod = 'Day'.obs;

  void indexchange(int index) {
    activeIndex.value = index;
  }

  @override
  void onInit() {
    trendingService = Get.put(TrendingService());
    popularService = Get.put(PopularService());
    super.onInit();
    fetchTrendingMovieDay();
    fetchTrendingMovieWeek();
    fetchPopularMovie();
  }

  /*For Toggle Button show Data*/
  List<MovieModel> get selectedMovies {
    if (selectedPeriod.value == 'Day') {
      return trendingMoviesDay;
    } else {
      return trendingMoviesWeek;
    }
  }

  /*Fetching Trending Movie Day*/
  Future<void> fetchTrendingMovieDay() async {
    try {
      isLoadingDay(true);
      isErrorDay(false);
      var periodDay = 'day';
      await trendingService.fetchTrendingMovies(periodDay);
      trendingMoviesDay.assignAll(trendingService.trendingMovie);
    } catch (e) {
      print('Error fetching trending movies Day: $e');
      isErrorDay(true);
    } finally {
      isLoadingDay(false);
    }
  }

  /*Fetching Trending Movie Week*/
  Future<void> fetchTrendingMovieWeek() async {
    try {
      isLoadingWeek(true);
      isErrorWeek(false);
      var periodWeek = 'week';
      await trendingService.fetchTrendingMovies(periodWeek);
      trendingMoviesWeek.assignAll(trendingService.trendingMovie);
    } catch (e) {
      print('Error fetching trending movies Week: $e');
      isErrorWeek(true);
    } finally {
      isLoadingWeek(false);
    }
  }

  /*Fetching Popular Movie*/
  Future<void> fetchPopularMovie() async {
    try {
      isLoadingPopular(true);
      isErrorPopular(false);
      await popularService.fetchPopularMovies();
      popularMovies.assignAll(popularService.poularMovie);
    } catch (e) {
      print('Error fetching popular movies: $e');
      isErrorPopular(true);
    } finally {
      isLoadingPopular(false);
    }
  }
}
