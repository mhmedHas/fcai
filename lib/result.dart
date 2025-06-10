// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';

// class ResultsScreen extends StatelessWidget {
//   final File image;
//   final String predictedClass;
//   final double confidencePercentage;
//   final Map<String, double> diseaseProbabilities;

//   const ResultsScreen({
//     Key? key,
//     required this.image,
//     required this.predictedClass,
//     required this.confidencePercentage,
//     required this.diseaseProbabilities,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F5F5),
//       appBar: AppBar(
//         title: const Text(
//           'نتائج التشخيص',
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: const Color(0xFF2E7D32),
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Colors.white),
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             // صورة البقرة
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.1),
//                     blurRadius: 10,
//                     spreadRadius: 2,
//                   ),
//                 ],
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(15),
//                 child: Image.file(
//                   image,
//                   fit: BoxFit.cover,
//                   width: double.infinity,
//                   height: 250,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 25),

//             // نتيجة التشخيص الرئيسية
//             Container(
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(15),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.05),
//                     blurRadius: 8,
//                     spreadRadius: 2,
//                   ),
//                 ],
//               ),
//               child: Column(
//                 children: [
//                   Text(
//                     "التشخيص",
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.grey[700],
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                   Text(
//                     predictedClass,
//                     style: const TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF2E7D32),
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 15),
//                   Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       SizedBox(
//                         height: 120,
//                         width: 120,
//                         child: CircularProgressIndicator(
//                           value: confidencePercentage / 100,
//                           strokeWidth: 12,
//                           backgroundColor: Colors.grey[200],
//                           valueColor: const AlwaysStoppedAnimation<Color>(
//                             Color(0xFF4CAF50),
//                           ),
//                         ),
//                       ),
//                       Text(
//                         "${confidencePercentage.toStringAsFixed(1)}%",
//                         style: const TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   const Text(
//                     "نسبة الثقة",
//                     style: TextStyle(fontSize: 16, color: Colors.black54),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 25),

//             // الرسم البياني الدائري
//             Container(
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(15),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.05),
//                     blurRadius: 8,
//                     spreadRadius: 2,
//                   ),
//                 ],
//               ),
//               child: Column(
//                 children: [
//                   const Text(
//                     "توزيع الاحتمالات",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   const SizedBox(height: 15),
//                   SizedBox(
//                     height: 250,
//                     child: PieChart(
//                       PieChartData(
//                         sections: _buildPieSections(),
//                         centerSpaceRadius: 50,
//                         sectionsSpace: 2,
//                         startDegreeOffset: -90,
//                         pieTouchData: PieTouchData(
//                           touchCallback:
//                               (FlTouchEvent event, pieTouchResponse) {},
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   _buildLegend(),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 25),

//             // نصائح وإرشادات
//             Container(
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(15),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.05),
//                     blurRadius: 8,
//                     spreadRadius: 2,
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "إجراءات مقترحة",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   _buildActionItem(
//                     Icons.medical_services,
//                     "عزل الحيوان المصاب فورًا",
//                   ),
//                   _buildActionItem(Icons.people, "استشارة الطبيب البيطري"),
//                   _buildActionItem(Icons.clean_hands, "تطهير المنطقة المحيطة"),
//                   _buildActionItem(
//                     Icons.monitor_heart,
//                     "مراقبة القطيع لباقي الأعراض",
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 25),

