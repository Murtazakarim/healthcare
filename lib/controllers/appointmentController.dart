import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:health_care/controllers/authController.dart';

class AppointmentController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var selectedIndex = 0.obs;
  var selectedService = ''.obs;
  var selectedGender = 'Male'.obs;
  var selectedChild = "Murtaza".obs;

  void selectGender(String gender) {

      selectedGender.value = gender;
  }

  AuthController authController = Get.find();




}