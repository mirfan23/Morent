// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morent/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> register(String emailRegister, String passwordRegister) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: emailRegister,
        password: passwordRegister,
      );
      Get.defaultDialog(
        title: 'Register Berhasil',
        onConfirm: () => Get.back(),
      );
      emailController.clear();
      passwordController.clear();
      Get.offAllNamed(AppPages.LOGIN);
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
