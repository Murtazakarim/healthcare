import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:health_care/appStyles/appColors.dart';
import 'package:health_care/generated/assets.dart';
import 'package:health_care/widgets/customButtonWidget.dart';
void showCustomDialog({required Function onClick}) {
  Get.dialog(
    Align(
      alignment: Alignment.center,
      child: FractionallySizedBox(
        widthFactor: 0.8, // You can adjust this value to control the width
        child: Container(
          padding: const EdgeInsets.all(20.0), // Optional: Add padding to the container
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(Assets.imgDialogSign),
              const SizedBox(height: 20),
              Text(
                "Booked Successful!",
                style: AppStyles.kTextStyleSize14.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                "We will give you a short call for confirmation and then we will schedule a booking call with you.",
                style: AppStyles.kTextStyleSize14.copyWith(
                  color: AppStyles.bodyTextColor,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center, // Optional: Center align the text
              ),
              const SizedBox(height: 15),
              CustomButtonWidget(
                text: "Done",
                onTap: () =>onClick(),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}