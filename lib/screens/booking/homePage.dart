import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_care/appStyles/appColors.dart';
import 'package:health_care/controllers/appointmentController.dart';
import 'package:health_care/generated/assets.dart';
import 'package:health_care/models/AppointmentModel.dart';
import 'package:health_care/routes/routesName.dart';
import 'package:health_care/widgets/customButtonWidget.dart';
import 'package:intl/intl.dart';

import '../../widgets/genderButton.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppointmentController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(width: Get.width,height: Get.height * 0.3 + 10,
            color: AppStyles.primary,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(Assets.imgHandIcon),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Hey ${capitalizeFirstLetter(controller.authController.fullName.value)},",style: GoogleFonts.tiroKannada(
                        fontSize: 35.95,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        height: 37.73 / 35.95,
                        letterSpacing: -0.7,
                      ),),
                      const Spacer(),
                      Image.asset(Assets.imgBell,width: 34,height: 34,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("How can we help you today?",style: AppStyles.kTextStyleSize14.copyWith(fontSize: 17.97,fontWeight: FontWeight.w500,color: Colors.white,height: 37.93 / 17.97,),),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  CustomButtonWidget(text: "Seek care now", onTap: (){
                    Get.bottomSheet(SizedBox(
                      width: Get.width,
                      height: Get.height * 0.4,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(children: [
                          Text("Select Type",style: AppStyles.kTextStyleSize14.copyWith(fontSize: 18,fontWeight: FontWeight.w600,color: AppStyles.blackColor),textAlign: TextAlign.center,),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Select Child",style: AppStyles.kTextStyleSize14.copyWith(fontSize: 16,color: AppStyles.blackColor,fontWeight: FontWeight.w600),textAlign: TextAlign.start,)
                            ],
                          ),
                          const SizedBox(height: 5,),
                          Obx(
                            ()=> Container(
                              height: 50,
                              padding: const EdgeInsets.symmetric(horizontal: 14,vertical:13 ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: const Color(0xffE3E3E3)),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: controller.selectedChild.value,
                                  isExpanded: true,
                                  isDense: true,
                                  dropdownColor: Colors.white,
                                  menuMaxHeight: 150,
                                  onChanged: (String? newValue) {
                                    controller.selectedChild.value = newValue!;
                                                                },
                                  items: ["Murtaza","Altemash","Sunny"].map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value,style: AppStyles.kTextStyleSize14.copyWith(color: AppStyles.greyShadeColor),),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Select Gender",style: AppStyles.kTextStyleSize14.copyWith(fontSize: 16,color: AppStyles.blackColor,fontWeight: FontWeight.w600),textAlign: TextAlign.start,)
                            ],
                          ),
                          const SizedBox(height: 5,),
                          Obx(
                            ()=> Row(children: [
                              GenderButton(
                                gender: 'Male',
                                isSelected: controller.selectedGender.value == 'Male',
                                onTap: controller.selectGender,
                                path: Assets.imgMale,
                              ),
                              const SizedBox(width: 10),
                              GenderButton(
                                gender: 'Female',
                                path: Assets.imgFemale,
                                isSelected: controller.selectedGender.value == 'Female',
                                onTap: controller.selectGender,
                              ),
                              const SizedBox(width: 10),
                              GenderButton(
                                gender: 'Child',
                                path: Assets.imgChild,
                                isSelected: controller.selectedGender.value == 'Child',
                                onTap: controller.selectGender,
                              ),
                            ],),
                          ),
                          const SizedBox(height: 10,),
                          CustomButtonWidget(text: "Confirm", onTap: (){
                            Get.toNamed(AppRoutes.seek);
                          }),

                        ],),
                      ),
                    ),backgroundColor: Colors.white,shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.white)
                    ));
                  },height: 55,),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Your Appointments",style: AppStyles.kTextStyleSize14.copyWith(fontSize: 18,fontWeight: FontWeight.w700,color: AppStyles.blackColor),),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                height: 110,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('patients').doc(controller.authController.user!.uid).collection('appointments').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(child: Text('No data found'));
                    }
                    final docs = snapshot.data!.docs;


                    return ListView.builder(
                      itemCount: docs.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final data = docs[index].data() as Map<String, dynamic>;
                        Appointment appointment = Appointment.fromMap(data);

                        return Container(width:250 ,height:100 ,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(Assets.imgTimerStart),
                                    const SizedBox(width: 5,),
                                    Expanded(child: Text("You are number ${appointment.number} in queue. ",style: AppStyles.kTextStyleSize14.copyWith(fontSize: 16,fontWeight: FontWeight.w600,color: AppStyles.primary),)),
                                  ],
                                ),
                                const SizedBox(height: 4,),
                                Row(
                                  children: [
                                    Text("Please wait for your call.",style: AppStyles.kTextStyleSize14.copyWith(fontSize: 12,color: AppStyles.bodyTextColor),)
                                  ],
                                ),
                                const SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Expanded(child: Text(DateFormat('MMMM dd, yyyy - hh:mm a').format(appointment.dateOfConsultation),style: AppStyles.kTextStyleSize14.copyWith(fontSize: 12,color: AppStyles.blackColor),)),
                                  ],
                                )

                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Frequently asked questions",style: AppStyles.kTextStyleSize14.copyWith(fontSize: 18,fontWeight: FontWeight.w700,color: AppStyles.blackColor),),
                    ],
                  ),
                   const SizedBox(height: 10,),
                   Expanded(
                     child: ListView.builder(
                       scrollDirection: Axis.vertical,
                         itemCount: 3,
                         shrinkWrap: true,
                         itemBuilder: (ctx,index){
                       return Padding(
                         padding: const EdgeInsets.symmetric(vertical: 8.0),
                         child: ExpansionTile(
                           backgroundColor: Colors.white,
                           collapsedShape:RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(8),
                             side: const BorderSide(
                               color: Colors.white,
                             ) ,),
                           shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(8),
                               side: const BorderSide(
                                 color: Colors.white,
                               )
                           ),
                           collapsedBackgroundColor: Colors.white,
                           title: Text("What is Healthcare?",style: AppStyles.kTextStyleSize14.copyWith(fontWeight: FontWeight.w600,color: AppStyles.blackColor),),
                           children: [
                             ListTile(
                               title: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',style: AppStyles.kTextStyleSize14.copyWith(color: const Color(0xff767676),fontSize: 12,),),
                             ),
                           ],
                         ),
                       );
                     }),
                   ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


String capitalizeFirstLetter(String input) {
  if (input.isEmpty) return input;
  return input.split(' ').map((word) {
    if (word.isEmpty) return word;
    return word[0].toUpperCase() + word.substring(1).toLowerCase();
  }).join(' ');
}