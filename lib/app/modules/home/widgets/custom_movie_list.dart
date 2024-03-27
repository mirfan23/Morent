import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:morent/app/data/models/movie_model.dart';
import 'package:morent/app/routes/app_pages.dart';

class MovieList extends StatelessWidget {
  final RxBool isLoading;
  final RxBool isError;
  final List<MovieModel> movies;
  final String? imageUrl;

  const MovieList({
    Key? key,
    required this.isLoading,
    required this.isError,
    required this.movies,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (isError.value) {
          return const Center(
            child: Text('Error fetching data'),
          );
        } else {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: 10.w),
                SizedBox(
                  height: 200.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      final movie = movies[index];
                      return GestureDetector(
                        onTap: () {
                          final movieId = movie.id;
                          Get.toNamed(
                            AppPages.DETAIL_MOVIE,
                            arguments: movieId,
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  '$imageUrl${movie.posterPath}',
                                  width: 130.w,
                                  height: 160.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Expanded(
                                child: Text(
                                  movie.title ?? '',
                                  style: TextStyle(fontSize: 18.sp),
                                  maxLines: 2,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Row(
                                children: [
                                  Icon(
                                    Icons.date_range,
                                    size: 12.sp,
                                  ),
                                  Text(
                                    movie.releaseDate?.toString() ?? '',
                                    style: TextStyle(fontSize: 14.sp),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
