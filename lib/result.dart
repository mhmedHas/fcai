// // // import 'dart:io';
// // // import 'dart:typed_data';
// // // import 'package:flutter/material.dart';
// // // import 'package:image/image.dart' as img;
// // // import 'package:tflite_flutter/tflite_flutter.dart';
// // // import 'package:tflite_flutter/tflite_flutter.dart' as tfl;

// // // class ResultsScreen extends StatefulWidget {
// // //   final File image;

// // //   const ResultsScreen({super.key, required this.image});

// // //   @override
// // //   _ResultsScreenState createState() => _ResultsScreenState();
// // // }

// // // class _ResultsScreenState extends State<ResultsScreen> {
// // //   String _resultText = "جاري التحليل...";
// // //   tfl.Interpreter? _interpreter;
// // //   bool _isModelLoaded = false;

// // //   final List<String> _classNames = [
// // //     'Foot',
// // //     'Lumpy Skin',
// // //     'Mouth',
// // //     'Normal Skin',
// // //   ];

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _initialize();
// // //   }

// // //   Future<void> _initialize() async {
// // //     await _loadModel();
// // //     if (_isModelLoaded) {
// // //       await _classifyImage(widget.image);
// // //     }
// // //   }

// // //   Future<void> _loadModel() async {
// // //     try {
// // //       _interpreter = await tfl.Interpreter.fromAsset(
// // //         "assets/cattle_disease_model.tflite",
// // //       );
// // //       setState(() {
// // //         _isModelLoaded = true;
// // //       });
// // //     } catch (e) {
// // //       setState(() {
// // //         _resultText = "❌ فشل تحميل النموذج: $e";
// // //       });
// // //     }
// // //   }

// // //   Future<void> _classifyImage(File imageFile) async {
// // //     if (!_isModelLoaded || _interpreter == null) {
// // //       setState(() {
// // //         _resultText = "⚠️ النموذج لم يتم تحميله بعد!";
// // //       });
// // //       return;
// // //     }

// // //     try {
// // //       Uint8List imageBytes = await imageFile.readAsBytes();
// // //       img.Image? image = img.decodeImage(imageBytes);

// // //       if (image == null) {
// // //         throw "⚠️ فشل في قراءة الصورة";
// // //       }

// // //       image = img.copyResize(image, width: 224, height: 224);

// // //       List<List<List<List<double>>>> input = [
// // //         List.generate(
// // //           224,
// // //           (y) => List.generate(224, (x) {
// // //             var pixel = image!.getPixel(
// // //               x,
// // //               y,
// // //             ); // ✅ تم إضافة التأكيد على أن `image` ليس null
// // //             return [(pixel.r) / 255.0, (pixel.g) / 255.0, (pixel.b) / 255.0];
// // //           }),
// // //         ),
// // //       ];

// // //       var output = List.filled(
// // //         _classNames.length,
// // //         0.0,
// // //       ).reshape([1, _classNames.length]);

// // //       _interpreter!.run(input, output);

// // //       int predictedIndex = output[0].indexOf(
// // //         output[0].reduce((a, b) => a > b ? a : b),
// // //       );
// // //       String predictedClass = _classNames[predictedIndex];
// // //       double confidence = output[0][predictedIndex] * 100;

// // //       setState(() {
// // //         _resultText =
// // //             "✅ التشخيص: $predictedClass\n🔹 الدقة: ${confidence.toStringAsFixed(2)}%";
// // //       });
// // //     } catch (e) {
// // //       setState(() {
// // //         _resultText = "❌ حدث خطأ أثناء التحليل: $e";
// // //       });
// // //     }
// // //   }

// // //   @override
// // //   void dispose() {
// // //     _interpreter?.close();
// // //     super.dispose();
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text("نتائج الفحص"),
// // //         backgroundColor: const Color(0xFF2E7D32),
// // //       ),
// // //       body: Center(
// // //         child: Padding(
// // //           padding: const EdgeInsets.all(20),
// // //           child: Column(
// // //             mainAxisAlignment: MainAxisAlignment.center,
// // //             children: [
// // //               Image.file(
// // //                 widget.image,
// // //                 width: 300,
// // //                 height: 300,
// // //                 fit: BoxFit.contain,
// // //               ),
// // //               const SizedBox(height: 20),
// // //               Text(
// // //                 _resultText,
// // //                 textAlign: TextAlign.center,
// // //                 style: const TextStyle(
// // //                   fontSize: 20,
// // //                   fontWeight: FontWeight.bold,
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'dart:io';
// // import 'package:flutter/material.dart';

