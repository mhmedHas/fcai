// // import 'package:flutter/material.dart';

// // class ChatBotScreen extends StatefulWidget {
// //   var diseaseName;

// //   ChatBotScreen({super.key, String? diseaseName});

// //   @override
// //   State<ChatBotScreen> createState() => _ChatBotScreenState();
// // }

// // class _ChatBotScreenState extends State<ChatBotScreen> {
// //   final List<Map<String, String>> messages = [];
// //   final TextEditingController _controller = TextEditingController();

// //   void _sendMessage() {
// //     final userMessage = _controller.text.trim();
// //     if (userMessage.isEmpty) return;

// //     setState(() {
// //       messages.add({"role": "user", "message": userMessage});
// //     });

// //     _controller.clear();
// //     _botReply(userMessage);
// //   }

// //   void _botReply(String userMessage) {
// //     String reply =
// //         "لم أفهم سؤالك. من فضلك اسأل عن الأعراض أو العلاج أو الوقاية.";

// //     if (userMessage.contains('علاج')) {
// //       reply = _getTreatment(widget.diseaseName);
// //     } else if (userMessage.contains('أعراض')) {
// //       reply = _getSymptoms(widget.diseaseName);
// //     } else if (userMessage.contains('وقاية')) {
// //       reply = _getPrevention(widget.diseaseName);
// //     }

// //     Future.delayed(const Duration(milliseconds: 500), () {
// //       setState(() {
// //         messages.add({"role": "bot", "message": reply});
// //       });
// //     });
// //   }

// //   String _getSymptoms(String disease) {
// //     if (disease.contains("الحمى القلاعية")) {
// //       return "الأعراض تشمل ارتفاع درجة الحرارة وتقرحات في الفم والأقدام.";
// //     }
// //     // ممكن تضيف أمراض أخرى هنا
// //     return "لم يتم تحديد أعراض لهذا المرض.";
// //   }

// //   String _getTreatment(String disease) {
// //     if (disease.contains("الحمى القلاعية")) {
// //       return "العلاج يتضمن دعم الحيوان بالسوائل والمضادات الحيوية لتجنب العدوى الثانوية.";
// //     }
// //     return "لم يتم تحديد علاج لهذا المرض.";
// //   }

