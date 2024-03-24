import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:morent/app/modules/home/controllers/home_controller.dart';
import 'package:morent/app/modules/home/widgets/custom_movie_list.dart';
import 'package:morent/app/modules/home/widgets/custom_title.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTitle(
              title: "Trending Movie",
              controller: controller,
            ),
            Obx(() => MovieList(
                  isLoading: controller.isLoadingDay,
                  isError: controller.isErrorDay,
                  movies: controller.selectedMovies,
                  imageUrl: controller.posterImageUrl,
                )),
            SizedBox(
              height: 5.h,
            ),
            CustomTitle(
              title: "Popular Movie",
              controller: controller,
              showButton: false,
            ),
            MovieList(
              isLoading: controller.isLoadingPopular,
              isError: controller.isErrorPopular,
              movies: controller.popularMovies,
              imageUrl: controller.posterImageUrl,
            ),
          ],
        ),
      ),
    );
  }
}
