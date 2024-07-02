import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_care/appStyles/appColors.dart';
import 'package:health_care/generated/assets.dart';
import 'package:health_care/routes/routesName.dart';
class SeekCareScreen extends StatelessWidget {
  const SeekCareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text("Seek Care",style: AppStyles.kTextStyleSize14.copyWith(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 18),),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
            child: Image.asset(Assets.imgSearch,width: 32,height: 32,),
          ),
        ],
      ),
      backgroundColor: AppStyles.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 125,
                    padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(Assets.imgPhone,width: 26,height: 26,),
                        const Spacer(),
                        Text("Renew Prescription",style: AppStyles.kTextStyleSize14.copyWith(fontSize: 18,fontWeight: FontWeight.w600,color: AppStyles.blackColor),),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: Container(
                    height: 125,
                    padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(Assets.imgSmile,width: 24,height: 24,),
                        const Spacer(),
                        Text("Children",style: AppStyles.kTextStyleSize14.copyWith(fontSize: 18,fontWeight: FontWeight.w600,color: AppStyles.blackColor),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 125,
                    padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(Assets.imgBag,width: 26,height: 26,),
                        const Spacer(),
                        Text("Chlamydia",style: AppStyles.kTextStyleSize14.copyWith(fontSize: 18,fontWeight: FontWeight.w600,color: AppStyles.blackColor),),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Get.toNamed(AppRoutes.bot);
                    },
                    child: Container(
                      height: 125,
                      padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(Assets.imgOtherIssue,width: 24,height: 24,),
                          const Spacer(),
                          Text("Other health issues",style: AppStyles.kTextStyleSize14.copyWith(fontSize: 18,fontWeight: FontWeight.w600,color: AppStyles.blackColor),),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
