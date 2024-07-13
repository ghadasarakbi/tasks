import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/splash_controller.dart';

class ErrorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SplashController splashController = Get.find();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Failed to connect to the internet',
            style: TextStyle(fontSize: 18, color: Colors.red),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: splashController.retryFetchingData,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
