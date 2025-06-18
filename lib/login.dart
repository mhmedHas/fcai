// // import 'package:cows_care/app_localization.dart';
// // import 'package:cows_care/localaization.dart';
// // import 'package:cows_care/register.dart';
// // import 'package:flutter/material.dart';
// // import 'home.dart';
// // import 'database_helper.dart';
// // import 'package:provider/provider.dart'; // تأكد من استيراد Provider

// // class LoginScreen extends StatefulWidget {
// //   const LoginScreen({Key? key}) : super(key: key);

// //   @override
// //   _LoginScreenState createState() => _LoginScreenState();
// // }

// // class _LoginScreenState extends State<LoginScreen> {
// //   final TextEditingController _emailController = TextEditingController();
// //   final TextEditingController _passwordController = TextEditingController();
// //   final DatabaseHelper _dbHelper = DatabaseHelper();

// //   void _login() async {
// //     String email = _emailController.text;
// //     String password = _passwordController.text;

// //     if (email.isEmpty || password.isEmpty) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(
// //           content: Text(
// //             AppLocalizations.of(context).loading,
// //           ), // "الرجاء إدخال جميع الحقول"
// //           backgroundColor: Colors.red,
// //         ),
// //       );
// //       return;
// //     }

// //     var user = await _dbHelper.loginUser(email, password);

