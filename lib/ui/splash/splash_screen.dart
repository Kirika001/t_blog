import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_jccapi/ui/splash/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) => Scaffold(
          body: Center(
            child: Icon(Icons.article_outlined),
          ),
        ));
  }
}