import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:morent/app/global_widgets/custom_text_field.dart';
import 'package:morent/app/routes/app_pages.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 0.5.sw,
              ),
              CustomTextField(
                title: 'E-mail',
                hint: 'E-mail',
                textInputType: TextInputType.emailAddress,
                textEditingController: controller.emailController,
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomTextField(
                title: 'Password',
                hint: 'Password',
                obsecureText: true,
                textEditingController: controller.passwordController,
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await controller.register(
                      controller.emailController.text.trim(),
                      controller.passwordController.text.trim(),
                    );
                  } catch (e) {
                    print('Error: $e');
                  }
                },
                child: const Text("Register"),
              ),
              TextButton(
                onPressed: () => Get.toNamed(AppPages.LOGIN),
                child: Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
