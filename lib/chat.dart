import 'package:flutter/material.dart';

class ChatBotScreen extends StatefulWidget {
  final String diseaseName;

  const ChatBotScreen({Key? key, required this.diseaseName}) : super(key: key);

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final List<Map<String, String>> messages = [];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    final userMessage = _controller.text.trim();
    if (userMessage.isEmpty) return;

    setState(() {
      messages.add({"role": "user", "message": userMessage});
    });

    _controller.clear();
    _botReply(userMessage);
  }

  void _botReply(String userMessage) {
    String reply =
        "لم أفهم سؤالك. من فضلك اسأل عن الأعراض أو العلاج أو الوقاية.";

    if (userMessage.contains('علاج')) {
      reply = _getTreatment(widget.diseaseName);
    } else if (userMessage.contains('أعراض')) {
      reply = _getSymptoms(widget.diseaseName);
    } else if (userMessage.contains('وقاية')) {
      reply = _getPrevention(widget.diseaseName);
    }

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        messages.add({"role": "bot", "message": reply});
      });
    });
  }

  String _getSymptoms(String disease) {
    if (disease.contains("الحمى القلاعية")) {
      return "الأعراض تشمل ارتفاع درجة الحرارة وتقرحات في الفم والأقدام.";
    }
    // ممكن تضيف أمراض أخرى هنا
    return "لم يتم تحديد أعراض لهذا المرض.";
  }

  String _getTreatment(String disease) {
    if (disease.contains("الحمى القلاعية")) {
      return "العلاج يتضمن دعم الحيوان بالسوائل والمضادات الحيوية لتجنب العدوى الثانوية.";
    }
    return "لم يتم تحديد علاج لهذا المرض.";
  }

  String _getPrevention(String disease) {
    if (disease.contains("الحمى القلاعية")) {
      return "الوقاية تكون عبر التطعيم الدوري وعزل المصابين.";
    }
    return "لم يتم تحديد طرق وقاية لهذا المرض.";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مساعد الأمراض الذكي'),
        backgroundColor: const Color(0xFF2E7D32),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final isUser = messages[index]["role"] == "user";
                return Align(
                  alignment:
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.green[100] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      messages[index]["message"]!,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "اكتب رسالتك هنا...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _sendMessage,
                  icon: const Icon(Icons.send, color: Color(0xFF2E7D32)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
