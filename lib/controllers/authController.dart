import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:health_care/appStyles/appColors.dart';
import 'package:health_care/routes/routesName.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? user;
  RxBool rememberMe = false.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString fullName = ''.obs;
  RxString rEmail = ''.obs;
  RxString rPassword = ''.obs;
  RxString rPhoneNumber = ''.obs;


  Future<void> login()async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );

      DocumentSnapshot userDoc = await _firestore.collection('patients').doc(userCredential.user!.uid).get();

      if (userDoc.exists) {
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
        user = userCredential.user;
        print(userData);
        fullName.value = userData["fullName"];
        email.value = userData["email"];
        rEmail.value = userData["email"];
        rPhoneNumber.value = userData["phoneNumber"];
        Get.offAndToNamed(AppRoutes.appointment);
        // Use userData to navigate to the next screen or display information
      }

    }on FirebaseAuthException catch (e) {
      String errorMessage;

      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found for that email.';
          break;
        case 'wrong-password':
          errorMessage = 'Wrong password provided for that user.';
          break;
        case 'email-already-in-use':
          errorMessage = 'The email address is already in use by another account.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is badly formatted.';
          break;
        case 'weak-password':
          errorMessage = 'The password provided is too weak.';
          break;
        case 'invalid-credential':
          errorMessage = 'The credential is incorrect.';
          break;
        default:
          errorMessage = 'An unexpected error occurred ${e.toString()}. Please try again.';
      }

      Get.showSnackbar(GetSnackBar(
        backgroundColor: AppStyles.errorColor,
        duration: const Duration(seconds: 5),
        message: errorMessage,
      ));
      print(e);
    }  catch (e) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: AppStyles.errorColor,
        duration: const Duration(seconds: 5),
        message: e.toString(),
      ));
      // Handle errors (e.g., show error message)
      print(e);
    }
  }


  Future<void> register()async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: rEmail.value,
        password: rPassword.value,
      );

      await _firestore.collection('patients').doc(userCredential.user!.uid).set({
        'fullName': fullName.value,
        'email': rEmail.value,
        'phoneNumber': rPhoneNumber.value,
      });
      Get.offAndToNamed(AppRoutes.appointment);

      // Navigate to the next screen or show success message
    } on FirebaseAuthException catch (e) {
      String errorMessage;

      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found for that email.';
          break;
        case 'wrong-password':
          errorMessage = 'Wrong password provided for that user.';
          break;
        case 'email-already-in-use':
          errorMessage = 'The email address is already in use by another account.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is badly formatted.';
          break;
        case 'weak-password':
          errorMessage = 'The password provided is too weak.';
          break;
        default:
          errorMessage = 'An unexpected error occurred. Please try again.';
      }

      Get.showSnackbar(GetSnackBar(
        backgroundColor: AppStyles.errorColor,
        duration: const Duration(seconds: 5),
        message: errorMessage,
      ));
      print(e);
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: AppStyles.errorColor,
        duration: const Duration(seconds: 5),
        message: e.toString(),
      ));
      // Handle errors (e.g., show error message)
      print(e);
    }
  }
}