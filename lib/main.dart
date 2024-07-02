import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_care/appStyles/appColors.dart';
import 'package:health_care/controllers/authController.dart';
import 'package:health_care/routes/approutes.dart';
import 'package:health_care/routes/routesName.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Health Care',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppStyles.primary,
            primary: AppStyles.primary,
            onSecondary: AppStyles.secondaryColor,
            surface: AppStyles.backgroundColor,
        ),
        fontFamily: "Urbanist",
        useMaterial3: true,
      ),
      getPages: appRoutes(),
      initialRoute: AppRoutes.initial,
    );
  }
}

