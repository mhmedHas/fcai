// // // import 'package:cows_care/app_localization.dart';

// // // import 'package:flutter/material.dart';
// // // import 'database_helper.dart';

// // // class RegisterScreen extends StatefulWidget {
// // //   const RegisterScreen({Key? key}) : super(key: key);

// // //   @override
// // //   _RegisterScreenState createState() => _RegisterScreenState();
// // // }

// // // class _RegisterScreenState extends State<RegisterScreen> {
// // //   final TextEditingController _emailController = TextEditingController();
// // //   final TextEditingController _passwordController = TextEditingController();
// // //   final DatabaseHelper _dbHelper = DatabaseHelper();

// // //   void _register() async {
// // //     String email = _emailController.text;
// // //     String password = _passwordController.text;

// // //     if (email.isEmpty || password.isEmpty) {
// // //       ScaffoldMessenger.of(context).showSnackBar(
// // //         SnackBar(
// // //           content: Text(AppLocalizations.of(context).loading),
// // //           backgroundColor: Colors.red,
// // //         ),
// // //       );
// // //       return;
// // //     }

// // //     int result = await _dbHelper.registerUser(email, password);

// // //     if (result != -1) {
// // //       ScaffoldMessenger.of(context).showSnackBar(
// // //         SnackBar(
// // //           content: Text(AppLocalizations.of(context).welcome),
// // //           backgroundColor: Colors.green,
// // //         ),
// // //       );
// // //       Navigator.pop(context);
// // //     } else {
// // //       ScaffoldMessenger.of(context).showSnackBar(
// // //         SnackBar(
// // //           content: Text(AppLocalizations.of(context).disease),
// // //           backgroundColor: Colors.red,
// // //         ),
// // //       );
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: Colors.white,
// // //       appBar: AppBar(
// // //         title: Text(
// // //           AppLocalizations.of(context).regpage,
// // //           style: const TextStyle(
// // //             fontSize: 20,
// // //             fontWeight: FontWeight.bold,
// // //             color: Colors.white,
// // //           ),
// // //         ),
// // //         backgroundColor: const Color(0xFF2E7D32),
// // //       ),
// // //       body: Container(
// // //         width: double.infinity,
// // //         height: double.infinity,
// // //         decoration: const BoxDecoration(
// // //           gradient: LinearGradient(
// // //             colors: [Color(0xFFE8F5E9), Color(0xFFC8E6C9)],
// // //             begin: Alignment.topLeft,
// // //             end: Alignment.bottomRight,
// // //           ),
// // //         ),
// // //         child: Center(
// // //           child: SingleChildScrollView(
// // //             padding: const EdgeInsets.symmetric(horizontal: 24.0),
// // //             child: ConstrainedBox(
// // //               constraints: BoxConstraints(maxWidth: 400),
// // //               child: Column(
// // //                 mainAxisSize: MainAxisSize.min,
// // //                 children: [
// // //                   const SizedBox(height: 30),
// // //                   CircleAvatar(
// // //                     radius: 80,
// // //                     backgroundColor: Colors.white,
// // //                     child: ClipOval(
// // //                       child: Image.asset(
// // //                         'assets/icon/cowsxl.jpg',
// // //                         fit: BoxFit.cover,
// // //                         width: 160,
// // //                         height: 160,
// // //                       ),
// // //                     ),
// // //                   ),
// // //                   const SizedBox(height: 20),
// // //                   Text(
// // //                     AppLocalizations.of(context).welcome,
// // //                     style: const TextStyle(
// // //                       fontSize: 28,
// // //                       fontWeight: FontWeight.bold,
// // //                       color: Color(0xFF1B5E20),
// // //                     ),
// // //                   ),
// // //                   const SizedBox(height: 20),
// // //                   TextField(
// // //                     controller: _emailController,
// // //                     decoration: InputDecoration(
// // //                       labelText: AppLocalizations.of(context).email,
// // //                       border: const OutlineInputBorder(),
// // //                     ),
// // //                   ),
// // //                   const SizedBox(height: 15),
// // //                   TextField(
// // //                     controller: _passwordController,
// // //                     obscureText: true,
// // //                     decoration: InputDecoration(
// // //                       labelText: AppLocalizations.of(context).password,
// // //                       border: const OutlineInputBorder(),
// // //                     ),
// // //                   ),
// // //                   const SizedBox(height: 20),
// // //                   SizedBox(
// // //                     width: double.infinity,
// // //                     child: ElevatedButton(
// // //                       style: ElevatedButton.styleFrom(
// // //                         backgroundColor: const Color(0xFF1B5E20),
// // //                         padding: const EdgeInsets.symmetric(vertical: 14),
// // //                       ),
// // //                       onPressed: _register,
// // //                       child: Text(
// // //                         AppLocalizations.of(context).regpage,
// // //                         style: const TextStyle(
// // //                           fontSize: 18,
// // //                           color: Colors.white,
// // //                         ),
// // //                       ),
// // //                     ),
// // //                   ),
// // //                   const SizedBox(height: 10),
// // //                   TextButton(
// // //                     onPressed: () => Navigator.pop(context),
// // //                     child: Text(
// // //                       AppLocalizations.of(context).gologin,
// // //                       style: const TextStyle(color: Color(0xFF388E3C)),
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:cows_care/app_localization.dart';

