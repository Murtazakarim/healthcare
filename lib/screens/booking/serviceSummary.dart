import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_care/appStyles/appColors.dart';
import 'package:health_care/controllers/ServiceSummaryController.dart';
import 'package:health_care/generated/assets.dart';
import 'package:health_care/widgets/customButtonWidget.dart';
import 'package:health_care/widgets/showDialogWidget.dart';

import '../../widgets/customRadioButton.dart';
class ServiceSummary extends StatefulWidget {
  const ServiceSummary({super.key});

  @override
  State<ServiceSummary> createState() => _ServiceSummaryState();
}

class _ServiceSummaryState extends State<ServiceSummary> {
  ServiceSummaryController controller = Get.put(ServiceSummaryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppStyles.primary,
        elevation: 1,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
              onTap: (){
                Get.back();
              },
              child: Image.asset(Assets.imgBack,width: 32,height: 32,)),
        ),
        leadingWidth: 60,
        title: Text("Service Summary",style: AppStyles.kTextStyleSize14.copyWith(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 18),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(
              ()=> Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        width: Get.width,
                        height: 44,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Image.asset(Assets.imgHeart,width: 36,height: 36,),
                            const SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Healthcare Consultation",style: AppStyles.kTextStyleSize14.copyWith(fontWeight: FontWeight.w700,color: AppStyles.blackColor),),
                                Text("Lorem ipsum dolor ist",style: AppStyles.kTextStyleSize14.copyWith(fontSize:12,color: AppStyles.bodyTextColor),),
                              ],
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("\$50.00",style: AppStyles.kTextStyleSize14.copyWith(fontSize: 18,fontWeight: FontWeight.w700),textAlign: TextAlign.end,),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(thickness: 1,color: AppStyles.dividerColor,),
                      ExpansionTile(
                        backgroundColor: Colors.white,
                        dense: true,
                        collapsedShape:const RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.white,
                          ) ,),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(
                              color: Colors.white,
                            )
                        ),
                        collapsedBackgroundColor: Colors.white,
                        minTileHeight: 30,
                        title: Text("Lorem ipsum dolor ist amet?",style: AppStyles.kTextStyleSize14.copyWith(fontWeight: FontWeight.w600,color: AppStyles.blackColor),),
                        children: [
                          ListTile(
                            title: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',style: AppStyles.kTextStyleSize14.copyWith(color: const Color(0xff767676),fontSize: 12,),),
                          ),
                        ],
                      ),
                      const Divider(thickness: 1,color: AppStyles.dividerColor,),
                      ExpansionTile(
                        backgroundColor: Colors.white,
                        dense: true,
                        collapsedShape:const RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.white,
                          ) ,),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(
                              color: Colors.white,
                            )
                        ),
                        collapsedBackgroundColor: Colors.white,
                        minTileHeight: 30,
                        title: Text("Lorem ipsum dolor ist amet?",style: AppStyles.kTextStyleSize14.copyWith(fontWeight: FontWeight.w600,color: AppStyles.blackColor),),
                        children: [
                          ListTile(
                            title: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',style: AppStyles.kTextStyleSize14.copyWith(color: const Color(0xff767676),fontSize: 12,),),
                          ),
                        ],
                      ),
                      const Divider(thickness: 1,color: AppStyles.dividerColor,),
                      ExpansionTile(
                        backgroundColor: Colors.white,
                        dense: true,
                        collapsedShape:const RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.white,
                          ) ,),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(
                              color: Colors.white,
                            )
                        ),
                        collapsedBackgroundColor: Colors.white,
                        minTileHeight: 30,
                        title: Text("Lorem ipsum dolor ist amet?",style: AppStyles.kTextStyleSize14.copyWith(fontWeight: FontWeight.w600,color: AppStyles.blackColor),),
                        children: [
                          ListTile(
                            title: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',style: AppStyles.kTextStyleSize14.copyWith(color: const Color(0xff767676),fontSize: 12,),),
                          ),
                        ],
                      ),
                      const Divider(thickness: 1,color: AppStyles.dividerColor,),
                      ExpansionTile(
                        backgroundColor: Colors.white,
                        dense: true,
                        collapsedShape:const RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.white,
                          ) ,),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(
                              color: Colors.white,
                            )
                        ),
                        collapsedBackgroundColor: Colors.white,
                        minTileHeight: 30,
                        title: Text("Phone Number",style: AppStyles.kTextStyleSize14.copyWith(fontWeight: FontWeight.w600,color: AppStyles.blackColor),),
                        children: [
                          ListTile(
                            title: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',style: AppStyles.kTextStyleSize14.copyWith(color: const Color(0xff767676),fontSize: 12,),),
                          ),
                        ],
                      ),
                      const Divider(thickness: 1,color: AppStyles.dividerColor,),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Service Summary",style: AppStyles.kTextStyleSize14.copyWith(fontWeight: FontWeight.w600,fontSize: 16),textAlign: TextAlign.start,),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Date of Consultation",style: AppStyles.kTextStyleSize14.copyWith(color: AppStyles.bodyTextColor),textAlign: TextAlign.start,),
                    Text("June 23, 2023 12:00 PM",style: AppStyles.kTextStyleSize14.copyWith(color: AppStyles.bodyTextColor),textAlign: TextAlign.start,),
                  ],
                ),
        
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Service Charges",style: AppStyles.kTextStyleSize14.copyWith(color: AppStyles.bodyTextColor),textAlign: TextAlign.start,),
                    Text("\$0.00",style: AppStyles.kTextStyleSize14.copyWith(color: AppStyles.bodyTextColor),textAlign: TextAlign.start,),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tax",style: AppStyles.kTextStyleSize14.copyWith(color: AppStyles.bodyTextColor),textAlign: TextAlign.start,),
                    Text("\$0.00",style: AppStyles.kTextStyleSize14.copyWith(color: AppStyles.bodyTextColor),textAlign: TextAlign.start,),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Payment Method",style: AppStyles.kTextStyleSize14.copyWith(fontWeight: FontWeight.w600,fontSize: 16),textAlign: TextAlign.start,),
                  ],
                ),
                CustomRadioButton(
                  value: 'Visa',
                  groupValue: controller.selectedPayment.value,
                  onChanged: (value) {
        
                    controller.selectedPayment.value = value;
        
                  },
                  icon: Assets.imgVisaLogo,
                  label: 'Visa',
                ),
                CustomRadioButton(
                  value: 'PayPal',
                  groupValue: controller.selectedPayment.value,
                  onChanged: (value) {
        
                    controller.selectedPayment.value = value;
        
                  },
                  icon: Assets.imgPayPal,
                  label: 'PayPal',
                ),
                CustomRadioButton(
                  value: 'Apple Pay',
                  groupValue: controller.selectedPayment.value,
                  onChanged: (value) {
                      controller.selectedPayment.value = value;
        
                  },
                  icon: Assets.imgApplePay,
                  label: 'Apple Pay',
                ),
                const SizedBox(height: 10,),
                
                CustomButtonWidget(text: 'Confirm', onTap: (){
                  showCustomDialog(onClick: (){
                    controller.bookAnAppointment();
                  });
                },btnColor: AppStyles.primary,textColor: Colors.white,),
        
        
              ],
            ),
          ),
        ),
      ),
    );
  }
}