// //     if (user != null) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(
// //           content: Text(
// //             AppLocalizations.of(context).welcome,
// //           ), // "تم تسجيل الدخول بنجاح!"
// //           backgroundColor: Colors.green,
// //         ),
// //       );
// //       Navigator.pushReplacement(
// //         context,
// //         MaterialPageRoute(builder: (context) => stings()),
// //       );
// //     } else {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(
// //           content: Text(
// //             AppLocalizations.of(context).disease,
// //           ), // "البريد الإلكتروني أو كلمة المرور غير صحيحة"
// //           backgroundColor: Colors.red,
// //         ),
// //       );
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final localeProvider = Provider.of<LocaleProvider>(context);
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         title: Text(
// //           AppLocalizations.of(context).logpage, // "تسجيل الدخول" أو "Login"
// //           style: const TextStyle(
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
// //         decoration: const BoxDecoration(
// //           gradient: LinearGradient(
// //             colors: [Color(0xFFE8F5E9), Color(0xFFC8E6C9)],
// //             begin: Alignment.topLeft,
// //             end: Alignment.bottomRight,
// //           ),
// //         ),
// //         child: Center(
// //           child: SingleChildScrollView(
// //             padding: const EdgeInsets.symmetric(horizontal: 24.0),
// //             child: ConstrainedBox(
// //               constraints: const BoxConstraints(maxWidth: 400),
// //               child: Column(
// //                 mainAxisSize: MainAxisSize.min,
// //                 children: [
// //                   const SizedBox(height: 30),
// //                   CircleAvatar(
// //                     radius: 80,
// //                     backgroundColor: Colors.white,
// //                     child: ClipOval(
// //                       child: Image.asset(
// //                         'assets/icon/cowsxl.jpg',
// //                         fit: BoxFit.cover,
// //                         width: 160,
// //                         height: 160,
// //                       ),
// //                     ),
// //                   ),
// //                   const SizedBox(height: 20),
// //                   Text(
// //                     AppLocalizations.of(
// //                       context,
// //                     ).welcome, // "تسجيل الدخول" أو "Login"
// //                     style: const TextStyle(
// //                       fontSize: 28,
// //                       fontWeight: FontWeight.bold,
// //                       color: Color(0xFF1B5E20),
// //                     ),
// //                   ),
// //                   const SizedBox(height: 20),
// //                   TextField(
// //                     controller: _emailController,
// //                     decoration: InputDecoration(
// //                       labelText:
// //                           AppLocalizations.of(
// //                             context,
// //                           ).email, // "البريد الإلكتروني" أو "Email"
// //                       border: const OutlineInputBorder(),
// //                     ),
// //                   ),
// //                   const SizedBox(height: 15),
// //                   TextField(
// //                     controller: _passwordController,
// //                     obscureText: true,
// //                     decoration: InputDecoration(
// //                       labelText:
// //                           AppLocalizations.of(
// //                             context,
// //                           ).password, // "كلمة المرور" أو "Password"
// //                       border: const OutlineInputBorder(),
// //                     ),
// //                   ),
// //                   const SizedBox(height: 20),
// //                   SizedBox(
// //                     width: double.infinity,
// //                     child: ElevatedButton(
// //                       style: ElevatedButton.styleFrom(
// //                         backgroundColor: const Color(0xFF1B5E20),
// //                         padding: const EdgeInsets.symmetric(vertical: 14),
// //                       ),
// //                       onPressed: _login,
// //                       child: Text(
// //                         AppLocalizations.of(
// //                           context,
// //                         ).log, // "تسجيل الدخول" أو "Login"
// //                         style: const TextStyle(
// //                           fontSize: 18,
// //                           color: Colors.white,
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   const SizedBox(height: 10),
// //                   TextButton(
// //                     onPressed:
// //                         () => Navigator.push(
// //                           context,
// //                           MaterialPageRoute(
// //                             builder: (context) => const RegisterScreen(),
// //                           ),
// //                         ),
// //                     child: Text(
// //                       AppLocalizations.of(
// //                         context,
// //                       ).goreg, // "ليس لديك حساب؟ سجل الآن" أو "Don't have an account? Register now"
// //                       style: const TextStyle(color: Color(0xFF388E3C)),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// // import 'package:cows_care/register.dart';
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'app_localization.dart';
// // import 'localaization.dart';
// // import 'database_helper.dart';
// // import 'home.dart'; // يجب أن تحتوي على صفحة stings أو home screen

// // class LoginScreen extends StatefulWidget {
// //   const LoginScreen({Key? key}) : super(key: key);

// //   @override
// //   State<LoginScreen> createState() => _LoginScreenState();
// // }

// // class _LoginScreenState extends State<LoginScreen> {
// //   final TextEditingController _emailController = TextEditingController();
// //   final TextEditingController _passwordController = TextEditingController();
// //   final DatabaseHelper _dbHelper = DatabaseHelper();

// //   void _login() async {
// //     String email = _emailController.text.trim();
// //     String password = _passwordController.text;

// //     if (email.isEmpty || password.isEmpty) {
// //       _showSnackBar(AppLocalizations.of(context).fillAllFields, Colors.red);
// //       return;
// //     }

// //     var user = await _dbHelper.loginUser(email, password);

// //     if (user != null) {
// //       _showSnackBar(AppLocalizations.of(context).welcome, Colors.green);
// //       Navigator.pushReplacement(
// //         context,
// //         MaterialPageRoute(builder: (context) => const HomeScreen()),
// //       );
// //       final prefs = await SharedPreferences.getInstance();
// //       await prefs.setBool('isLoggedIn', true);

// //       Navigator.pushReplacement(
// //         context,
// //         MaterialPageRoute(builder: (context) => const HomeScreen()),
// //       );
// //     } else {
// //       _showSnackBar(AppLocalizations.of(context).disease, Colors.red);
// //     }
// //   }

// //   void _showSnackBar(String message, Color color) {
// //     ScaffoldMessenger.of(
// //       context,
// //     ).showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final localeProvider = Provider.of<LocaleProvider>(context);

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(AppLocalizations.of(context).logpage),
// //         backgroundColor: const Color(0xFF2E7D32),
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.language),
// //             onPressed: () {
// //               final newLocale =
// //                   localeProvider.locale.languageCode == 'en'
// //                       ? const Locale('ar')
// //                       : const Locale('en');
// //               localeProvider.setLocale(newLocale);
// //             },
// //           ),
// //         ],
// //       ),
// //       body: Container(
// //         decoration: const BoxDecoration(
// //           gradient: LinearGradient(
// //             colors: [Color(0xFFE8F5E9), Color(0xFFC8E6C9)],
// //             begin: Alignment.topLeft,
// //             end: Alignment.bottomRight,
// //           ),
// //         ),
// //         padding: const EdgeInsets.all(24),
// //         child: Center(
// //           child: SingleChildScrollView(
// //             child: Column(
// //               children: [
// //                 const SizedBox(height: 20),
// //                 CircleAvatar(
// //                   radius: 80,
// //                   backgroundImage: AssetImage('assets/icon/cowsxl.jpg'),
// //                 ),
// //                 const SizedBox(height: 20),
// //                 Text(
// //                   AppLocalizations.of(context).welcome,
// //                   style: const TextStyle(
// //                     fontSize: 28,
// //                     fontWeight: FontWeight.bold,
// //                     color: Color(0xFF1B5E20),
// //                   ),
// //                 ),
// //                 const SizedBox(height: 20),
// //                 TextField(
// //                   controller: _emailController,
// //                   decoration: InputDecoration(
// //                     labelText: AppLocalizations.of(context).email,
// //                     border: const OutlineInputBorder(),
// //                   ),
// //                 ),
// //                 const SizedBox(height: 15),
// //                 TextField(
// //                   controller: _passwordController,
// //                   obscureText: true,
// //                   decoration: InputDecoration(
// //                     labelText: AppLocalizations.of(context).password,
// //                     border: const OutlineInputBorder(),
// //                   ),
// //                 ),
// //                 const SizedBox(height: 20),
// //                 SizedBox(
// //                   width: double.infinity,
// //                   child: ElevatedButton(
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor: const Color(0xFF1B5E20),
// //                       padding: const EdgeInsets.symmetric(vertical: 14),
// //                     ),
// //                     onPressed: _login,
// //                     child: Text(
// //                       AppLocalizations.of(context).log,
// //                       style: const TextStyle(fontSize: 18, color: Colors.white),
// //                     ),
// //                   ),
// //                 ),
// //                 TextButton(
// //                   onPressed:
// //                       () => Navigator.push(
// //                         context,
// //                         MaterialPageRoute(
// //                           builder: (_) => const RegisterScreen(),
// //                         ),
// //                       ),
// //                   child: Text(
// //                     AppLocalizations.of(context).goreg,
// //                     style: const TextStyle(color: Color(0xFF388E3C)),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:cows_care/register.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// import 'app_localization.dart';
// import 'localaization.dart';
// import 'database_helper.dart';
// import 'home.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final DatabaseHelper _dbHelper = DatabaseHelper();

