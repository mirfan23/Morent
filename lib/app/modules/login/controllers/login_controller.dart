// ignore_for_file: unused_local_variable

import 'package:hive/hive.dart';
import 'package:morent/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late Box<String> hiveBox;

  @override
  void onInit() async {
    super.onInit();
    await openHiveBox();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    hiveBox.close();
    super.dispose();
  }

  Future<void> openHiveBox() async {
    hiveBox = await Hive.openBox<String>('userBox');
  }

  Future<void> loginWithEmailAndPassword(
      String emailRegister, String passwordRegister) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: emailRegister,
        password: passwordRegister,
      );
      String uid = userCredential.user!.uid;
      await hiveBox.put('uid', uid.hashCode.toString());
      Get.defaultDialog(
        title: 'Login Berhasil',
        content: const Text(""),
        onConfirm: () => Get.offAllNamed(AppPages.DASHBOARD),
      );
      emailController.clear();
      passwordController.clear();
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  Future<void> checkLoginStatus() async {
    String? uid = hiveBox.get('uid');
    if (uid != null) {
      bool userExist = await isUserExist(uid);
      if (userExist) {
        Get.offAllNamed(AppPages.DASHBOARD);
      } else {
        hiveBox.delete('uid');
        Get.offAllNamed(AppPages.LOGIN);
      }
    } else {
      Get.offAllNamed(AppPages.LOGIN);
    }
  }

  Future<bool> isUserExist(String uid) async {
    try {
      User? user = await FirebaseAuth.instance
          .userChanges()
          .firstWhere((element) => element?.uid == uid);

      return user != null;
    } catch (e) {
      print('Error checking user $e');
      return false;
    }
  }
}
