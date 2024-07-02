import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_care/appStyles/appColors.dart';
import 'package:health_care/generated/assets.dart';
class SocialButtonWidget extends StatelessWidget {
  final String iconPath;
  final String text;
  final Function callback;
  const SocialButtonWidget({super.key,required this.iconPath,required this.text,required this.callback});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        height: 44,
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Image.asset(iconPath,width: 20,height: 20,),
          const SizedBox(width: 5,),
          Text(text,style: AppStyles.kTextStyleSize14.copyWith(color: const Color(0xff2C2C2C)),)
        ],),
        onPressed: ()=>callback());
  }
}
