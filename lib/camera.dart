// // // import 'dart:io';
// // // import 'package:cows_care/result.dart';
// // // import 'package:file_picker/file_picker.dart';
// // // import 'package:flutter/material.dart';

// // // class CameraScreen extends StatefulWidget {
// // //   const CameraScreen({super.key});

// // //   @override
// // //   _CameraScreenState createState() => _CameraScreenState();
// // // }

// // // class _CameraScreenState extends State<CameraScreen> {
// // //   File? _selectedImage;

// // //   Future<void> _pickImage() async {
// // //     try {
// // //       FilePickerResult? result = await FilePicker.platform.pickFiles(
// // //         type: FileType.image,
// // //       );

// // //       if (result != null && result.files.single.path != null) {
// // //         setState(() {
// // //           _selectedImage = File(result.files.single.path!);
// // //         });
// // //       }
// // //     } catch (e) {
// // //       _showError("حدث خطأ أثناء اختيار الصورة.");
// // //     }
// // //   }

// // //   void _navigateToResults(BuildContext context) {
// // //     if (_selectedImage != null) {
// // //       Navigator.push(
// // //         context,
// // //         MaterialPageRoute(
// // //           builder: (context) => ResultsScreen(image: _selectedImage!),
// // //         ),
// // //       );
// // //     }
// // //   }

// // //   void _showError(String message) {
// // //     ScaffoldMessenger.of(context).showSnackBar(
// // //       SnackBar(content: Text(message), backgroundColor: Colors.red),
// // //     );
// // //   }

