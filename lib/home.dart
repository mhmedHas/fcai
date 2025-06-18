import 'dart:math';
import 'package:cows_care/chat.dart';
import 'package:cows_care/how_work.dart';
import 'package:cows_care/localaization.dart';
import 'package:cows_care/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cows_care/app_localization.dart';
import 'package:cows_care/localaization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cows_care/app_localization.dart';
import 'package:cows_care/camera.dart';

import 'dart:math';
import 'package:cows_care/app_localization.dart';
import 'package:cows_care/camera.dart';
import 'package:cows_care/how_work.dart';
import 'package:cows_care/localaization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// استبدل بهذه الصفحات الحقيقية عند إنشائها

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);

    final tips = [
      AppLocalizations.of(context).tip1,
      AppLocalizations.of(context).tip2,
      AppLocalizations.of(context).tip3,
    ];
    final randomTip = tips[Random().nextInt(tips.length)];

    final pages = [
      _buildMainPage(context, randomTip),
      ChatBotScreen(diseaseName: 'normal'),
      stings(),
    ];

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     AppLocalizations.of(context).welcome,
      //     style: const TextStyle(
      //       fontFamily: 'Amiri',
      //       fontSize: 25,
      //       fontWeight: FontWeight.bold,
      //       color: Colors.white,
      //     ),
      //   ),
      //   backgroundColor: const Color(0xFF2E7D32),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.language, color: Colors.white),
      //       onPressed: () {
      //         localeProvider.setLocale(
      //           localeProvider.locale.languageCode == 'en'
      //               ? const Locale('ar')
      //               : const Locale('en'),
      //         );
      //       },
      //     ),
      //   ],
      // ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green[900],
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: AppLocalizations.of(context).home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.chat),
            label: AppLocalizations.of(context).chat,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: AppLocalizations.of(context).settings,
          ),
        ],
      ),
    );
  }

  Widget _buildMainPage(BuildContext context, String randomTip) {
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
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE8F5E9), Color(0xFFC8E6C9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 75,
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: Image.asset(
                    'assets/icon/cowsxl.jpg',
                    width: 140,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Text(
                AppLocalizations.of(context).welcome,
                style: const TextStyle(
                  fontFamily: 'Amiri',
                  fontSize: 28,
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
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                icon: const Icon(Icons.camera_alt, color: Colors.white),
                label: Text(
                  AppLocalizations.of(context).startDiagnosis,
                  style: const TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                AppLocalizations.of(context).aiPowered,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 30),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: Column(
                    children: [
                      Text(
                        AppLocalizations.of(context).tipLabel,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF2E7D32),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        randomTip,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class stings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.grey[900] : Color(0xFFE8F5E9),
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : Color(0xFF2E7D32),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
        ),
        title: Text(
          AppLocalizations.of(context).settings, // ← هنا تم التعديل
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Amiri',
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, AppLocalizations.of(context).language),
            _buildLanguageCard(context, localeProvider),
            SizedBox(height: 24),
            _buildSectionTitle(context, AppLocalizations.of(context).userg),
            _buildUserGuideExpansion(context),
            SizedBox(height: 16),
            _buildFAQExpansion(context),
            SizedBox(height: 24),
            _buildSectionTitle(context, AppLocalizations.of(context).appInfo),
            _buildAppInfoCard(context),
            _buildApplogout(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: isDarkMode ? Colors.white : Colors.black,
        fontFamily: 'Amiri',
      ),
    );
  }

  Widget _buildLanguageCard(
    BuildContext context,
    LocaleProvider localeProvider,
  ) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: isDarkMode ? Colors.grey[800] : Colors.white,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.language,
                  color: isDarkMode ? Colors.amber : Color(0xFF2E7D32),
                ),
                SizedBox(width: 10),
                Text(
                  AppLocalizations.of(context).language,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontFamily: 'Amiri',
                  ),
                ),
                Spacer(),
                DropdownButton<String>(
                  value: localeProvider.locale.languageCode,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                  items:
                      ['en', 'ar'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value == 'en' ? 'English' : 'العربية',
                            style: TextStyle(
                              color: isDarkMode ? Colors.white : Colors.black,
                              fontFamily: 'Amiri',
                            ),
                          ),
                        );
                      }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      localeProvider.setLocale(Locale(newValue));
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              AppLocalizations.of(context).languageDescription,
              style: TextStyle(
                fontSize: 12,
                color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                fontFamily: 'Amiri',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserGuideExpansion(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: isDarkMode ? Colors.grey[800] : Colors.white,
      child: ExpansionTile(
        title: Text(
          //
          AppLocalizations.of(context).userg,
          // AppLocalizations.of(context).userGuide,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.black,
            fontFamily: 'Amiri',
          ),
        ),
        leading: Icon(
          Icons.menu_book,
          color: isDarkMode ? Colors.amber : Color(0xFF2E7D32),
        ),
        children: [
          _buildGuideItem(
            context,
            icon: Icons.camera_alt,
            title: AppLocalizations.of(context).diagnosisGuideTitle,
            steps: [
              AppLocalizations.of(context).diagnosisStep1,
              AppLocalizations.of(context).diagnosisStep2,
              AppLocalizations.of(context).diagnosisStep3,
            ],
          ),
          _buildGuideItem(
            context,
            icon: Icons.help_outline,
            title: AppLocalizations.of(context).howItWorks,
            steps: [
              AppLocalizations.of(context).howItWorksStep1,
              AppLocalizations.of(context).howItWorksStep2,
              AppLocalizations.of(context).howItWorksStep3,
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGuideItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required List<String> steps,
  }) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: isDarkMode ? Colors.amber : Color(0xFF2E7D32)),
              SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontFamily: 'Amiri',
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          ...steps
              .map(
                (step) => Padding(
                  padding: EdgeInsets.only(right: 32, bottom: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "• ",
                        style: TextStyle(
                          color: isDarkMode ? Colors.amber : Color(0xFF2E7D32),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          step,
                          style: TextStyle(
                            color:
                                isDarkMode
                                    ? Colors.grey[300]
                                    : Colors.grey[700],
                            fontFamily: 'Amiri',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
          Divider(color: isDarkMode ? Colors.grey[700] : Colors.grey[300]),
        ],
      ),
    );
  }

  Widget _buildFAQExpansion(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: isDarkMode ? Colors.grey[800] : Colors.white,
      child: ExpansionTile(
        title: Text(
          AppLocalizations.of(context).faq1Answer,
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
            fontFamily: 'Amiri',
          ),
        ),
        leading: Icon(
          Icons.question_answer,
          color: isDarkMode ? Colors.amber : Color(0xFF2E7D32),
        ),
        children: [
          _buildFAQItem(
            context,
            question: AppLocalizations.of(context).faq1Question,
            answer: AppLocalizations.of(context).faq1Answer,
          ),
          _buildFAQItem(
            context,
            question: AppLocalizations.of(context).faq2Question,
            answer: AppLocalizations.of(context).faq2Answer,
          ),
          _buildFAQItem(
            context,
            question: AppLocalizations.of(context).faq3Question,
            answer: AppLocalizations.of(context).faq3Answer,
          ),
        ],
      ),
    );
  }

  Widget _buildFAQItem(
    BuildContext context, {
    required String question,
    required String answer,
  }) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.amber : Color(0xFF2E7D32),
              fontFamily: 'Amiri',
            ),
          ),
          SizedBox(height: 8),
          Text(
            answer,
            style: TextStyle(
              color: isDarkMode ? Colors.grey[300] : Colors.grey[700],
              fontFamily: 'Amiri',
            ),
          ),
          Divider(color: isDarkMode ? Colors.grey[700] : Colors.grey[300]),
        ],
      ),
    );
  }

  Widget _buildAppInfoCard(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: isDarkMode ? Colors.grey[800] : Colors.white,
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.info_outline,
              color: isDarkMode ? Colors.amber : Color(0xFF2E7D32),
            ),
            title: Text(
              AppLocalizations.of(context).version,
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
                fontFamily: 'Amiri',
              ),
            ),
            subtitle: Text(
              '1.0.0',
              style: TextStyle(
                color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                fontFamily: 'Amiri',
              ),
            ),
            trailing: Icon(
              Icons.chevron_right,
              color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
            ),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    AppLocalizations.of(context).versionInfo,
                    style: TextStyle(fontFamily: 'Amiri'),
                  ),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildApplogout(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: isDarkMode ? Colors.grey[800] : Colors.white,
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.offline_share,
              color: isDarkMode ? Colors.amber : Color(0xFF2E7D32),
            ),
            title: Text(
              AppLocalizations.of(context).logout,
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
                fontFamily: 'Amiri',
              ),
            ),
            subtitle: Text(
              '',
              style: TextStyle(
                color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                fontFamily: 'Amiri',
              ),
            ),
            trailing: Icon(
              Icons.logout_sharp,
              color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
            ),
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.remove('isLoggedIn');

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    AppLocalizations.of(context).logout,
                    style: TextStyle(fontFamily: 'Amiri'),
                  ),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
