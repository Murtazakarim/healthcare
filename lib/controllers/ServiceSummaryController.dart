import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:health_care/appStyles/appColors.dart';
import 'package:health_care/controllers/appointmentController.dart';
import 'package:health_care/controllers/authController.dart';
import 'package:health_care/generated/assets.dart';
import 'package:health_care/routes/routesName.dart';
import 'package:health_care/screens/booking/bookAppointmentScreen.dart';
import 'package:health_care/widgets/customButtonWidget.dart';

import '../models/AppointmentModel.dart';

class ServiceSummaryController extends GetxController {
  var selectedPayment = 'Visa'.obs;
  AuthController authController = Get.find();
  AppointmentController appointmentController = Get.find();


  Future<void> bookAnAppointment()async{
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;
    final random = Random();

    if (user != null) {
      try {
        await _firestore.collection('patients').doc(authController.user!.uid).collection('appointments').add(Appointment(dateOfConsultation: DateTime.now(), serviceCharges: 0.00, tax: 0.00, fees: 50, paymentMethod: selectedPayment.value,
            genderName: appointmentController.selectedChild.value,
            gender:appointmentController.selectedGender.value , number: random.nextInt(100)).toMap());

        Get.offAndToNamed(AppRoutes.appointment);


        // Navigate to the summary screen or show success message
      } catch (e) {
        // Handle errors (e.g., show error message)
        print(e);
      }
    }
  }


}