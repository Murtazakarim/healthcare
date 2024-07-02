import 'package:flutter/material.dart';
import 'package:custom_check_box/custom_check_box.dart';

import '../appStyles/appColors.dart';
class CustomCheckBoxWidget extends StatefulWidget {
  final Function(bool) onCheck;
  final String text;
  CustomCheckBoxWidget({super.key,required this.text,required this.onCheck});

  @override
  State<CustomCheckBoxWidget> createState() => _CustomCheckBoxWidgetState();
}

class _CustomCheckBoxWidgetState extends State<CustomCheckBoxWidget> {
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
       CustomCheckBox(
          value: rememberMe,
          borderWidth: 1,
          borderRadius: 3,
          borderColor: Colors.white,
          checkBoxSize: 20,
          checkedFillColor: AppStyles.primary,
          onChanged: (bool value) {
            setState(() {
              rememberMe = value;
              widget.onCheck(rememberMe);
            });


          },
        ),
        const SizedBox(width: 5,),
        Text(widget.text,style: AppStyles.kTextStyleSize14,),
      ],
    );
  }
}
