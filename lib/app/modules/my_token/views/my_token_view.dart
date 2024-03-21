import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_token_controller.dart';

class MyTokenView extends GetView<MyTokenController> {
  const MyTokenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyTokenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MyTokenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
