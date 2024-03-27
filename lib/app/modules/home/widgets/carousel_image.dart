import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:morent/app/data/models/movie_model.dart';
import 'package:morent/app/modules/home/controllers/home_controller.dart';
import 'package:morent/app/routes/app_pages.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselImage extends StatelessWidget {
  final int itemCount;
  final HomeController controller;
  final List<MovieModel> movies;
  final HomeController? alternateController;

  const CarouselImage(
      {Key? key,
      required this.itemCount,
      required this.controller,
      required this.movies,
      this.alternateController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentController = alternateController ?? controller;

    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: itemCount,
          itemBuilder: (_, index, ___) {
            return GestureDetector(
              onTap: () => Get.toNamed(AppPages.DETAIL_MOVIE,
                  arguments: movies[index].id),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  carditem(movies, index),
                  Container(
                    height: 175.h,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  Positioned(
                    bottom: 50.h,
                    child: Center(
                        // child: Text(
                        //   movies[index].title ?? '',
                        //   style: TextStyle(color: Colors.white, fontSize: 24.sp),
                        // ),
                        ),
                  ),
                ],
              ),
            );
          },
          options: CarouselOptions(
            viewportFraction: 1.0,
            aspectRatio: 1.5 / 1,
            autoPlayCurve: Curves.easeIn,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            onPageChanged: (index, reason) {
              currentController.indexchange(index);
            },
          ),
        ),
        Positioned(
          width: 300.h,
          bottom: 25.h,
          child: Center(
            child: buildIndicator(movies, controller),
          ),
        ),
      ],
    );
  }

  Widget carditem(List<MovieModel> data, int index) {
    if (data.isEmpty || index < 0 || index >= data.length) {
      return Container();
    }
    return Image.network(
      '${controller.backdropUrl}${data[index].backdropPath}',
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }

  Widget buildIndicator(List<MovieModel> data, HomeController controller) =>
      Obx(
        () => AnimatedSmoothIndicator(
          activeIndex: controller.activeIndex.value,
          count: itemCount,
          effect: const WormEffect(
            dotHeight: 10,
            dotWidth: 14,
          ),
        ),
      );
}
