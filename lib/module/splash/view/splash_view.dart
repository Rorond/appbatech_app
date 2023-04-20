import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../controller/splash_controller.dart';
import 'package:appbatech_app/core.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
            body: Center(
          child: LoadingAnimationWidget.threeArchedCircle(
            color: const Color(0xFFFFB901),
            size: 50,
          ),
        ));
      },
    );
  }
}
