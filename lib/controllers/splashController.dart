import 'package:get/get.dart';
import 'package:health_care/routes/routesName.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 5), () {
      Get.offAllNamed(AppRoutes.login);
    });
  }
}