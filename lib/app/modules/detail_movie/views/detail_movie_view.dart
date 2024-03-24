import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:morent/app/modules/detail_movie/controllers/detail_movie_controller.dart';

class DetailMovieView extends GetView<DetailMovieController> {
  const DetailMovieView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Detail'),
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.isError.value) {
            return const Center(
              child: Text('Error fetching data'),
            );
          } else {
            final detailMovie = controller.detailMovie.value;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 240,
                      color: Colors.grey.shade200,
                      child: Image.network(
                        '${controller.backdropUrl}${detailMovie.backdropPath}',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 240,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    Positioned(
                      left: 10,
                      top: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          '${controller.posterImageUrl}${detailMovie.posterPath}',
                          width: 125,
                          height: 165,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 80.h,
                      left: 16.w,
                      right: 16.w,
                      bottom: 16.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          detailMovie.title ?? '',
                          style: TextStyle(
                            fontSize: 26.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            const Icon(Icons.date_range),
                            SizedBox(width: 8.h),
                            Text(detailMovie.releaseDate ?? ''),
                            SizedBox(width: 16.h),
                            const Icon(Icons.access_time),
                            SizedBox(width: 8.h),
                            Text('${detailMovie.runtime} minutes'),
                            SizedBox(width: 16.h),
                            const Icon(Icons.local_movies),
                            SizedBox(width: 8.h),
                            const Text('Action'),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'Movie Overview',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          detailMovie.overview ?? '',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
