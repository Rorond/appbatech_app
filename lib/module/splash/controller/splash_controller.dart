import 'package:appbatech_app/core.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  SplashView? view;

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2))
        .then((value) => Get.offAll(const UserView()));
    super.onInit();
  }
}