// // class ResultsScreen extends StatelessWidget {
// //   final File image;

// //   const ResultsScreen({super.key, required this.image});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text(
// //           "نتائج الفحص",
// //           style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
// //         ),
// //         backgroundColor: const Color(0xFF2E7D32),
// //       ),
// //       body: Container(
// //         width: double.infinity,
// //         height: double.infinity,
// //         padding: const EdgeInsets.all(20),
// //         decoration: const BoxDecoration(
// //           gradient: LinearGradient(
// //             colors: [Color(0xFFE8F5E9), Color(0xFFC8E6C9)],
// //             begin: Alignment.topLeft,
// //             end: Alignment.bottomRight,
// //           ),
// //         ),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Expanded(child: Image.file(image, fit: BoxFit.contain)),
// //             const SizedBox(height: 20),
// //             Container(
// //               width: double.infinity,
// //               padding: const EdgeInsets.all(20),
// //               margin: const EdgeInsets.symmetric(horizontal: 20),
// //               decoration: BoxDecoration(
// //                 color: Colors.white.withOpacity(0.8),
// //                 borderRadius: BorderRadius.circular(15),
// //                 boxShadow: [
// //                   BoxShadow(
// //                     color: Colors.black.withOpacity(0.2),
// //                     blurRadius: 10,
// //                     spreadRadius: 2,
// //                   ),
// //                 ],
// //               ),
// //               child: const Column(
// //                 mainAxisSize: MainAxisSize.min,
// //                 children: [
// //                   Text(
// //                     "المرض: جاري التحليل...",
// //                     style: TextStyle(
// //                       fontSize: 20,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.black,
// //                     ),
// //                   ),
// //                   SizedBox(height: 10),
// //                   Text(
// //                     "نسبة الثقة: 0%",
// //                     style: TextStyle(
// //                       fontSize: 20,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.black,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             const SizedBox(height: 30),
// //             ElevatedButton(
// //               onPressed: () {
// //                 Navigator.popUntil(context, (route) => route.isFirst);
// //               },
// //               style: ElevatedButton.styleFrom(
// //                 backgroundColor: Colors.red, // 🔴 لون الزر أحمر
// //                 foregroundColor: Colors.white, // ⚪ لون النص أبيض
// //                 padding: const EdgeInsets.symmetric(
// //                   vertical: 15,
// //                   horizontal: 40,
// //                 ),
// //                 textStyle: const TextStyle(fontSize: 18),
// //               ),
// //               child: const Text("العودة للصفحة الرئيسية"),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // import 'dart:io';
// // import 'package:cows_care/app_localization.dart';
// // import 'package:flutter/material.dart';

// // class ResultsScreen extends StatelessWidget {
// //   final File image;

// //   const ResultsScreen({super.key, required this.image, required String predictedClass, required double confidencePercentage});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(
// //           AppLocalizations.of(
// //             context,
// //           ).results, // "نتائج الفحص" أو "Diagnosis Results"
// //           style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
// //         ),
// //         backgroundColor: const Color(0xFF2E7D32),
// //       ),
// //       body: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           Container(
// //             width: double.infinity,
// //             height: double.infinity,
// //             padding: const EdgeInsets.all(20),
// //             decoration: const BoxDecoration(
// //               gradient: LinearGradient(
// //                 colors: [Color(0xFFE8F5E9), Color(0xFFC8E6C9)],
// //                 begin: Alignment.topLeft,
// //                 end: Alignment.bottomRight,
// //               ),
// //             ),
// //             child: Column(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 Expanded(child: Image.file(image, fit: BoxFit.contain)),
// //                 const SizedBox(height: 20),
// //                 Container(
// //                   width: double.infinity,
// //                   padding: const EdgeInsets.all(20),
// //                   margin: const EdgeInsets.symmetric(horizontal: 20),
// //                   decoration: BoxDecoration(
// //                     color: Colors.white.withOpacity(0.8),
// //                     borderRadius: BorderRadius.circular(15),
// //                     boxShadow: [
// //                       BoxShadow(
// //                         color: Colors.black.withOpacity(0.2),
// //                         blurRadius: 10,
// //                         spreadRadius: 2,
// //                       ),
// //                     ],
// //                   ),
// //                   child: Column(
// //                     mainAxisSize: MainAxisSize.min,
// //                     children: [
// //                       Text(
// //                         "${AppLocalizations.of(context).disease}", // "المرض" أو "Disease"
// //                         style: const TextStyle(
// //                           fontSize: 20,
// //                           fontWeight: FontWeight.bold,
// //                           color: Colors.black,
// //                         ),
// //                       ),

