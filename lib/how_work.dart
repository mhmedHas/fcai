// import 'package:flutter/material.dart';
// import 'package:cows_care/app_localization.dart';

// class HowItWorksScreen extends StatelessWidget {
//   const HowItWorksScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(AppLocalizations.of(context).howItWorks),
//         backgroundColor: const Color(0xFF2E7D32),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Icon(Icons.camera_alt, size: 60, color: Color(0xFF388E3C)),
//             const SizedBox(height: 20),
//             Text(
//               AppLocalizations.of(context).appDescription,
//               style: const TextStyle(fontSize: 18, height: 1.6),
//             ),
//             const SizedBox(height: 30),
//             const Text(
//               '📷 1. Capture or upload a cow image.',
//               style: TextStyle(fontSize: 16),
//             ),
//             const Text(
//               '🧠 2. AI processes the image and detects diseases.',
//               style: TextStyle(fontSize: 16),
//             ),
//             const Text(
//               '📋 3. You get instant results with confidence level.',
//               style: TextStyle(fontSize: 16),
//             ),
//             const Spacer(),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: Text(AppLocalizations.of(context).backHome),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF1B5E20),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cows_care/app_localization.dart';

class HowItWorksScreen extends StatelessWidget {
  const HowItWorksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context).howItWorks,
          style: TextStyle(
            fontFamily: 'Amiri',
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF2E7D32),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.camera_alt, size: 60, color: Color(0xFF388E3C)),
            const SizedBox(height: 20),
            Text(
              AppLocalizations.of(context).appDescription,
              style: const TextStyle(fontSize: 18, height: 1.6),
            ),
            const SizedBox(height: 30),
            Text(
              '📷 1. ${AppLocalizations.of(context).captureOrUpload}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              '🧠 2. ${AppLocalizations.of(context).aiProcess}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              '📋 3. ${AppLocalizations.of(context).instantResults}',
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            Center(
              // child: ElevatedButton(
              //   onPressed: () => Navigator.pop(context),
              //   child: Text(
              //     AppLocalizations.of(context).backHome,
              //     style: TextStyle(
              //       fontFamily: 'Amiri',
              //       fontSize: 18,
              //       color: Colors.white,
              //     ),
              //   ),
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: const Color(0xFF1B5E20),
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
