import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:morent/app/data/models/detail_response.dart';
import 'package:morent/app/data/services/detail_movie/detail_service.dart';

class DetailMovieController extends GetxController {
  late DetailService detailService;

  var isLoading = true.obs;
  var isError = false.obs;
  var detailMovie = DetailMovieResponse().obs;

  final posterImageUrl = dotenv.env['IMAGE_POSTER'];
  final backdropUrl = dotenv.env['IMAGE_BACKDROP'];

  @override
  void onInit() {
    detailService = Get.put(DetailService());
    super.onInit();
    fetchDetailMovie();
  }

  Future<void> fetchDetailMovie() async {
    final movieId = Get.arguments;
    try {
      isLoading(true);
      isError(false);
      detailMovie.value = await detailService.fetchDetailMovie(movieId);
    } catch (e) {
      print('Error fetching movie detail Controller: $e, $movieId');
      isError(true);
    } finally {
      isLoading(false);
    }
  }
}
