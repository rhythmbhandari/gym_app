import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/gym_controller.dart';

class GymView extends GetView<GymController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GymView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'GymView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
