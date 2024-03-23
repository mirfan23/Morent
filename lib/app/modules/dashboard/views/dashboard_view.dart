import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:morent/app/modules/my_token/controllers/my_token_controller.dart';
import 'package:morent/app/routes/app_pages.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(AppPages.CART),
            icon: const Icon(
              Icons.shopping_cart_outlined,
            ),
          ),
          GetBuilder<MyTokenController>(
            builder: (myTokenController) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      elevation: 0,
                      backgroundColor: Colors.grey),
                  onPressed: () => Get.toNamed(AppPages.MY_TOKEN),
                  child: SizedBox(
                    child: Row(
                      children: [
                        const Icon(Icons.token),
                        SizedBox(
                          width: 10.w,
                        ),
                        Obx(() => Text(
                            'Tokens: ${Get.find<MyTokenController>().tokenAmount}'))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Obx(() => IndexedStack(
            index: controller.selectedIndex.value,
            children: controller.pages,
          )),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Wishlist',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              label: 'Transaction History',
            ),
          ],
          currentIndex: controller.selectedIndex.value,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            controller.changetabIndex(index);
          },
        ),
      ),
    );
  }
}
