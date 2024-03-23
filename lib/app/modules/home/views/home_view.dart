import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morent/app/modules/home/controllers/home_controller.dart';
import 'package:morent/app/modules/home/widgets/custom_movie_list.dart';
import 'package:morent/app/modules/home/widgets/custom_title_with_button.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const imageUrl = 'https://image.tmdb.org/t/p/w500';

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTitleWithButton(controller: controller),
          Obx(() => MovieList(
                isLoading: controller.isLoadingDay,
                isError: controller.isErrorDay,
                movies: controller.selectedMovies,
                imageUrl: imageUrl,
              )),
        ],
      ),
    );
  }
}
