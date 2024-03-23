import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morent/app/modules/login/controllers/login_controller.dart';
import 'package:morent/app/routes/app_pages.dart';

class SplashScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;

  late LoginController loginController;

  double greenTranslationY = 0;
  double redRotation = 0;
  double redTranslationY = 0;
  double yellowRotation = 0;
  double yellowTranslationY = 0;

  @override
  void onInit() {
    super.onInit();
    loginController = Get.put(LoginController());

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    Tween<double> yellowRotationTween =
        Tween<double>(begin: 0, end: -45 * (3.14 / 180));
    animationController.drive(yellowRotationTween).addListener(() {
      yellowRotation = yellowRotationTween.evaluate(animationController);
      update();
    });

    Tween<double> redRotationTween =
        Tween<double>(begin: 0, end: 45 * (3.14 / 180));
    animationController.drive(redRotationTween).addListener(() {
      redRotation = redRotationTween.evaluate(animationController);
      update();
    });

    Tween<double> greenTranslationTween = Tween<double>(begin: 0, end: -50);
    animationController.drive(greenTranslationTween).addListener(() {
      greenTranslationY = greenTranslationTween.evaluate(animationController);
      update();
    });

    // animationController
    //     .forward()
    //     .then((value) => loginController.checkLoginStatus());

    animationController
        .forward()
        .then((value) => Get.offAllNamed(AppPages.LOGIN));
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
