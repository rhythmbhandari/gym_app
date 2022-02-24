import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/check_in_controller.dart';

class CheckInView extends GetView<CheckInController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckInView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CheckInView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
