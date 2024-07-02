import 'package:flutter/material.dart';
import 'package:health_care/appStyles/appColors.dart';
class CustomRadioButton extends StatelessWidget {
  final String value;
  final String groupValue;
  final Function(String) onChanged;
  final String icon;
  final String label;

  const CustomRadioButton({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;

    return GestureDetector(
      onTap: () {
        onChanged(value);
      },
      child: Container(
        height: 55,
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        padding: const EdgeInsets.all(12.0),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
              Container(
                width: 9,
                height: 9,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: isSelected ? AppStyles.primary: const Color(0xffE3E3E3),width: 3),
                  color: isSelected ? AppStyles.primary : Colors.white,
                ),
              ),
            const SizedBox(width: 20,),
            Container(
              width: 65,
                height:35 ,
                decoration: BoxDecoration(
                  color:colorWithCustomOpacity(AppStyles.primary,4.0),
                ),
                child: Image.asset(icon)),
            const SizedBox(width: 16.0),
            Text(
              label,
              style: AppStyles.kTextStyleSize14.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }


  Color colorWithCustomOpacity(Color color, double opacityPercentage) {
    int alpha = calculateAlpha(opacityPercentage / 100);
    return color.withAlpha(alpha);
  }

  int calculateAlpha(double percentage) {
    return (255 * percentage).round();
  }
}