// // //   @override
// // //   void dispose() {
// // //     _selectedImage = null;
// // //     super.dispose();
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text(
// // //           "تحميل صورة",
// // //           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
// // //         ),
// // //         backgroundColor: const Color(0xFF2E7D32),
// // //       ),
// // //       body: Container(
// // //         width: double.infinity,
// // //         padding: const EdgeInsets.all(20),
// // //         decoration: const BoxDecoration(
// // //           gradient: LinearGradient(
// // //             colors: [Color(0xFFE8F5E9), Color(0xFFC8E6C9)],
// // //             begin: Alignment.topLeft,
// // //             end: Alignment.bottomRight,
// // //           ),
// // //         ),
// // //         child: Column(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           children: [
// // //             ElevatedButton.icon(
// // //               icon: const Icon(Icons.upload_file),
// // //               label: const Text("تحميل صورة"),
// // //               onPressed: _pickImage,
// // //               style: ElevatedButton.styleFrom(
// // //                 padding: const EdgeInsets.symmetric(
// // //                   vertical: 15,
// // //                   horizontal: 30,
// // //                 ),
// // //                 textStyle: const TextStyle(fontSize: 18),
// // //               ),
// // //             ),
// // //             if (_selectedImage != null) ...[
// // //               const SizedBox(height: 20),
// // //               Image.file(
// // //                 _selectedImage!,
// // //                 width: 300,
// // //                 height: 300,
// // //                 fit: BoxFit.contain,
// // //               ),
// // //               const SizedBox(height: 20),
// // //               ElevatedButton(
// // //                 onPressed: () => _navigateToResults(context),
// // //                 child: const Text("التالي"),
// // //                 style: ElevatedButton.styleFrom(
// // //                   padding: const EdgeInsets.symmetric(
// // //                     vertical: 15,
// // //                     horizontal: 40,
// // //                   ),
// // //                   textStyle: const TextStyle(fontSize: 18),
// // //                 ),
// // //               ),
// // //             ],
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'dart:io';
// // import 'package:cows_care/app_localization.dart';
// // import 'package:cows_care/localaization.dart';
// // import 'package:cows_care/result.dart';
// // import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:provider/provider.dart';

// // class CameraScreen extends StatefulWidget {
// //   const CameraScreen({super.key});

// //   @override
// //   _CameraScreenState createState() => _CameraScreenState();
// // }

// // class _CameraScreenState extends State<CameraScreen> {
// //   File? _selectedImage;

// //   Future<void> _pickImage(ImageSource source) async {
// //     final picker = ImagePicker();
// //     final pickedFile = await picker.pickImage(source: source);

// //     if (pickedFile != null) {
// //       setState(() {
// //         _selectedImage = File(pickedFile.path);
// //       });
// //     }
// //   }

// //   void _navigateToResults(BuildContext context) {
// //     if (_selectedImage != null) {
// //       Navigator.push(
// //         context,
// //         MaterialPageRoute(
// //           builder: (context) => ResultsScreen(image: _selectedImage!),
// //         ),
// //       );
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final localeProvider = Provider.of<LocaleProvider>(context);
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(
// //           AppLocalizations.of(context).captureImage,
// //           style: const TextStyle(
// //             fontFamily: 'Amiri',
// //             fontSize: 20,
// //             fontWeight: FontWeight.bold,
// //             color: Colors.white,
// //           ),
// //         ),
// //         backgroundColor: const Color(0xFF2E7D32),
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.language, color: Colors.white),
// //             onPressed: () {
// //               localeProvider.setLocale(
// //                 localeProvider.locale.languageCode == 'en'
// //                     ? const Locale('ar')
// //                     : const Locale('en'),
// //               );
// //             },
// //           ),
// //         ],
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
// //             _buildStyledButton(
// //               icon: Icons.camera_alt,
// //               label: "التقاط صورة",
// //               onPressed: () => _pickImage(ImageSource.camera),
// //             ),
// //             const SizedBox(height: 15),
// //             _buildStyledButton(
// //               icon: Icons.upload_file,
// //               label: "رفع صورة",
// //               onPressed: () => _pickImage(ImageSource.gallery),
// //             ),
// //             const SizedBox(height: 30),

// //             if (_selectedImage != null) ...[
// //               Expanded(
// //                 child: Container(
// //                   width: double.infinity,
// //                   padding: const EdgeInsets.all(15),
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
// //                   child: ClipRRect(
// //                     borderRadius: BorderRadius.circular(10),
// //                     child: Image.file(
// //                       _selectedImage!,
// //                       fit: BoxFit.contain,
// //                       width: double.infinity,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //               const SizedBox(height: 20),
// //               _buildStyledButton(
// //                 icon: Icons.arrow_forward,
// //                 label: "التالي",
// //                 onPressed: () => _navigateToResults(context),
// //               ),
// //             ],
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   /// 🔹 **تصميم الأزرار بالأخضر مع تأثيرات أنيقة**
// //   Widget _buildStyledButton({
// //     required IconData icon,
// //     required String label,
// //     required VoidCallback onPressed,
// //   }) {
// //     return SizedBox(
// //       width: double.infinity,
// //       child: ElevatedButton(
// //         onPressed: onPressed,
// //         style: ElevatedButton.styleFrom(
// //           backgroundColor: const Color(0xFF2E7D32), // اللون الأخضر الداكن
// //           padding: const EdgeInsets.symmetric(vertical: 15),
// //           shape: RoundedRectangleBorder(
// //             borderRadius: BorderRadius.circular(12),
// //           ),
// //           elevation: 5,
// //           shadowColor: Colors.black26,
// //         ),
// //         child: Row(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Icon(icon, size: 26, color: Colors.white),
// //             const SizedBox(width: 10),
// //             Text(
// //               label,
// //               style: const TextStyle(fontSize: 18, color: Colors.white),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'dart:io';
// import 'package:cows_care/app_localization.dart';
// // import 'package:cows_care/localaization.dart';
// import 'package:cows_care/result.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// // import 'package:provider/provider.dart';

// class CameraScreen extends StatefulWidget {
//   const CameraScreen({super.key});

//   @override
//   _CameraScreenState createState() => _CameraScreenState();
// }

// class _CameraScreenState extends State<CameraScreen> {
//   File? _selectedImage;

//   Future<void> _pickImage(ImageSource source) async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: source);

//     if (pickedFile != null) {
//       setState(() {
//         _selectedImage = File(pickedFile.path);
//       });
//     }
//   }

//   void _navigateToResults(BuildContext context) {
//     if (_selectedImage != null) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => ResultsScreen(image: _selectedImage!),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final localeProvider = Provider.of<LocaleProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           AppLocalizations.of(context).captureImage,
//           style: const TextStyle(
//             fontFamily: 'Amiri',
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: const Color(0xFF2E7D32),
//         // تمت إزالة أيقونة تغيير اللغة من هنا
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
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _buildStyledButton(
//               icon: Icons.camera_alt,
//               label: AppLocalizations.of(context).capture,
//               onPressed: () => _pickImage(ImageSource.camera),
//             ),
//             const SizedBox(height: 15),
//             _buildStyledButton(
//               icon: Icons.upload_file,
//               label: AppLocalizations.of(context).upload,
//               onPressed: () => _pickImage(ImageSource.gallery),
//             ),
//             const SizedBox(height: 30),

//             if (_selectedImage != null) ...[
//               Expanded(
//                 child: Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.all(15),
//                   decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.8),
//                     borderRadius: BorderRadius.circular(15),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.2),
//                         blurRadius: 10,
//                         spreadRadius: 2,
//                       ),
//                     ],
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Image.file(
//                       _selectedImage!,
//                       fit: BoxFit.contain,
//                       width: double.infinity,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               _buildStyledButton(
//                 icon: Icons.arrow_forward,
//                 label: AppLocalizations.of(context).results,
//                 onPressed: () => _navigateToResults(context),
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }

//   /// 🔹 **تصميم الأزرار بالأخضر مع تأثيرات أنيقة**
//   Widget _buildStyledButton({
//     required IconData icon,
//     required String label,
//     required VoidCallback onPressed,
//   }) {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: const Color(0xFF2E7D32), // اللون الأخضر الداكن
//           padding: const EdgeInsets.symmetric(vertical: 15),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           elevation: 5,
//           shadowColor: Colors.black26,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, size: 26, color: Colors.white),
//             const SizedBox(width: 10),
//             Text(
//               label,
//               style: const TextStyle(fontSize: 18, color: Colors.white),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'dart:io';
import 'package:cows_care/result.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class PredictionResult {
  final String predictedClass;
  final double confidencePercentage;

  PredictionResult({
    required this.predictedClass,
    required this.confidencePercentage,
  });

  factory PredictionResult.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return PredictionResult(
      predictedClass: data['predicted_class'],
      confidencePercentage: (data['confidence_percentage'] as num).toDouble(),
    );
  }
}

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? _selectedImage;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<PredictionResult?> sendImageForPrediction(File imageFile) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://192.168.85.120:8000/predict'), // رابط السيرفر
      );

      request.files.add(
        await http.MultipartFile.fromPath(
          'file',
          imageFile.path,
        ), // <-- هنا التعديل
      );

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return PredictionResult.fromJson(responseData);
      } else {
        print('Failed to predict: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  // Future<PredictionResult?> sendImageForPrediction(File imageFile) async {
  //   try {
  //     var request = http.MultipartRequest(
  //       'POST',
  //       Uri.parse('http://192.168.174.120:8000/predict'), // رابط السيرفر
  //     );

  //     request.files.add(
  //       await http.MultipartFile.fromPath('image', imageFile.path),
  //     );

  //     var streamedResponse = await request.send();
  //     var response = await http.Response.fromStream(streamedResponse);

  //     print('Response status code: ${response.statusCode}');
  //     print('Response body: ${response.body}');

  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> responseData = json.decode(response.body);
  //       return PredictionResult.fromJson(responseData);
  //     } else {
  //       print('Failed to predict: ${response.statusCode}');
  //       return null;
  //     }
  //   } catch (e) {
  //     print('Error during prediction: $e');
  //     return null;
  //   }
  // }

  void _navigateToResults(BuildContext context) async {
    if (_selectedImage != null) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );

      final result = await sendImageForPrediction(_selectedImage!);

      Navigator.pop(context); // اغلاق الـ Loading

      if (result != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => ResultsScreen(
                  image: _selectedImage!,
                  predictedClass: result.predictedClass,
                  confidencePercentage: result.confidencePercentage,
                ),
          ),
        );
      } else {
        _showErrorDialog(
          context,
          'فشل في الحصول على النتيجة، تحقق من الاتصال أو السيرفر.',
        );
      }
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('خطأ'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('موافق'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'التقاط صورة',
          style: TextStyle(
            fontFamily: 'Amiri',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // _buildStyledButton(
            //   icon: Icons.camera_alt,
            //   label: 'التقاط صورة بالكاميرا',
            //   onPressed: () => _pickImage(ImageSource.camera),
            // ),
            // const SizedBox(height: 15),
            _buildStyledButton(
              icon: Icons.upload_file,
              label: 'اختيار صورة من المعرض',
              onPressed: () => _pickImage(ImageSource.gallery),
            ),
            const SizedBox(height: 30),
            if (_selectedImage != null) ...[
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      _selectedImage!,
                      fit: BoxFit.contain,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildStyledButton(
                icon: Icons.arrow_forward,
                label: 'نتائج التشخيص',
                onPressed: () => _navigateToResults(context),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStyledButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2E7D32),
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 5,
          shadowColor: Colors.black26,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 26, color: Colors.white),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
