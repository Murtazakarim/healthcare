import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:health_care/bindings/AllBindings.dart';
import 'package:health_care/routes/routesName.dart';
import 'package:health_care/screens/authScreens/loginScreen.dart';
import 'package:health_care/screens/authScreens/registerScreen.dart';
import 'package:health_care/screens/booking/seekCareScreen.dart';
import 'package:health_care/screens/booking/serviceSummary.dart';
import 'package:health_care/screens/splashScreen.dart';

import '../screens/booking/bookAppointmentScreen.dart';
import '../screens/chatBot.dart';


appRoutes() => [
      GetPage(
        name: AppRoutes.initial,
        page: () =>  SplashScreen(),
        binding: SplashBinding(),
        middlewares: [MyMiddelware()],
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 400),
      ),
      GetPage(
        name: AppRoutes.login,
        binding: AuthBinding(),
        page: () => LoginScreen(),
        middlewares: [MyMiddelware()],
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 400),
      ),
      GetPage(
        name: AppRoutes.register,
        page: () => RegistrationScreen(),
        binding: AuthBinding(),
        middlewares: [MyMiddelware()],
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 400),
      ),
      GetPage(
        name: AppRoutes.appointment,
        page: () => const AppointmentBookingScreen(),
        binding: AppointmentBinding(),
        middlewares: [MyMiddelware()],
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 400),
      ),
      GetPage(
        name: AppRoutes.seek,
        page: () => const SeekCareScreen(),
        binding: AuthBinding(),
        middlewares: [MyMiddelware()],
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 400),
      ),
  GetPage(
    name: AppRoutes.bot,
    page: () => ChatPageBot(),
    binding: AuthBinding(),
    middlewares: [MyMiddelware()],
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 400),
  ),
  GetPage(
    name: AppRoutes.summary,
    page: () => const ServiceSummary(),
    binding: AuthBinding(),
    middlewares: [MyMiddelware()],
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 400),
  ),
    ];

class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    if (kDebugMode) {
      print(page?.name);
    }
    return super.onPageCalled(page);
  }
}
