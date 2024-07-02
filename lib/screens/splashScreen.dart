import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_care/appStyles/appColors.dart';

import '../controllers/splashController.dart';
import '../generated/assets.dart';
class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
   final SplashController splashController = Get.put(SplashController());
    return  Scaffold(
      backgroundColor: AppStyles.primary,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(Assets.imgLogo),
            const SizedBox(height: 10,),
            Text(
              'Healthcare',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
