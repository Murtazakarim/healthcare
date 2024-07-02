import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_care/appStyles/appColors.dart';
import 'package:health_care/controllers/authController.dart';
import 'package:health_care/generated/assets.dart';
import 'package:health_care/routes/routesName.dart';
import 'package:health_care/utils/validation.dart';
import 'package:health_care/widgets/customButtonWidget.dart';
import 'package:health_care/widgets/customCheckBox.dart';
import '../../widgets/TextFormFieldWidget.dart';
import '../../widgets/circleLogoWidget.dart';
import '../../widgets/socialButtonWidget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  AuthController authController = Get.put(AuthController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppStyles.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const CircleLogo(),
                const SizedBox(height: 20,),
                Text("Welcome Back!", style: AppStyles.kTextStyleSize14.copyWith( fontSize: 24, fontWeight: FontWeight.w600),),
                const SizedBox(height: 8),
                Text("Please enter your credentials to login.", style: AppStyles.kTextStyleSize14.copyWith( color: AppStyles.greyColor),),
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
                    Text("Email/Phone Number",style: AppStyles.kTextStyleSize14.copyWith(fontSize: 16, fontWeight: FontWeight.w600),textAlign: TextAlign.left,),
                    const SizedBox(height: 5),
                    TextFieldWidget(
                      hintText: "your email/phone number",
                      validator: Validator.isValidEmail, callback: (value) {
                      authController.email.value = value;
                    },
                    ),
                    const SizedBox(height: 10,),
                    Text("Password",style: AppStyles.kTextStyleSize14.copyWith(fontSize: 16, fontWeight: FontWeight.w600),textAlign: TextAlign.left,),
                    const SizedBox(height: 5),
                    TextFieldWidget(
                      hintText: "your password",
                      validator: Validator.isValidPassword, callback: (value) {
                      authController.password.value = value;
                    },
                    ),
                    const SizedBox(height: 8,),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Forgot password",style: AppStyles.kTextStyleSize14.copyWith(color: AppStyles.primary)),
                      ],
                    ),

                  ],
                ),
                const Spacer(),
                CustomCheckBoxWidget(text: "Remember me",onCheck: (value){},),
                const SizedBox(height: 10,),
                CustomButtonWidget(text: 'Login', onTap: (){
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    authController.login();

                  }
                },),
                const SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(AppRoutes.register);
                  },
                    child: Text("Don’t have an Account? Register",style: AppStyles.kTextStyleSize14.copyWith(color: AppStyles.blackColor,fontWeight: FontWeight.w600),))

              ],
            ),
          ),
        ),
      ),
    );
  }
}
