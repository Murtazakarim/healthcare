import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../appStyles/appColors.dart';
import '../../controllers/authController.dart';
import '../../generated/assets.dart';
import '../../utils/validation.dart';
import '../../widgets/TextFormFieldWidget.dart';
import '../../widgets/circleLogoWidget.dart';
import '../../widgets/customButtonWidget.dart';
import '../../widgets/customCheckBox.dart';
import '../../widgets/socialButtonWidget.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _registerFormKey = GlobalKey<FormState>();
  AuthController authController = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppStyles.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _registerFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleLogo(),
                  const SizedBox(height: 20,),
                  Text("Register Now!", style: AppStyles.kTextStyleSize14.copyWith( fontSize: 24, fontWeight: FontWeight.w600),),
                  const SizedBox(height: 8),
                  Text("Please register to explore amazing features.", style: AppStyles.kTextStyleSize14.copyWith( color: AppStyles.greyColor),),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(child: SocialButtonWidget(callback: (){},iconPath: Assets.imgGoogle,text: "Google",)),
                      const SizedBox(width: 10,),
                      Expanded(child: SocialButtonWidget(callback: (){},iconPath: Assets.imgApple,text: "Apple",)),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          height: 2,
                          thickness: 2,
                          color: AppStyles.dividerColor,
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Text("or",style: AppStyles.kTextStyleSize14.copyWith(color: const Color(0xff767676)),),
                      const SizedBox(width: 10,),
                      const Expanded(
                        child: Divider(
                          height: 2,
                          thickness: 2,
                          color: AppStyles.dividerColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Full Name",style: AppStyles.kTextStyleSize14.copyWith(fontSize: 16, fontWeight: FontWeight.w600),textAlign: TextAlign.left,),
                      const SizedBox(height: 5),
                      TextFieldWidget(
                        hintText: "your full name",
                        validator: Validator.isValidName, callback: (value) {
                        authController.fullName.value = value;
                      },
                      ),
                      const SizedBox(height: 10,),
                      Text("Phone Number",style: AppStyles.kTextStyleSize14.copyWith(fontSize: 16, fontWeight: FontWeight.w600),textAlign: TextAlign.left,),
                      const SizedBox(height: 5),
                      IntlPhoneField(
                        decoration:  InputDecoration(
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(15),
                          fillColor: Colors.white,
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppStyles.errorColor,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppStyles.errorColor,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          filled: true,
                          hintText: "your number",
                          hintTextDirection: TextDirection.ltr,
                          hintStyle: AppStyles.kTextStyleSize14grayColor.copyWith(
                            color: AppStyles.lightGreyColor,
          
                          ),
                        ),
                        initialCountryCode: 'PK',
                        validator: Validator().isValidPhoneNumber,
                        onChanged: (phone) {
                          authController.rPhoneNumber.value = phone.completeNumber;
                          print(phone.completeNumber);
                        },
                        flagsButtonPadding: const EdgeInsets.all(10),  // Adjust padding for flag
                        dropdownIconPosition: IconPosition.trailing,  // Dropdown icon position
                        showCountryFlag: true, // Show the flag
                        disableLengthCheck: true,
                      ),
                      const SizedBox(height: 10,),
                      Text("Email Address",style: AppStyles.kTextStyleSize14.copyWith(fontSize: 16, fontWeight: FontWeight.w600),textAlign: TextAlign.left,),
                      const SizedBox(height: 5),
                      TextFieldWidget(
                        hintText: "your email address",
                        validator: Validator.isValidEmail, callback: (value) {
                        authController.rEmail.value = value;
                      },
                      ),
                      const SizedBox(height: 10,),
                      Text("Create Password",style: AppStyles.kTextStyleSize14.copyWith(fontSize: 16, fontWeight: FontWeight.w600),textAlign: TextAlign.left,),
                      const SizedBox(height: 5),
                      TextFieldWidget(
                        hintText: "your password",
                        validator: Validator.isValidPassword, callback: (value) {
                        authController.rPassword.value = value;
                      },
                      ),
          
                    ],
                  ),
                  const SizedBox(height: 30,),

                  CustomCheckBoxWidget(text: "I agree to all Terms & Conditions",onCheck: (value){},),
                  const SizedBox(height: 10,),
                  CustomButtonWidget(text: 'Continue', onTap: (){
                    if (_registerFormKey.currentState!.validate()) {
                      _registerFormKey.currentState!.save();
                      authController.register();
          
                    }
                  },),
                  const SizedBox(height: 10,),
                  GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: Text("Already have an Account? Login",style: AppStyles.kTextStyleSize14.copyWith(color: AppStyles.blackColor,fontWeight: FontWeight.w600),)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
