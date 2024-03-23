import 'package:get/get.dart';
import 'package:morent/app/data/models/trending_movie_model.dart';
import 'package:morent/app/data/services/trending_movie/trending_service.dart';

class HomeController extends GetxController {
  late TrendingService trendingService;

  var isLoadingDay = true.obs;
  var isLoadingWeek = true.obs;
  var isErrorDay = false.obs;
  var isErrorWeek = false.obs;
  var trendingMoviesDay = <TrendingMovie>[].obs;
  var trendingMoviesWeek = <TrendingMovie>[].obs;

  var selectedPeriod = 'Day'.obs; // Default selected period is Day

  @override
  void onInit() {
    trendingService = Get.put(TrendingService());
    super.onInit();
    fetchTrendingMovieDay();
    fetchTrendingMovieWeek();
  }

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

  List<TrendingMovie> get selectedMovies {
    if (selectedPeriod.value == 'Day') {
      return trendingMoviesDay;
    } else {
      return trendingMoviesWeek;
    }
  }
}
