import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/gym_map_controller.dart';

class GymMapView extends GetView<GymMapController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GymMapView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'GymMapView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
