

import 'dart:math';
import 'package:cows_care/how_work.dart';
import 'package:cows_care/localaization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cows_care/app_localization.dart';
import 'package:cows_care/camera.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);

    // نصائح عشوائية
    final tips = [
      AppLocalizations.of(context).tip1,
      AppLocalizations.of(context).tip2,
      AppLocalizations.of(context).tip3,
    ];
    final randomTip = tips[Random().nextInt(tips.length)];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).welcome,
          style: const TextStyle(
            fontFamily: 'Amiri',
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF2E7D32),
        actions: [
          IconButton(
            icon: const Icon(Icons.language, color: Colors.white),
            onPressed: () {
              localeProvider.setLocale(
                localeProvider.locale.languageCode == 'en'
                    ? const Locale('ar')
                    : const Locale('en'),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE8F5E9), Color(0xFFC8E6C9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/icon/cowsxl.jpg',
                      fit: BoxFit.cover,
                      width: 160,
                      height: 160,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  AppLocalizations.of(context).welcome,
                  style: const TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B5E20),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  AppLocalizations.of(context).appDescription,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CameraScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1B5E20),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context).startDiagnosis,
                    style: const TextStyle(
                      fontFamily: 'Amiri',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HowItWorksScreen(),
                      ),
                    );
                  },
                  child: Text(
                    AppLocalizations.of(context).howItWorks,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF1B5E20),
                      fontWeight: FontWeight.w900,
                      // decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  AppLocalizations.of(context).aiPowered,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                Divider(
                  color: Colors.green.shade200,
                  indent: 50,
                  endIndent: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "${AppLocalizations.of(context).tipLabel}: $randomTip",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 15, color: Colors.black87),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
