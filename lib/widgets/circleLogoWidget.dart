import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:health_care/appStyles/appColors.dart';
import 'package:health_care/generated/assets.dart';
class CircleLogo extends StatelessWidget {
  const CircleLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 76.62,
      height: 76.62,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0x0D1F4E3C),
        boxShadow: [
          BoxShadow(
            color: Color(0x0D1F4E3C),
            blurRadius: 10,
            spreadRadius: 5,
            offset: Offset(0, 5), // Adjust the offset as needed
          ),
        ],
      ),
      child: Center(
        child: Container(
          height: 60.9,
          width: 60.9,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppStyles.primary,
          ),
          child: Center(
            child: Image.asset(Assets.imgLogo,width:36 ,height: 36,),
          ),
        ),
      ),
    );
  }
}




