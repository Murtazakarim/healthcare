class ChatMessageBot {
  final String id;
  final String message;
  final bool isBot;

  ChatMessageBot({
    required this.id,
    required this.message,
    required this.isBot,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'message': message,
      'isBot': isBot,
    };
  }

  factory ChatMessageBot.fromMap(Map<String, dynamic> map) {
    return ChatMessageBot(
      id: map['id'] as String,
      message: map['message'] as String,
      isBot: map['isBot'] as bool,
    );
  }
}
