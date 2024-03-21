import 'package:get/get.dart';

import '../controllers/my_token_controller.dart';

class MyTokenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyTokenController>(
      () => MyTokenController(),
    );
  }
}