//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   void _loginWithEmailPassword() async {
//     String email = _emailController.text.trim();
//     String password = _passwordController.text;

//     if (email.isEmpty || password.isEmpty) {
//       _showSnackBar(AppLocalizations.of(context).fillAllFields, Colors.red);
//       return;
//     }

//     var user = await _dbHelper.loginUser(email, password);

//     if (user != null) {
//       await _onLoginSuccess();
//     } else {
//       _showSnackBar(AppLocalizations.of(context).disease, Colors.red);
//     }
//   }

//   Future<void> _loginWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//       if (googleUser == null) {
//         _showSnackBar("تم إلغاء تسجيل الدخول", Colors.orange);
//         return;
//       }

//       final GoogleSignInAuthentication googleAuth =
//           await googleUser.authentication;

//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       await _auth.signInWithCredential(credential);

//       await _onLoginSuccess();
//     } catch (e) {
//       _showSnackBar("فشل تسجيل الدخول: $e", Colors.red);
//     }
//   }

//   Future<void> _onLoginSuccess() async {
//     _showSnackBar(AppLocalizations.of(context).welcome, Colors.green);
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('isLoggedIn', true);
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => const HomeScreen()),
//     );
//   }

//   void _showSnackBar(String message, Color color) {
//     ScaffoldMessenger.of(
//       context,
//     ).showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
//   }

//   @override
//   Widget build(BuildContext context) {
//     final localeProvider = Provider.of<LocaleProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(AppLocalizations.of(context).logpage),
//         backgroundColor: const Color(0xFF2E7D32),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.language),
//             onPressed: () {
//               final newLocale =
//                   localeProvider.locale.languageCode == 'en'
//                       ? const Locale('ar')
//                       : const Locale('en');
//               localeProvider.setLocale(newLocale);
//             },
//           ),
//         ],
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFFE8F5E9), Color(0xFFC8E6C9)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         padding: const EdgeInsets.all(24),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 const SizedBox(height: 20),
//                 const CircleAvatar(
//                   radius: 80,
//                   backgroundImage: AssetImage('assets/icon/cowsxl.jpg'),
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   AppLocalizations.of(context).welcome,
//                   style: const TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF1B5E20),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 TextField(
//                   controller: _emailController,
//                   decoration: InputDecoration(
//                     labelText: AppLocalizations.of(context).email,
//                     border: const OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 TextField(
//                   controller: _passwordController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     labelText: AppLocalizations.of(context).password,
//                     border: const OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//                       padding: const EdgeInsets.symmetric(vertical: 14),
//                     ),
//                     onPressed: _loginWithEmailPassword,
//                     child: Text(
//                       AppLocalizations.of(context).log,
//                       style: const TextStyle(
//                         fontSize: 18,
//                         color: Color.fromARGB(255, 7, 162, 69),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),