// // class RegisterScreen extends StatefulWidget {
// //   const RegisterScreen({Key? key}) : super(key: key);

// //   @override
// //   _RegisterScreenState createState() => _RegisterScreenState();
// // }

// // class _RegisterScreenState extends State<RegisterScreen> {
// //   final TextEditingController _emailController = TextEditingController();
// //   final TextEditingController _passwordController = TextEditingController();

// //   final FirebaseAuth _auth = FirebaseAuth.instance;

// //   void _register() async {
// //     String email = _emailController.text.trim();
// //     String password = _passwordController.text.trim();

// //     if (email.isEmpty || password.isEmpty) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(
// //           content: Text(AppLocalizations.of(context).loading),
// //           backgroundColor: Colors.red,
// //         ),
// //       );
// //       return;
// //     }

// //     try {
// //       await _auth.createUserWithEmailAndPassword(
// //         email: email,
// //         password: password,
// //       );

// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(
// //           content: Text(AppLocalizations.of(context).welcome),
// //           backgroundColor: Colors.green,
// //         ),
// //       );
// //       Navigator.pop(context); // ارجع لصفحة تسجيل الدخول
// //     } catch (e) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(
// //           content: Text("${AppLocalizations.of(context).disease}\n${e.toString()}"),
// //           backgroundColor: Colors.red,
// //         ),
// //       );
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         title: Text(
// //           AppLocalizations.of(context).regpage,
// //           style: const TextStyle(
// //             fontSize: 20,
// //             fontWeight: FontWeight.bold,
// //             color: Colors.white,
// //           ),
// //         ),
// //         backgroundColor: const Color(0xFF2E7D32),
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
// //                     AppLocalizations.of(context).welcome,
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
// //                       labelText: AppLocalizations.of(context).email,
// //                       border: const OutlineInputBorder(),
// //                     ),
// //                   ),
// //                   const SizedBox(height: 15),
// //                   TextField(
// //                     controller: _passwordController,
// //                     obscureText: true,
// //                     decoration: InputDecoration(
// //                       labelText: AppLocalizations.of(context).password,
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
// //                       onPressed: _register,
// //                       child: Text(
// //                         AppLocalizations.of(context).regpage,
// //                         style: const TextStyle(
// //                           fontSize: 18,
// //                           color: Colors.white,
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   const SizedBox(height: 10),
// //                   TextButton(
// //                     onPressed: () => Navigator.pop(context),
// //                     child: Text(
// //                       AppLocalizations.of(context).gologin,
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
// import 'package:cows_care/app_localization.dart';
// import 'package:flutter/material.dart';
// import 'database_helper.dart';

// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({Key? key}) : super(key: key);

//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final DatabaseHelper _dbHelper = DatabaseHelper();

//   void _register() async {
//     String email = _emailController.text.trim();
//     String password = _passwordController.text;

//     if (email.isEmpty || password.isEmpty) {
//       _showSnackBar(AppLocalizations.of(context).fillAllFields, Colors.red);
//       return;
//     }

//     int result = await _dbHelper.registerUser(email, password);

//     if (result != -1) {
//       _showSnackBar(AppLocalizations.of(context).welcome, Colors.green);
//       Navigator.pop(context);
//     } else {
//       _showSnackBar(AppLocalizations.of(context).disease, Colors.red);
//     }
//   }

//   void _showSnackBar(String message, Color color) {
//     ScaffoldMessenger.of(
//       context,
//     ).showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(AppLocalizations.of(context).regpage),
//         backgroundColor: const Color(0xFF2E7D32),
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
//                 CircleAvatar(
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
//                       backgroundColor: const Color(0xFF1B5E20),
//                       padding: const EdgeInsets.symmetric(vertical: 14),
//                     ),
//                     onPressed: _register,
//                     child: Text(
//                       AppLocalizations.of(context).regpage,
//                       style: const TextStyle(fontSize: 18, color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () => Navigator.pop(context),
//                   child: Text(
//                     AppLocalizations.of(context).gologin,
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
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cows_care/app_localization.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  Future<void> _registerWithEmail() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      _showSuccessSnackBar(AppLocalizations.of(context).registrationSuccess);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      _showErrorSnackBar(_getErrorMessage(e.code));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _signInWithGoogle() async {
    setState(() => _isLoading = true);

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      _showSuccessSnackBar(AppLocalizations.of(context).welcome);
      Navigator.pop(context);
    } catch (e) {
      _showErrorSnackBar(e.toString());
    } finally {
      setState(() => _isLoading = false);
    }
  }

  String _getErrorMessage(String code) {
    switch (code) {
      case 'weak-password':
        return AppLocalizations.of(context).weakPassword;
      case 'email-already-in-use':
        return AppLocalizations.of(context).emailInUse;
      case 'invalid-email':
        return AppLocalizations.of(context).invalidEmail;
      default:
        return AppLocalizations.of(context).registrationError;
    }
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.green),
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // خلفية متدرجة
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.green.shade800, Colors.green.shade400],
              ),
            ),
          ),

          // محتوى الصفحة
          SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),

                  // شعار التطبيق
                  Hero(
                    tag: 'app-logo',
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/icon/cowsxl.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // عنوان الصفحة
                  Text(
                    AppLocalizations.of(context).createAccount,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // حقل البريد الإلكتروني
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).email,
                      prefixIcon: const Icon(Icons.email, color: Colors.white),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      labelStyle: const TextStyle(color: Colors.white),
                    ),
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context).emailRequired;
                      }
                      if (!value.contains('@')) {
                        return AppLocalizations.of(context).invalidEmail;
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // حقل كلمة المرور
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).password,
                      prefixIcon: const Icon(Icons.lock, color: Colors.white),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      labelStyle: const TextStyle(color: Colors.white),
                    ),
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context).passwordRequired;
                      }
                      if (value.length < 6) {
                        return AppLocalizations.of(context).passwordLength;
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // تأكيد كلمة المرور
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).confirmPassword,
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: Colors.white,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      labelStyle: const TextStyle(color: Colors.white),
                    ),
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value != _passwordController.text) {
                        return AppLocalizations.of(context).passwordMismatch;
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 30),

                  // زر التسجيل
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _registerWithEmail,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child:
                          _isLoading
                              ? const CircularProgressIndicator()
                              : Text(
                                AppLocalizations.of(context).register,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.green.shade800,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // أو
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.white.withOpacity(0.5),
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          AppLocalizations.of(context).or,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.white.withOpacity(0.5),
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // زر تسجيل الدخول بجوجل
                  Container(
                    color: Colors.white,
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,

                      child: OutlinedButton(
                        onPressed: _isLoading ? null : _signInWithGoogle,
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
                              height: 50,
                              width: 50,
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

                  const SizedBox(height: 20),

                  // رابط للدخول
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: RichText(
                      text: TextSpan(
                        text: AppLocalizations.of(context).alreadyHaveAccount,
                        style: const TextStyle(color: Colors.white),
                        children: [
                          TextSpan(
                            text: AppLocalizations.of(context).signIn,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
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
        ],
      ),
    );
  }
}
