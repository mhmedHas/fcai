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
  final Map<String, double>? diseaseProbabilities;

  PredictionResult({
    required this.predictedClass,
    required this.confidencePercentage,
    this.diseaseProbabilities,
  });

  factory PredictionResult.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return PredictionResult(
      predictedClass: data['predicted_class'],
      confidencePercentage: (data['confidence_percentage'] as num).toDouble(),
      diseaseProbabilities:
          data['probabilities'] != null
              ? Map<String, double>.from(data['probabilities'])
              : null,
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
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _pickImage(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: source);

      if (pickedFile != null) {
        setState(() {
          _selectedImage = File(pickedFile.path);
          _errorMessage = null;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'حدث خطأ أثناء اختيار الصورة';
      });
      _showErrorDialog('حدث خطأ أثناء اختيار الصورة');
    }
  }

  Future<PredictionResult?> _sendImageForPrediction(File imageFile) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://192.168.174.120:8000/predict'),
      );

      request.files.add(
        await http.MultipartFile.fromPath('file', imageFile.path),
      );

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        return PredictionResult.fromJson(json.decode(response.body));
      } else {
        throw Exception('فشل في الحصول على النتيجة: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('خطأ في الاتصال بالسيرفر: $e');
    }
  }

  void _navigateToResults(BuildContext context) async {
    if (_selectedImage == null) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final result = await _sendImageForPrediction(_selectedImage!);

      if (!mounted) return;

      if (result != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => ResultsScreen(
                  image: _selectedImage!,
                  predictedClass: result.predictedClass,
                  confidencePercentage: result.confidencePercentage,
                  diseaseProbabilities:
                      result.diseaseProbabilities ??
                      {
                        result.predictedClass: result.confidencePercentage,
                        'أمراض أخرى': 100 - result.confidencePercentage,
                      },
                ),
          ),
        );
      } else {
        throw Exception('لا توجد بيانات متاحة');
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
      _showErrorDialog(_errorMessage ?? 'حدث خطأ غير متوقع');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text(
              'خطأ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  'حسناً',
                  style: TextStyle(color: Color(0xFF2E7D32)),
                ),
              ),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'تشخيص أمراض الأبقار',
          style: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF2E7D32),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFE8F5E9), Color(0xFFC8E6C9)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_errorMessage != null) ...[
                  _buildErrorCard(),
                  const SizedBox(height: 20),
                ],
                _buildImageSelectionCard(),
                if (_selectedImage != null) ...[
                  const SizedBox(height: 30),
                  _buildImagePreview(),
                  const SizedBox(height: 20),
                  _buildDiagnoseButton(),
                ],
              ],
            ),
          ),
          if (_isLoading) _buildLoadingOverlay(),
        ],
      ),
    );
  }

  Widget _buildErrorCard() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red[200]!),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: Colors.red),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              _errorMessage!,
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSelectionCard() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Text(
              'اختر طريقة تحميل الصورة',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2E7D32),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildImageSourceButton(
                  icon: Icons.camera_alt,
                  label: 'الكاميرا',
                  onPressed: () => _pickImage(ImageSource.camera),
                ),
                _buildImageSourceButton(
                  icon: Icons.photo_library,
                  label: 'المعرض',
                  onPressed: () => _pickImage(ImageSource.gallery),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSourceButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, size: 32, color: const Color(0xFF2E7D32)),
          onPressed: onPressed,
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Color(0xFF2E7D32)),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(color: Color(0xFF2E7D32))),
      ],
    );
  }

  Widget _buildImagePreview() {
    return Column(
      children: [
        const Text(
          'الصورة المختارة',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2E7D32),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.file(
              _selectedImage!,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDiagnoseButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () => _navigateToResults(context),
        icon: const Icon(Icons.medical_services, size: 24),
        label: const Text('بدء التشخيص', style: TextStyle(fontSize: 18)),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2E7D32),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 5,
        ),
      ),
    );
  }

  Widget _buildLoadingOverlay() {
    return Container(
      color: Colors.black.withOpacity(0.4),
      child: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 6,
            ),
            SizedBox(height: 20),
            Text(
              'جاري تحليل الصورة...',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
