import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/search_page_controller.dart';

class SearchPageView extends GetView<SearchPageController> {
  const SearchPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final searchController = Get.put(SearchPageController());
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            SearchBar(
              controller: searchController.searchTextController,
              hintText: 'Search Movie.....',
              leading: Icon(Icons.search),
              onSubmitted: (value) => searchController.fetchSearchMovie(),
            ),
            SizedBox(
              height: 20.h,
            ),
            Obx(
              () => searchController.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : controller.isError.value
                      ? const Text('Error fetching movies')
                      : ListView.builder(
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: searchController.searchMovies.length,
                          itemBuilder: (context, index) {
                            final movie = searchController.searchMovies[index];
                            return ListTile(
                              title: Text(movie.title ?? ''),
                              subtitle: Text(movie.releaseDate.toString()),
                              leading: movie.posterPath != null
                                  ? Image.network(
                                      '${searchController.posterImageUrl200}${movie.posterPath}',
                                      width: 50.w,
                                      height: 50.h,
                                      fit: BoxFit.cover,
                                    )
                                  : Container(
                                      width: 50.w,
                                      height: 50.h,
                                      color: Colors.grey,
                                      child: Center(child: Icon(Icons.movie)),
                                    ),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