// //                       const SizedBox(height: 10),
// //                       Row(
// //                         children: [
// //                           Text(
// //                             "${AppLocalizations.of(context).confidence}",
// //                             style: const TextStyle(
// //                               fontSize: 20,
// //                               fontWeight: FontWeight.bold,
// //                               color: Colors.black,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 const SizedBox(height: 30),
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     Navigator.popUntil(context, (route) => route.isFirst);
// //                   },
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: Colors.red, // 🔴 لون الزر أحمر
// //                     foregroundColor: Colors.white, // ⚪ لون النص أبيض
// //                     padding: const EdgeInsets.symmetric(
// //                       vertical: 15,
// //                       horizontal: 40,
// //                     ),
// //                     textStyle: const TextStyle(fontSize: 18),
// //                   ),
// //                   child: Text(
// //                     AppLocalizations.of(context).backHome,
// //                   ), // "العودة للصفحة الرئيسية" أو "Back to Home"
// //                 ),
// //               ],
// //             ),
// //           ),
// //           const SizedBox(height: 10),

// //           Text(
// //             "${AppLocalizations.of(context).loading}",
// //             style: const TextStyle(
// //               fontSize: 20,
// //               fontWeight: FontWeight.bold,
// //               color: Colors.black,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'dart:io';
// import 'package:cows_care/app_localization.dart';
// import 'package:flutter/material.dart';

// class ResultsScreen extends StatelessWidget {
//   final File image;
//   final String predictedClass;
//   final double confidencePercentage;

//   const ResultsScreen(BuildContext context, {
//     super.key,
//     required this.image,
//     required this.predictedClass,
//     required this.confidencePercentage,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           AppLocalizations.of(context).results, // "نتائج الفحص"
//           style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: const Color(0xFF2E7D32),
//       ),
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         padding: const EdgeInsets.all(20),
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFFE8F5E9), Color(0xFFC8E6C9)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Column(
//           children: [
//             Expanded(
//               flex: 5,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(15),
//                 child: Image.file(
//                   image,
//                   fit: BoxFit.contain,
//                   width: double.infinity,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               flex: 4,
//               child: Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.85),
//                   borderRadius: BorderRadius.circular(15),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.2),
//                       blurRadius: 10,
//                       spreadRadius: 2,
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "${AppLocalizations.of(context).disease}: $predictedClass",
//                       style: const TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     const SizedBox(height: 15),
//                     Text(
//                       "${AppLocalizations.of(context).confidence}: ${confidencePercentage.toStringAsFixed(2)}%",
//                       style: const TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black87,
//                       ),
//                     ),
//                     const Spacer(),
//                     Center(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.popUntil(context, (route) => route.isFirst);
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.red,
//                           foregroundColor: Colors.white,
//                           padding: const EdgeInsets.symmetric(
//                             vertical: 15,
//                             horizontal: 40,
//                           ),
//                           textStyle: const TextStyle(fontSize: 18),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         child: Text(AppLocalizations.of(context).backHome),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  final File image;
  final String predictedClass;
  final double confidencePercentage;

  const ResultsScreen({
    Key? key,
    required this.image,
    required this.predictedClass,
    required this.confidencePercentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'نتائج التشخيص',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF2E7D32),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE8F5E9), Color(0xFFC8E6C9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.file(
                  image,
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "التشخيص: $predictedClass",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      "نسبة الثقة: ${confidencePercentage.toStringAsFixed(2)}%",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'العودة للصفحة الرئيسية',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
