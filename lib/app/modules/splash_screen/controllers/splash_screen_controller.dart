import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morent/app/modules/login/controllers/login_controller.dart';

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
    loginController = Get.put(LoginController());

    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
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

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        loginController.handleAuth();
      }
    });

    animationController.forward();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
