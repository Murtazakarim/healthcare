import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/chatbotModel.dart';
import '../routes/routesName.dart';
import 'authController.dart';

class ChatBotController extends GetxController {
  AuthController controller = Get.find();


  @override
  void onInit() {
    super.onInit();
    deleteCollection();
  }


  Future<void> deleteCollection() async {
    CollectionReference collection = FirebaseFirestore.instance.collection('patients').doc(controller.user!.uid).collection('chat');

    // Get all documents in the collection
    QuerySnapshot snapshot = await collection.get();

    // Delete each document
    for (DocumentSnapshot doc in snapshot.docs) {
      await doc.reference.delete();
    }
  }

  Future<void> sendMessage(String message, bool isBot) async {
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    final chatMessage = ChatMessageBot(
      id: id,
      message: message,
      isBot: isBot,
    );

    await FirebaseFirestore.instance.collection('patients').doc(controller.user!.uid).collection('chat').doc(id).set(chatMessage.toMap());

    if (!isBot) {
      getBotResponse(message);
    }
  }

  Future<void> getBotResponse(String userMessage) async {
    String botMessage;

    // Simple hardcoded responses. You can enhance this to use a real NLP model or service.
    if (userMessage.toLowerCase().contains('hello') || userMessage.toLowerCase().contains('yes')|| userMessage.toLowerCase().contains('No')) {
      botMessage = 'Hello! How can I help you today?';
    } else if (userMessage.toLowerCase().contains('help')) {
      botMessage = 'Sure, I am here to help you. What do you need assistance with?';
    } else {
      botMessage = 'I am sorry, I did not understand that. Can you please rephrase?';
      Get.toNamed(AppRoutes.summary);
    }

    await Future.delayed(const Duration(seconds: 1));  // Simulate a delay for bot response

    await sendMessage(botMessage, true);
  }
}