// //   String _getPrevention(String disease) {
// //     if (disease.contains("الحمى القلاعية")) {
// //       return "الوقاية تكون عبر التطعيم الدوري وعزل المصابين.";
// //     }
// //     return "لم يتم تحديد طرق وقاية لهذا المرض.";
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('مساعد الأمراض الذكي'),
// //         backgroundColor: const Color(0xFF2E7D32),
// //       ),
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child: ListView.builder(
// //               padding: const EdgeInsets.all(10),
// //               itemCount: messages.length,
// //               itemBuilder: (context, index) {
// //                 final isUser = messages[index]["role"] == "user";
// //                 return Align(
// //                   alignment:
// //                       isUser ? Alignment.centerRight : Alignment.centerLeft,
// //                   child: Container(
// //                     padding: const EdgeInsets.symmetric(
// //                       vertical: 10,
// //                       horizontal: 15,
// //                     ),
// //                     margin: const EdgeInsets.symmetric(vertical: 5),
// //                     decoration: BoxDecoration(
// //                       color: isUser ? Colors.green[100] : Colors.grey[300],
// //                       borderRadius: BorderRadius.circular(12),
// //                     ),
// //                     child: Text(
// //                       messages[index]["message"]!,
// //                       style: const TextStyle(fontSize: 16),
// //                     ),
// //                   ),
// //                 );
// //               },
// //             ),
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.all(8),
// //             child: Row(
// //               children: [
// //                 Expanded(
// //                   child: TextField(
// //                     controller: _controller,
// //                     decoration: const InputDecoration(
// //                       hintText: "اكتب رسالتك هنا...",
// //                       border: OutlineInputBorder(),
// //                     ),
// //                   ),
// //                 ),
// //                 IconButton(
// //                   onPressed: _sendMessage,
// //                   icon: const Icon(Icons.send, color: Color(0xFF2E7D32)),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';

// class ChatBotScreen extends StatefulWidget {
//   final String diseaseName;

//   const ChatBotScreen({super.key, required this.diseaseName});

//   @override
//   State<ChatBotScreen> createState() => _ChatBotScreenState();
// }

// class _ChatBotScreenState extends State<ChatBotScreen> {
//   final List<Map<String, String>> messages = [];
//   final TextEditingController _controller = TextEditingController();

//   final Map<String, List<String>> associatedConditions = {
//     "الحمى القلاعية": ["التهاب الفم", "تعفن القدم"],
//     "الجلد العقدي": ["التهاب رئوي", "إسهال"],
//     "تعفن القدم": ["التهاب مفاصل", "الحمى القلاعية"],
//   };

//   @override
//   void initState() {
//     super.initState();
//     _showInitialRecommendation();
//   }

//   void _showInitialRecommendation() {
//     final intro =
//         "📌 التوصيات الأولية لحالة '${widget.diseaseName}':\n\n${_getTreatment(widget.diseaseName)}";

//     setState(() {
//       messages.add({"role": "bot", "message": intro});
//     });
//   }

//   void _sendMessage() {
//     final userMessage = _controller.text.trim();
//     if (userMessage.isEmpty) return;

//     setState(() {
//       messages.add({"role": "user", "message": userMessage});
//     });

//     _controller.clear();
//     _botReply(userMessage);
//   }

//   void _botReply(String userMessage) {
//     String reply =
//         "لم أفهم سؤالك. من فضلك اسأل عن الأعراض أو العلاج أو الوقاية.";

//     if (userMessage.contains('علاج')) {
//       reply = _getTreatment(widget.diseaseName);
//     } else if (userMessage.contains('أعراض')) {
//       reply = _getSymptoms(widget.diseaseName);
//     } else if (userMessage.contains('وقاية')) {
//       reply = _getPrevention(widget.diseaseName);
//     }

//     Future.delayed(const Duration(milliseconds: 500), () {
//       setState(() {
//         messages.add({"role": "bot", "message": reply});
//       });
//     });
//   }

//   void _replyToAssociatedCondition(String condition) {
//     String reply = _getAssociatedConditionAdvice(condition);
//     setState(() {
//       messages.add({
//         "role": "user",
//         "message": "ما هي التوصيات لحالة $condition؟",
//       });
//       messages.add({"role": "bot", "message": reply});
//     });
//   }

//   String _getSymptoms(String disease) {
//     if (disease.contains("الحمى القلاعية")) {
//       return "الأعراض: حرارة – قرح في الفم – تعرج عند المشي – فقدان شهية.";
//     } else if (disease.contains("الجلد العقدي")) {
//       return "الأعراض: عقد جلدية – تورم – ارتفاع حرارة – خمول.";
//     } else if (disease.contains("تعفن القدم")) {
//       return "الأعراض: عرج واضح – رائحة كريهة – تورم بالحافر.";
//     }
//     return "لا توجد أعراض مسجلة لهذا المرض.";
//   }

//   String _getTreatment(String disease) {
//     if (disease.contains("الحمى القلاعية")) {
//       return "• عزل الحيوان.\n• تقديم تغذية لينة.\n• تطهير الفم والأقدام.\n• مسكنات وخافض حرارة.\n• التطعيم الدوري.";
//     } else if (disease.contains("الجلد العقدي")) {
//       return "• عزل المصاب.\n• مكافحة البعوض والقراد.\n• مضاد حيوي للعدوى الثانوية.\n• تغذية محسنة.\n• مراقبة مستمرة.";
//     } else if (disease.contains("تعفن القدم")) {
//       return "• نقع القدم بمطهر (كبريتات النحاس).\n• راحة للحيوان.\n• تقليم الحافر إذا لزم.\n• نظافة جافة دائمة.";
//     }
//     return "لا توجد توصيات علاجية محددة لهذا المرض.";
//   }

//   String _getPrevention(String disease) {
//     if (disease.contains("الحمى القلاعية")) {
//       return "• التطعيم الدوري.\n• تطهير الحظائر.\n• عزل الحالات المصابة فورًا.";
//     } else if (disease.contains("الجلد العقدي")) {
//       return "• رش الحظيرة بالمبيدات.\n• تطعيم القطيع.\n• عزل الحالات الجديدة.";
//     } else if (disease.contains("تعفن القدم")) {
//       return "• تجنب الأماكن الموحلة.\n• فحص الأقدام بانتظام.\n• توفير بيئة نظيفة وجافة.";
//     }
//     return "لا توجد إجراءات وقائية محددة.";
//   }

//   String _getAssociatedConditionAdvice(String condition) {
//     switch (condition) {
//       case "التهاب الفم":
//         return "• استخدم غسول فموي مطهر.\n• قدم طعامًا طريًا وسهل البلع.\n• راقب الحالة مع الطبيب البيطري.";
//       case "تعفن القدم":
//         return _getTreatment("تعفن القدم");
//       case "التهاب رئوي":
//         return "• وفر تهوية جيدة.\n• قدم مضاد حيوي بعد استشارة الطبيب.\n• راقب درجة حرارة الحيوان.";
//       case "إسهال":
//         return "• راقب الجفاف.\n• قدم محلول معالجة الجفاف.\n• راقب تغيرات التغذية.";
//       case "التهاب مفاصل":
//         return "• تقليل الحركة.\n• استخدام مضادات التهابات.\n• راقب المفصل وانتفاخاته.";
//       case "الحمى القلاعية":
//         return _getTreatment("الحمى القلاعية");
//       default:
//         return "لا توجد توصية محددة لهذا العرض.";
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final relatedConditions = associatedConditions[widget.diseaseName] ?? [];

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('مساعد الأمراض الذكي'),
//         backgroundColor: const Color(0xFF2E7D32),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               padding: const EdgeInsets.all(10),
//               itemCount: messages.length,
//               itemBuilder: (context, index) {
//                 final isUser = messages[index]["role"] == "user";
//                 return Align(
//                   alignment:
//                       isUser ? Alignment.centerRight : Alignment.centerLeft,
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                       vertical: 10,
//                       horizontal: 15,
//                     ),
//                     margin: const EdgeInsets.symmetric(vertical: 5),
//                     decoration: BoxDecoration(
//                       color: isUser ? Colors.green[100] : Colors.grey[300],
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Text(
//                       messages[index]["message"]!,
//                       style: const TextStyle(fontSize: 16),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),

//           if (relatedConditions.isNotEmpty)
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "❓ هل تريد معرفة التوصيات لأعراض مصاحبة؟",
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   Wrap(
//                     spacing: 6,
//                     children:
//                         relatedConditions
//                             .map(
//                               (condition) => ActionChip(
//                                 label: Text(condition),
//                                 onPressed:
//                                     () =>
//                                         _replyToAssociatedCondition(condition),
//                                 backgroundColor: Colors.green.shade100,
//                               ),
//                             )
//                             .toList(),
//                   ),
//                   const SizedBox(height: 10),
//                 ],
//               ),
//             ),

//           Padding(
//             padding: const EdgeInsets.all(8),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _controller,
//                     decoration: const InputDecoration(
//                       hintText: "اكتب رسالتك هنا...",
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: _sendMessage,
//                   icon: const Icon(Icons.send, color: Color(0xFF2E7D32)),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class ChatBotScreen extends StatefulWidget {
  final String diseaseName;

  const ChatBotScreen({super.key, required this.diseaseName});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final List<Map<String, String>> messages = [];
  final TextEditingController _controller = TextEditingController();

  final Map<String, List<String>> associatedConditionsArabic = {
    "foot": ["التهاب الفم", "التهاب المفاصل"],
    "mouth": ["قرح الفم", "ارتفاع الحرارة"],
    "lumpy": ["التهاب رئوي", "إسهال"],
  };

  String getMainDiseaseKey(String name) {
    final lower = name.toLowerCase();
    if (lower.contains("foot")) return "foot";
    if (lower.contains("mouth")) return "mouth";
    if (lower.contains("lumpy")) return "lumpy";
    return "";
  }

  @override
  void initState() {
    super.initState();
    _showInitialRecommendation();
  }

  void _showInitialRecommendation() {
    final key = getMainDiseaseKey(widget.diseaseName);
    final intro =
        "📌 التوصيات الأولية لحالة '${widget.diseaseName}':\n\n${_getTreatment(key)}\n\n⚠️ هذه توصيات أولية لحين الذهاب لأقرب عيادة بيطرية.";

    setState(() {
      messages.add({"role": "bot", "message": intro});
    });
  }

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
    final key = getMainDiseaseKey(widget.diseaseName);
    String reply =
        "لم أفهم سؤالك. من فضلك اسأل عن الأعراض أو العلاج أو الوقاية.";

    if (userMessage.contains('علاج')) {
      reply =
          _getTreatment(key) +
          "\n\n⚠️ هذه توصيات أولية لحين الذهاب لأقرب عيادة بيطرية.";
    } else if (userMessage.contains('أعراض')) {
      reply = _getSymptoms(key);
    } else if (userMessage.contains('وقاية')) {
      reply = _getPrevention(key);
    }

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        messages.add({"role": "bot", "message": reply});
      });
    });
  }

  void _replyToAssociatedCondition(String condition) {
    String reply = _getAssociatedConditionAdvice(condition);
    setState(() {
      messages.add({
        "role": "user",
        "message": "ما هي التوصيات لحالة $condition؟",
      });
      messages.add({"role": "bot", "message": reply});
    });
  }

  String _getSymptoms(String key) {
    switch (key) {
      case "foot":
      case "mouth":
        return "الأعراض: ارتفاع حرارة – قرح في الفم – تعرج – فقدان شهية.";
      case "lumpy":
        return "الأعراض: عقد جلدية – تورم – حرارة – خمول.";
      default:
        return "لا توجد أعراض مسجلة لهذا المرض.";
    }
  }

  String _getTreatment(String key) {
    switch (key) {
      case "foot":
      case "mouth":
        return "• عزل الحيوان.\n• تطهير الفم والأقدام.\n• تغذية لينة.\n• خافض حرارة ومسكنات.\n• استشارة بيطرية.\n• تطعيم وقائي.";
      case "lumpy":
        return "• عزل المصاب.\n• مكافحة الحشرات (بعوض – قراد).\n• مضاد حيوي للعدوى الثانوية.\n• تغذية محسنة.\n• تطعيم الجلد العقدي.";
      default:
        return "لا توجد توصيات علاجية محددة لهذا المرض.";
    }
  }

  String _getPrevention(String key) {
    switch (key) {
      case "foot":
      case "mouth":
        return "• تطهير الحظائر.\n• التطعيم الدوري.\n• عزل المصابين فورًا.\n• مراقبة مستمرة.";
      case "lumpy":
        return "• تطعيم القطيع.\n• رش مبيدات ضد الحشرات.\n• عزل أي حالة جديدة تظهر.";
      default:
        return "لا توجد إجراءات وقائية محددة.";
    }
  }

  String _getAssociatedConditionAdvice(String condition) {
    switch (condition) {
      case "التهاب الفم":
      case "قرح الفم":
        return "📌 التوصيات:\n"
            "• استخدام غسول فموي مطهر.\n"
            "• تقديم طعام طري وسهل البلع.\n"
            "• المراقبة المستمرة لحالة الفم.\n"
            "⚠️ هذه توصيات أولية لحين الذهاب لأقرب عيادة بيطرية.";
      case "التهاب المفاصل":
        return "📌 التوصيات:\n"
            "• تقليل حركة الحيوان.\n"
            "• استخدام مضادات التهابات موضعية.\n"
            "• متابعة التورم مع طبيب بيطري.\n"
            "⚠️ هذه توصيات أولية لحين الذهاب لأقرب عيادة بيطرية.";
      case "التهاب رئوي":
        return "📌 التوصيات:\n"
            "• توفير تهوية جيدة.\n"
            "• إعطاء مضاد حيوي تحت إشراف طبيب بيطري.\n"
            "• مراقبة درجة الحرارة يوميًا.\n"
            "⚠️ هذه توصيات أولية لحين الذهاب لأقرب عيادة بيطرية.";
      case "إسهال":
        return "📌 التوصيات:\n"
            "• مراقبة علامات الجفاف.\n"
            "• تقديم محلول معالجة الجفاف.\n"
            "• تعديل النظام الغذائي.\n"
            "⚠️ هذه توصيات أولية لحين الذهاب لأقرب عيادة بيطرية.";
      case "ارتفاع الحرارة":
        return "📌 التوصيات:\n"
            "• استخدام خافض حرارة مناسب.\n"
            "• تقديم سوائل كافية.\n"
            "• راقب علامات التعب والتغيرات السلوكية.\n"
            "⚠️ هذه توصيات أولية لحين الذهاب لأقرب عيادة بيطرية.";
      default:
        return "⚠️ لا توجد توصية دقيقة لهذا العرض. يُرجى مراجعة طبيب بيطري.";
    }
  }

  @override
  Widget build(BuildContext context) {
    final key = getMainDiseaseKey(widget.diseaseName);
    final relatedConditions = associatedConditionsArabic[key] ?? [];

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
          if (relatedConditions.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "❓ هل تريد معرفة التوصيات لأعراض مصاحبة؟",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Wrap(
                    spacing: 6,
                    children:
                        relatedConditions
                            .map(
                              (condition) => ActionChip(
                                label: Text(condition),
                                onPressed:
                                    () =>
                                        _replyToAssociatedCondition(condition),
                                backgroundColor: Colors.green.shade100,
                              ),
                            )
                            .toList(),
                  ),
                  const SizedBox(height: 10),
                ],
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