//             // زر العودة
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed:
//                     () => Navigator.popUntil(context, (route) => route.isFirst),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF2E7D32),
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   elevation: 3,
//                 ),
//                 child: const Text(
//                   'العودة للصفحة الرئيسية',
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   List<PieChartSectionData> _buildPieSections() {
//     final List<Color> colors = [
//       const Color(0xFF4CAF50),
//       const Color(0xFF2196F3),
//       const Color(0xFFFFC107),
//       const Color(0xFFF44336),
//       const Color(0xFF9C27B0),
//       const Color(0xFF607D8B),
//     ];

//     return diseaseProbabilities.entries.map((entry) {
//       final index = diseaseProbabilities.keys.toList().indexOf(entry.key);
//       return PieChartSectionData(
//         value: entry.value,
//         color: colors[index % colors.length],
//         radius: 25,
//         title: '${entry.value.toStringAsFixed(1)}%',
//         titleStyle: const TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.bold,
//           color: Colors.white,
//         ),
//         badgeWidget: _badgeWidget(entry.key, colors[index % colors.length]),
//         badgePositionPercentageOffset: 1.3,
//       );
//     }).toList();
//   }

//   Widget _badgeWidget(String text, Color color) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(4),
//       ),
//       child: Text(
//         text,
//         style: const TextStyle(fontSize: 12, color: Colors.white),
//         maxLines: 1,
//         overflow: TextOverflow.ellipsis,
//       ),
//     );
//   }

//   Widget _buildLegend() {
//     final List<Color> colors = [
//       const Color(0xFF4CAF50),
//       const Color(0xFF2196F3),
//       const Color(0xFFFFC107),
//       const Color(0xFFF44336),
//       const Color(0xFF9C27B0),
//       const Color(0xFF607D8B),
//     ];

//     return Wrap(
//       spacing: 10,
//       runSpacing: 10,
//       children:
//           diseaseProbabilities.entries.map((entry) {
//             final index = diseaseProbabilities.keys.toList().indexOf(entry.key);
//             return Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Container(
//                   width: 16,
//                   height: 16,
//                   decoration: BoxDecoration(
//                     color: colors[index % colors.length],
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//                 const SizedBox(width: 5),
//                 Text(entry.key, style: const TextStyle(fontSize: 14)),
//               ],
//             );
//           }).toList(),
//     );
//   }

//   Widget _buildActionItem(IconData icon, String text) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         children: [
//           Icon(
//             icon,
//             color: const Color(0xFF2E7D32),
//           ), // ← هنا كان لازم تقفل Icon()
//           const SizedBox(width: 10),
//           Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
//         ],
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:cows_care/chat.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ResultsScreen extends StatelessWidget {
  final File image;
  final String predictedClass;
  final double confidencePercentage;
  final Map<String, double> diseaseProbabilities;

  const ResultsScreen({
    Key? key,
    required this.image,
    required this.predictedClass,
    required this.confidencePercentage,
    required this.diseaseProbabilities,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text(
          'نتائج التشخيص',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF2E7D32),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // صورة البقرة
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.file(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 250,
                ),
              ),
            ),
            const SizedBox(height: 25),

            // التشخيص + توزيع الاحتمالات جنب بعض
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 280,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          "التشخيص",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          predictedClass,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2E7D32),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              height: 80,
                              width: 80,
                              child: CircularProgressIndicator(
                                value: confidencePercentage / 100,
                                strokeWidth: 8,
                                backgroundColor: Colors.grey[200],
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  Color(0xFF4CAF50),
                                ),
                              ),
                            ),
                            Text(
                              "${confidencePercentage.toStringAsFixed(1)}%",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "نسبة الثقة",
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "توزيع الاحتمالات",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 150,
                          child: PieChart(
                            PieChartData(
                              sections: _buildPieSections(),
                              centerSpaceRadius: 30,
                              sectionsSpace: 2,
                              startDegreeOffset: -90,
                              pieTouchData: PieTouchData(
                                touchCallback:
                                    (FlTouchEvent event, pieTouchResponse) {},
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        _buildLegend(),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // نصائح وإرشادات
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "إجراءات مقترحة",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildActionItem(
                    Icons.medical_services,
                    "عزل الحيوان المصاب فورًا",
                  ),
                  _buildActionItem(Icons.people, "استشارة الطبيب البيطري"),
                  _buildActionItem(Icons.clean_hands, "تطهير المنطقة المحيطة"),
                  _buildActionItem(
                    Icons.monitor_heart,
                    "مراقبة القطيع لباقي الأعراض",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // زر العودة
            SizedBox(
              width: double.infinity / 2 - 10,
              child: ElevatedButton(
                onPressed:
                    () => Navigator.popUntil(context, (route) => route.isFirst),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E7D32),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                ),
                child: const Text(
                  'العودة للصفحة الرئيسية',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity / 2 - 10,
              child: ElevatedButton(
                onPressed:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                ChatBotScreen(diseaseName: predictedClass),
                      ),
                    ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E7D32),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                ),
                child: const Text(
                  'chat bot ❄',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> _buildPieSections() {
    final List<Color> colors = [
      const Color(0xFF4CAF50),
      const Color(0xFFF44336),
      const Color(0xFF2196F3),
      const Color(0xFFFFC107),

      const Color(0xFF9C27B0),
      const Color(0xFF607D8B),
    ];

    return diseaseProbabilities.entries.map((entry) {
      final index = diseaseProbabilities.keys.toList().indexOf(entry.key);
      return PieChartSectionData(
        value: entry.value,
        color: colors[index % colors.length],
        radius: 20,
        title: '${entry.value.toStringAsFixed(1)}%',
        titleStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }).toList();
  }

  Widget _buildLegend() {
    final List<Color> colors = [
      const Color(0xFF4CAF50),
      const Color(0xFF2196F3),
      const Color(0xFFFFC107),
      const Color(0xFFF44336),
      const Color(0xFF9C27B0),
      const Color(0xFF607D8B),
    ];

    return Wrap(
      spacing: 10,
      runSpacing: 5,
      children:
          diseaseProbabilities.entries.map((entry) {
            final index = diseaseProbabilities.keys.toList().indexOf(entry.key);
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: colors[index % colors.length],
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 5),
                Text(entry.key, style: const TextStyle(fontSize: 12)),
              ],
            );
          }).toList(),
    );
  }

  Widget _buildActionItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF2E7D32)),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
