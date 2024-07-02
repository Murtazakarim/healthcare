import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../appStyles/appColors.dart';
class CustomButtonWidget extends StatelessWidget {
  String text;
  double height;
  Function onTap;
  double margin;
  bool disable;
  Color btnColor;
  Color textColor;
  CustomButtonWidget({Key? key,required this.text,this.btnColor = AppStyles.secondaryColor,this.textColor = AppStyles.primary,this.height=50,required this.onTap,this.margin =0,this.disable = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onTap(),
      child: Container(
        height: height,
        margin: EdgeInsets.symmetric(horizontal: margin),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:disable ? Colors.white : btnColor,
          border: Border.all(
            color: btnColor,
          )
        ),
        child: Text(
          text,
          style:  AppStyles.kTextStyleSize14.copyWith(
            color: disable ? AppStyles.secondaryColor : textColor,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
