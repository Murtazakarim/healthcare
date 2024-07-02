import 'package:flutter/material.dart';
import 'package:health_care/appStyles/appColors.dart';
class GenderButton extends StatelessWidget {
  final String gender;
  final bool isSelected;
  final String path;
  final Function(String) onTap;

  const GenderButton({
    required this.gender,
    required this.path,
    required this.isSelected,
    required this.onTap,

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap(gender),
      style: ElevatedButton.styleFrom(
        foregroundColor: isSelected ? Colors.white : Colors.black, backgroundColor: isSelected ? AppStyles.secondaryColor : Colors.white,
        side: BorderSide(
          color: isSelected ? AppStyles.secondaryColor : const Color(0xffE3E3E3),
        ),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
      ),
      child: Row(
        children: [
          Image.asset(path,width: 16,height: 16,),
          const SizedBox(width: 5,),
          Text(
            gender,
            style: AppStyles.kTextStyleSize14.copyWith(
              color: AppStyles.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}

