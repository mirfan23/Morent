import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:morent/app/modules/splash_screen/widgets/rectangle_shape.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            /*green rectangle*/

            AnimatedBuilder(
              animation: controller.animationController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, -50 + controller.greenTranslationY),
                  child: rectangleSape(Colors.green),
                );
              },
            ),

            /*red rectangle */

            AnimatedBuilder(
              animation: controller.animationController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, controller.redTranslationY),
                  child: Transform.rotate(
                    angle: controller.redRotation,
                    child: rectangleSape(Colors.red),
                  ),
                );
              },
            ),

            /*yellow*/

            AnimatedBuilder(
              animation: controller.animationController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, controller.yellowTranslationY),
                  child: Transform.rotate(
                    angle: controller.yellowRotation,
                    child: rectangleSape(Colors.yellow),
                  ),
                );
              },
            ),

            /*splash image*/

            Image.asset(
              "assets/images/splash.png",
              width: 250,
              height: 250,
            ),
          ],
        ),
      ),
    );
  }
}
