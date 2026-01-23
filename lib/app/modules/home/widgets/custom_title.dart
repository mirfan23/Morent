import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:morent/app/modules/home/controllers/home_controller.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle(
      {Key? key,
      required this.controller,
      required this.title,
      this.showButton = true,
      this.alternateController})
      : super(key: key);

  final HomeController? controller;
  final String title;
  final bool showButton;
  final HomeController? alternateController;

  @override
  Widget build(BuildContext context) {
    final currentController = alternateController ?? controller;

    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ),
        ),
        if (showButton)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => ToggleButtons(
                isSelected: [
                  currentController?.selectedPeriod.value == 'Day',
                  currentController?.selectedPeriod.value == 'Week',
                ],
                onPressed: (int index) {
                  if (index == 0) {
                    currentController?.selectedPeriod.value = 'Day';
                  } else {
                    currentController?.selectedPeriod.value = 'Week';
                  }
                },
                borderRadius: BorderRadius.circular(50),
                children: const [
                  Text('Day'),
                  Text('Week'),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
