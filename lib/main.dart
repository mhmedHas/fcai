// import 'dart:io';
// import 'package:cows_care/app_localization.dart';
// import 'package:cows_care/localaization.dart';
// import 'package:cows_care/splash.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:provider/provider.dart';

// // استيراد مكتبة FFI فقط عند التشغيل على Windows
// import 'package:sqflite_common_ffi/sqflite_ffi.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized(); // ضروري عند تحميل مكتبة قبل تشغيل التطبيق

//   if (Platform.isWindows) {
//     sqfliteFfiInit();
//     databaseFactory = databaseFactoryFfi; // استخدام مكتبة FFI في Windows
//   }

//   runApp(
//     ChangeNotifierProvider(create: (_) => LocaleProvider(), child: Cows()),
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
//           ],
//           home: const Splash(),
//           debugShowCheckedModeBanner: false,
//         );
//       },
//     );
//   }
// }

import 'dart:io';
import 'package:cows_care/app_localization.dart';
import 'package:cows_care/localaization.dart';
import 'package:cows_care/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

// استيراد مكتبة FFI فقط عند التشغيل على Windows
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ضروري عند تحميل مكتبة قبل تشغيل التطبيق

  if (Platform.isWindows) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi; // استخدام مكتبة FFI في Windows
  }

  runApp(
    ChangeNotifierProvider(create: (_) => LocaleProvider(), child: Cows()),
  );
}

class Cows extends StatelessWidget {
  const Cows({super.key});

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
            GlobalCupertinoLocalizations.delegate, // دعم الـ Cupertino
          ],
          home: const Splash(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
