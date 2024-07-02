import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:health_care/appStyles/appColors.dart';
import 'package:health_care/controllers/appointmentController.dart';

import '../../generated/assets.dart';
import 'homePage.dart';

class AppointmentBookingScreen extends StatefulWidget {
  const AppointmentBookingScreen({super.key});

  @override
  _AppointmentBookingScreenState createState() => _AppointmentBookingScreenState();
}

class _AppointmentBookingScreenState extends State<AppointmentBookingScreen> {
  AppointmentController appointmentController = Get.put( AppointmentController());

  final List<Widget> _widgetOptions = [
    const HomePage(),
    const Center(child: Text('Chats')),
    const Center(child: Text('Profile Page')),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(Assets.imgHome,width: 24,height: 24,color: AppStyles.greyShadeColor,),
            label: 'Home',
            activeIcon: Image.asset(Assets.imgHome,width: 24,height: 24,),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(Assets.imgMessages,width: 24,height: 24,),
            label: 'Chats',
            activeIcon: Image.asset(Assets.imgMessages,width: 24,height: 24,color: AppStyles.primary,),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(Assets.imgProfile,width: 24,height: 24,),
            label: 'Profile',
            activeIcon: Image.asset(Assets.imgProfile,width: 24,height: 24,color: AppStyles.primary,),
          ),
        ],
        currentIndex: appointmentController.selectedIndex.value,
        selectedItemColor: AppStyles.primary,
        iconSize: 24,
        backgroundColor: Colors.white,
        unselectedLabelStyle:AppStyles.kTextStyleSize14.copyWith(fontSize: 12,color: AppStyles.greyShadeColor) ,
        selectedLabelStyle: AppStyles.kTextStyleSize14.copyWith(fontSize: 12,fontWeight: FontWeight.w600,color: AppStyles.primary),
        onTap: _onItemTapped,
      ),
      body: Obx(()=> _widgetOptions.elementAt(appointmentController.selectedIndex.value)),
    );
  }

  void _onItemTapped(int index) {
      appointmentController.selectedIndex.value = index;
  }
}