//                 // أو
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Divider(
//                         color: const Color.fromARGB(
//                           255,
//                           0,
//                           0,
//                           0,
//                         ).withOpacity(0.5),
//                         thickness: 1,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       child: Text(
//                         AppLocalizations.of(context).or,
//                         style: const TextStyle(
//                           color: Color.fromARGB(255, 0, 0, 0),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: Divider(
//                         color: const Color.fromARGB(
//                           255,
//                           0,
//                           0,
//                           0,
//                         ).withOpacity(0.5),
//                         thickness: 1,
//                       ),
//                     ),
//                   ],
//                 ),

//                 const SizedBox(height: 20),

//                 // OutlinedButton.icon(
//                 //   icon: const Icon(Icons.login, color: Color(0xFF1B5E20)),
//                 //   label: const Text(
//                 //     'تسجيل الدخول بجوجل',
//                 //     style: TextStyle(color: Color(0xFF1B5E20)),
//                 //   ),
//                 //   onPressed: _loginWithGoogle,
//                 // ),
//                 Container(
//                   color: Colors.white,
//                   child: SizedBox(
//                     width: double.infinity,
//                     height: 50,

//                     child: OutlinedButton(
//                       onPressed: _loginWithGoogle,
//                       style: OutlinedButton.styleFrom(
//                         side: const BorderSide(color: Colors.white),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,

//                         children: [
//                           Image.asset(
//                             'assets/icon/google.png',
//                             height: 50,
//                             width: 50,
//                           ),
//                           const SizedBox(width: 10),
//                           Text(
//                             AppLocalizations.of(context).signInWithGoogle,
//                             style: const TextStyle(
//                               fontSize: 16,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 10),
//                 TextButton(
//                   onPressed:
//                       () => Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (_) => const RegisterScreen(),
//                         ),
//                       ),
//                   child: Text(
//                     AppLocalizations.of(context).goreg,
//                     style: const TextStyle(color: Color(0xFF388E3C)),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'register.dart';
import 'app_localization.dart';
import 'localaization.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _loginWithEmailPassword() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      _showSnackBar(AppLocalizations.of(context).fillAllFields, Colors.red);
      return;
    }

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      await _onLoginSuccess();
    } catch (e) {
      _showSnackBar("فشل تسجيل الدخول: ${e.toString()}", Colors.red);
    }
  }

  Future<void> _loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        _showSnackBar("تم إلغاء تسجيل الدخول", Colors.orange);
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
      await _onLoginSuccess();
    } catch (e) {
      _showSnackBar("فشل تسجيل الدخول: $e", Colors.red);
    }
  }

  Future<void> _onLoginSuccess() async {
    _showSnackBar(AppLocalizations.of(context).welcome, Colors.green);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
  }

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context).logpage),
        backgroundColor: const Color(0xFF2E7D32),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE8F5E9), Color(0xFFC8E6C9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/icon/cowsxl.jpg'),
                ),
                const SizedBox(height: 20),
                Text(
                  AppLocalizations.of(context).welcome,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B5E20),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).email,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).password,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const HomeScreen()),
                      );
                    },

                    //  _loginWithEmailPassword,
                    child: Text(
                      AppLocalizations.of(context).log,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color(0xFF1B5E20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Expanded(child: Divider(color: Colors.black54)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(AppLocalizations.of(context).or),
                    ),
                    const Expanded(child: Divider(color: Colors.black54)),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  color: Colors.white,
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton(
                      onPressed: _loginWithGoogle,
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icon/google.png',
                            height: 40,
                            width: 40,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            AppLocalizations.of(context).signInWithGoogle,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const RegisterScreen()),
                    );
                  },
                  child: Text(
                    AppLocalizations.of(context).goreg,
                    style: const TextStyle(color: Color(0xFF388E3C)),
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
