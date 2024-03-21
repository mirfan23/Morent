import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morent/app/modules/home/views/home_view.dart';
import 'package:morent/app/modules/my_token/controllers/my_token_controller.dart';
import 'package:morent/app/modules/search/views/search_view.dart';
import 'package:morent/app/modules/transaction_history/views/transaction_history_view.dart';
import 'package:morent/app/modules/wishlist/views/wishlist_view.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs;
  late MyTokenController myTokenController;

  final List<Widget> pages = [
    const HomeView(),
    const SearchView(),
    const WishlistView(),
    const TransactionHistoryView(),
  ];

  @override
  void onInit() {
    myTokenController = Get.put(MyTokenController());
    super.onInit();
  }

  void changetabIndex(int index) {
    selectedIndex.value = index;
  }
}
