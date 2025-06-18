// // import 'dart:io';
// // import 'package:cows_care/app_localization.dart';
// // import 'package:cows_care/localaization.dart';
// // import 'package:cows_care/splash.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_localizations/flutter_localizations.dart';
// // import 'package:provider/provider.dart';

// // // استيراد مكتبة FFI فقط عند التشغيل على Windows
// // import 'package:sqflite_common_ffi/sqflite_ffi.dart';

// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized(); // ضروري عند تحميل مكتبة قبل تشغيل التطبيق

// //   if (Platform.isWindows) {
// //     sqfliteFfiInit();
// //     databaseFactory = databaseFactoryFfi; // استخدام مكتبة FFI في Windows
// //   }

// //   runApp(
// //     ChangeNotifierProvider(create: (_) => LocaleProvider(), child: Cows()),
// //   );
// // }

// // class Cows extends StatelessWidget {
// //   const Cows({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Consumer<LocaleProvider>(
// //       builder: (context, localeProvider, child) {
// //         return MaterialApp(
// //           title: 'Cattle Health App',
// //           locale: localeProvider.locale,
// //           supportedLocales: const [Locale('en'), Locale('ar')],
// //           localizationsDelegates: const [
// //             AppLocalizationsDelegate(),
// //             GlobalMaterialLocalizations.delegate,
// //             GlobalWidgetsLocalizations.delegate,
// //           ],
// //           home: const Splash(),
// //           debugShowCheckedModeBanner: false,
// //         );
// //       },
// //     );
// //   }
// // }

// // import 'dart:io';
// // import 'package:cows_care/app_localization.dart';
// // import 'package:cows_care/localaization.dart';
// // import 'package:cows_care/splash.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_localizations/flutter_localizations.dart';
// // import 'package:provider/provider.dart';

// // // استيراد مكتبة FFI فقط عند التشغيل على Windows
// // import 'package:sqflite_common_ffi/sqflite_ffi.dart';

// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized(); // ضروري عند تحميل مكتبة قبل تشغيل التطبيق

// //   if (Platform.isWindows) {
// //     sqfliteFfiInit();
// //     databaseFactory = databaseFactoryFfi; // استخدام مكتبة FFI في Windows
// //   }

// //   runApp(
// //     ChangeNotifierProvider(create: (_) => LocaleProvider(), child: Cows()),
// //   );
// // }

// // class Cows extends StatelessWidget {
// //   const Cows({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Consumer<LocaleProvider>(
// //       builder: (context, localeProvider, child) {
// //         return MaterialApp(
// //           title: 'Cattle Health App',
// //           locale: localeProvider.locale,
// //           supportedLocales: const [Locale('en'), Locale('ar')],
// //           localizationsDelegates: const [
// //             AppLocalizationsDelegate(),
// //             GlobalMaterialLocalizations.delegate,
// //             GlobalWidgetsLocalizations.delegate,
// //             GlobalCupertinoLocalizations.delegate, // دعم الـ Cupertino
// //           ],
// //           home: const Splash(),
// //           debugShowCheckedModeBanner: false,
// //         );
// //       },
// //     );
// //   }
// // }
// import 'dart:io';
// import 'package:cows_care/app_localization.dart';
// import 'package:cows_care/home.dart';
// import 'package:cows_care/localaization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:provider/provider.dart';
// import 'package:sqflite_common_ffi/sqflite_ffi.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   if (Platform.isWindows) {
//     sqfliteFfiInit();
//     databaseFactory = databaseFactoryFfi;
//   }

//   runApp(
//     ChangeNotifierProvider(
//       create: (_) => LocaleProvider(),
//       child: const Cows(),
//     ),
//   );
// }

// class Cows extends StatelessWidget {
//   const Cows({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<LocaleProvider>(
//       builder: (context, localeProvider, child) {
//         return MaterialApp(
//           title: 'Cattle Health App',
//           locale: localeProvider.locale,
//           supportedLocales: const [Locale('en'), Locale('ar')],
//           localizationsDelegates: const [
//             AppLocalizationsDelegate(),
//             GlobalMaterialLocalizations.delegate,
//             GlobalWidgetsLocalizations.delegate,
//             GlobalCupertinoLocalizations.delegate,
//           ],
//           home: HomeScreen(), // الصفحة الجديدة فيها ناف بار وأساسية
//           debugShowCheckedModeBanner: false,
//         );
//       },
//     );
//   }
// }
import 'dart:io';
import 'package:cows_care/firebase_options.dart';
import 'package:cows_care/login.dart';
import 'package:cows_care/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'package:cows_care/app_localization.dart';
import 'package:cows_care/localaization.dart';
import 'package:cows_care/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // تهيئة Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (Platform.isWindows) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  try {
    // تهيئة SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    runApp(
      ChangeNotifierProvider(
        create: (_) => LocaleProvider(),
        child: Cows(isLoggedIn: isLoggedIn),
      ),
    );
  } catch (e) {
    print('Error initializing SharedPreferences: $e');
    // تشغيل التطبيق بحالة تسجيل خروج كحالة افتراضية في حالة الخطأ
    runApp(
      ChangeNotifierProvider(
        create: (_) => LocaleProvider(),
        child: const Cows(isLoggedIn: false),
      ),
    );
  }
}

class Cows extends StatelessWidget {
  final bool isLoggedIn;
  const Cows({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
      builder: (context, localeProvider, child) {
        return MaterialApp(
          title: 'Cattle Health App',
          locale: localeProvider.locale,
          supportedLocales: const [Locale('en'), Locale('ar')],
          localizationsDelegates: const [
            AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: Splash(x: isLoggedIn),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
