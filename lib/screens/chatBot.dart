import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:health_care/appStyles/appColors.dart';
import 'package:health_care/controllers/chatbotController.dart';
import 'package:health_care/models/chatbotModel.dart';
import 'package:health_care/routes/routesName.dart';

import '../generated/assets.dart';

class ChatPageBot extends StatefulWidget {
  @override
  _ChatPageBotState createState() => _ChatPageBotState();
}

class _ChatPageBotState extends State<ChatPageBot> {
  final TextEditingController _messageController = TextEditingController();
  ChatBotController chatBotController = Get.put(ChatBotController());

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
        title: Text("Other Health issues",style: AppStyles.kTextStyleSize14.copyWith(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 18),),
      ),
      body: Column(
        children: [
      Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Today",style: AppStyles.kTextStyleSize14.copyWith(color: const Color(0xff767676)),),
          const SizedBox(height: 10,),
          Row(
            children: [
              Image.asset(Assets.imgProfileChat,width: 44,height: 44,),
              const SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Elsa",style: AppStyles.kTextStyleSize14.copyWith(fontSize: 16,fontWeight: FontWeight.w600),),
                  Text("Digital Assistant",style: AppStyles.kTextStyleSize14.copyWith(color: AppStyles.bodyTextColor),)
                ],
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: Text("If you have severe symptom's with threat to life, 112 or seek emergency care immediately.\n Please answer these questions before an associate takes care of you.",style: AppStyles.kTextStyleSize14.copyWith(color: const Color(0xff646464),fontSize: 16),)),
            ],
          ),
          const SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Do you have a support question?",style: AppStyles.kTextStyleSize14.copyWith(fontSize: 18,fontWeight: FontWeight.w600,color: AppStyles.blackColor),),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.summary);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor:  AppStyles.secondaryColor,
                  side: const BorderSide(
                    color: AppStyles.secondaryColor,
                  ),
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                child: Text(
                  "yes",
                  style: AppStyles.kTextStyleSize14.copyWith(
                    color: AppStyles.blackColor,
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.summary);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Colors.white,
                  side: const BorderSide(
                    color: Colors.white,
                  ),
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                child: Text(
                  "No",
                  style: AppStyles.kTextStyleSize14.copyWith(
                    color: AppStyles.blackColor,
                  ),
                ),
              ),

            ],
          ),

        ],
      ),
    ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('patients').doc(chatBotController.controller.user!.uid).collection('chat').orderBy('id').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const SizedBox();
                }
                final messages = snapshot.data!.docs.map((doc) {
                  return ChatMessageBot.fromMap(doc.data() as Map<String, dynamic>);
                }).toList();
                return ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    return ListTile(
                      title: Align(
                        alignment: message.isBot ? Alignment.centerLeft : Alignment.centerRight,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: message.isBot ? AppStyles.secondaryColor : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(message.message),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      color: AppStyles.backgroundColor,
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: 'Type your message...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white)
                          ),
                          focusedBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.white)
                          ),
                          suffixIcon: Image.asset(Assets.imgFolderOpen),
                          contentPadding: const EdgeInsets.all(10),
                          enabledBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.white)
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppStyles.secondaryColor,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: IconButton(
                      icon: Image.asset(Assets.imgSend),
                      onPressed: () async {
                        final message = _messageController.text.trim();
                        if (message.isNotEmpty) {
                          await chatBotController.sendMessage(message, false);
                          _messageController.clear();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
