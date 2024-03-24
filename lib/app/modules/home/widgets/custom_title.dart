import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:morent/app/modules/home/controllers/home_controller.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    Key? key,
    required this.controller,
    required this.title,
    this.showButton = true,
  }) : super(key: key);

  final HomeController controller;
  final String title;
  final bool showButton;

  @override
  Widget build(BuildContext context) {
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
                  controller.selectedPeriod.value == 'Day',
                  controller.selectedPeriod.value == 'Week',
                ],
                onPressed: (int index) {
                  if (index == 0) {
                    controller.selectedPeriod.value = 'Day';
                  } else {
                    controller.selectedPeriod.value = 'Week';
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
