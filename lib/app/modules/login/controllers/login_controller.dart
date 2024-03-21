// ignore_for_file: unused_local_variable

import 'package:morent/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
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

  Future<void> loginWithEmailAndPassword(
      String emailRegister, String passwordRegister) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: emailRegister,
        password: passwordRegister,
      );
      Get.defaultDialog(
        title: 'Login Berhasil',
        onConfirm: () => Get.back(),
      );
      emailController.clear();
      passwordController.clear();
      Get.offAllNamed(AppPages.DASHBOARD);
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  handleAuth() {
    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          Future.microtask(() {
            if (snapshot.hasData) {
              Get.offAllNamed(AppPages.DASHBOARD);
            } else {
              Get.offAllNamed(AppPages.LOGIN);
            }
          });
          return const SizedBox();
        }
      },
    );
  }
}
