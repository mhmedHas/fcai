import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const _localizedValues = {
    'en': {
      "chat": "chat bot",
      "logout": "log out",
      "userg": "user guide",
      'welcome': ' Cows Care ',
      'start_diagnosis': 'Start Diagnosis',
      'capture_image': 'Capture or Upload an Image of the Cow',
      'capture': 'Capture Image',
      'upload': 'Upload Image',
      'results': 'Diagnosis Results',
      'disease': 'Disease',
      'loading': 'Loading...',
      "analyzing": "Analyzing...",
      'confidence': 'Confidence',
      'back_home': 'Back to Home',
      'login_page': 'Login Page',
      'register_page': 'Register Page',
      'emil': 'Email',
      'login': 'Log in',
      'go_to_login': 'Have email..? Login ',
      'go_to_register': "Don't have profile..? register ",
      'password': ' password',
      'app_description':
          'Capture a cow\'s image and let AI analyze for potential diseases.',
      'how_it_works': 'How does the app work?',
      'ai_powered': 'Powered by AI with 98% accuracy.',
      'tip_label': 'Tip of the Day',
      'tip1': 'Make sure cows always have clean water.',
      'tip2': 'Good ventilation prevents respiratory issues.',
      'tip3': 'Monitor the cow’s weight regularly.',
      'capture_or_upload': 'Capture or upload a cow image.',
      'ai_process': 'AI processes the image and detects diseases.',
      'instant_results': 'You get instant results with confidence level.',
      'settings': 'Settings',
      'language': 'Language',
      'app_info': 'App Information',
      "fill_all_fields": "Please fill in all fields",
      'privacy_policy': 'Privacy Policy',
      'version': 'Version',
      'language_description': 'Change app language between English and Arabic',
      'version_info': 'Current version: 1.0.0 - Last update: January 1, 2024',
      'opening_privacy_policy': 'Opening privacy policy in browser',
      'diagnosis_guide_title': 'Diagnosis Guide',
      'diagnosis_step1': 'Capture or upload a clear cow image',
      'diagnosis_step2': 'Wait for analysis to complete',
      'diagnosis_step3': 'View results and treatment suggestions',
      'how_it_works_step1': 'Uses AI to analyze cow images',
      'how_it_works_step2': 'Studies disease signs in the image',
      'how_it_works_step3':
          'Provides preliminary diagnosis with confidence level',
      'faq1_question': 'How accurate is the diagnosis?',
      'faq1_answer':
          'The app works with up to 98% accuracy in ideal conditions with clear images',
      'faq2_question': 'Can it be used for diseases not listed?',
      'faq2_answer':
          'Currently focuses on common cow diseases and will be updated',
      'faq3_question': 'How to ensure best results?',
      'faq3_answer':
          'Take a clear picture in good lighting showing disease signs clearly',
      'signIn': 'Sign In',
      'alreadyHaveAccount': 'Already have an account?',
      'signInWithGoogle': 'Sign in with Google',
      'or': 'or',
      'register': 'Register',
      'passwordMismatch': 'Passwords do not match',
      'confirmPassword': 'Confirm Password',
      'passwordLength': 'Password must be at least 6 characters',
      'passwordRequired': 'Password is required',
      'invalidEmail': 'Invalid email address',
      'emailRequired': 'Email is required',
      'createAccount': 'Create Account',
      'registrationError': 'Registration failed. Please try again.',
      'emailInUse': 'This email is already in use',
      'weakPassword': 'The password is too weak',
      'registrationSuccess': 'Registration successful!',
      "home": "home",
    },
    'ar': {
      "chat": "  المساعد الذكى",
      "logout": "تسجيل الخروج",

      'welcome': ' صحة الابقار',
      'start_diagnosis': 'بدء التشخيص',
      'capture_image': 'قم بالتقاط أو تحميل صورة البقرة',
      'capture': 'التقاط صورة',
      'upload': 'تحميل صورة',
      'results': 'نتائج التشخيص',
      'disease': 'المرض',
      'loading': '...جارى التحميل',
      "analyzing": "جارى التحليل...",
      'confidence': 'نسبة الثقة',
      'back_home': 'العودة إلى الرئيسية',
      'login_page': 'تسجيل الدخول',
      'register_page': 'انشاء حساب',
      'emil': ' اسم المستخدم',
      'login': 'دخول',
      'go_to_login': 'لديك حساب بالفعل..؟ تسجيل الدخول ',
      'go_to_register': 'ليس لديك حساب..؟ انشئ حساب  ',
      'password': 'كلمة المرور',
      'app_description':
          'قم بالتقاط صورة للبقرة وسيقوم التطبيق بتحليلها لاكتشاف المرض المحتمل باستخدام الذكاء الاصطناعي.',
      'how_it_works': 'كيف يعمل التطبيق؟',
      'ai_powered': 'مدعوم بتقنية الذكاء الاصطناعي بنسبة دقة 98٪.',
      'tip_label': 'نصيحة اليوم',
      'tip1': 'وفّر ماء نظيف للبقرة يوميًا.',
      'tip2': 'التهوية الجيدة تحمي من الأمراض التنفسية.',
      'tip3': 'راقب وزن البقرة بشكل دوري.',
      'capture_or_upload': 'قم بالتقاط أو تحميل صورة البقرة.',
      'ai_process': 'يقوم الذكاء الاصطناعي بتحليل الصورة واكتشاف الأمراض.',
      'instant_results': 'تحصل على النتائج فورًا مع نسبة الثقة.',
      "fill_all_fields": "الرجاء إدخال جميع الحقول",
      'settings': 'الإعدادات',
      'language': 'اللغة',
      'app_info': 'معلومات التطبيق',
      'privacy_policy': 'سياسة الخصوصية',
      'version': 'الإصدار',
      'language_description': 'تغيير لغة التطبيق بين الإنجليزية والعربية',
      'version_info': 'الإصدار الحالي: 1.0.0 - آخر تحديث: ١ يناير ٢٠٢٤',
      'opening_privacy_policy': 'سيتم فتح سياسة الخصوصية في المتصفح',
      'diagnosis_guide_title': 'دليل التشخيص',
      'diagnosis_step1': 'قم بالتقاط أو تحميل صورة واضحة للبقرة',
      'diagnosis_step2': 'انتظر حتى ينتهي التحليل',
      'diagnosis_step3': 'اطلع على النتائج ونصائح العلاج',
      'how_it_works_step1': 'يستخدم الذكاء الاصطناعي لتحليل صور الأبقار',
      'how_it_works_step2': 'يدرس العلامات المرضية في الصورة',
      'how_it_works_step3': 'يقدم تشخيص أولي مع نسبة ثقة',
      'faq1_question': 'ما مدى دقة التشخيص؟',
      'faq1_answer':
          'التطبيق يعمل بدقة تصل إلى 98% في الظروف المثالية مع صور واضحة',
      'faq2_question': 'هل يمكن استخدامه لأمراض أخرى غير المدرجة؟',
      'faq2_answer':
          'حاليًا يركز التطبيق على الأمراض الشائعة للأبقار وسيتم التحديث',
      'faq3_question': 'كيف أضمن أفضل نتيجة؟',
      'faq3_answer':
          'التقط صورة واضحة في إضاءة جيدة مع ظهور العلامات المرضية بوضوح',
      'signIn': 'تسجيل الدخول',
      'alreadyHaveAccount': 'هل لديك حساب؟',
      'signInWithGoogle': 'تسجيل الدخول باستخدام جوجل',
      'or': 'أو',
      "userg": "دليل المستخدم",
      'register': 'إنشاء حساب',
      'passwordMismatch': 'كلمتا المرور غير متطابقتين',
      'confirmPassword': 'تأكيد كلمة المرور',
      'passwordLength': 'يجب أن تكون كلمة المرور 6 أحرف على الأقل',
      'passwordRequired': 'كلمة المرور مطلوبة',
      'invalidEmail': 'البريد الإلكتروني غير صالح',
      'emailRequired': 'البريد الإلكتروني مطلوب',
      'createAccount': 'إنشاء حساب',
      'registrationError': 'فشل التسجيل. حاول مرة أخرى.',
      'emailInUse': 'هذا البريد الإلكتروني مستخدم بالفعل',
      'weakPassword': 'كلمة المرور ضعيفة جدًا',
      'registrationSuccess': 'تم التسجيل بنجاح!',
      "home": " الصفحه الاساسيه",
    },
  };

  String get welcome => _localizedValues[locale.languageCode]!['welcome']!;
  String get home => _localizedValues[locale.languageCode]!['home']!;
  String get chat => _localizedValues[locale.languageCode]!['chat']!;
  String get startDiagnosis =>
      _localizedValues[locale.languageCode]!['start_diagnosis']!;
  String get captureImage =>
      _localizedValues[locale.languageCode]!['capture_image']!;
  String get logout => _localizedValues[locale.languageCode]!['logout']!;

  String get capture => _localizedValues[locale.languageCode]!['capture']!;
  String get upload => _localizedValues[locale.languageCode]!['upload']!;
  String get results => _localizedValues[locale.languageCode]!['results']!;
  String get disease => _localizedValues[locale.languageCode]!['disease']!;
  String get loading => _localizedValues[locale.languageCode]!['loading']!;
  String get goreg => _localizedValues[locale.languageCode]!['go_to_register']!;
  String get confidence =>
      _localizedValues[locale.languageCode]!['confidence']!;
  String get fillAllFields =>
      _localizedValues[locale.languageCode]!['fill_all_fields']!;
  String get email => _localizedValues[locale.languageCode]!['emil']!;

  String get logpage => _localizedValues[locale.languageCode]!['login_page']!;
  String get regpage =>
      _localizedValues[locale.languageCode]!['register_page']!;
  String get userg => _localizedValues[locale.languageCode]!['userg']!;
  String get password => _localizedValues[locale.languageCode]!['password']!;
  String get log => _localizedValues[locale.languageCode]!['login']!;
  String get gologin => _localizedValues[locale.languageCode]!['go_to_login']!;
  // ///////

  String get signIn => _localizedValues[locale.languageCode]!['signIn']!;
  String get alreadyHaveAccount =>
      _localizedValues[locale.languageCode]!['alreadyHaveAccount']!;
  String get signInWithGoogle =>
      _localizedValues[locale.languageCode]!['signInWithGoogle']!;
  String get or => _localizedValues[locale.languageCode]!['or']!;
  String get register => _localizedValues[locale.languageCode]!['register']!;
  String get passwordMismatch =>
      _localizedValues[locale.languageCode]!['passwordMismatch']!;
  String get confirmPassword =>
      _localizedValues[locale.languageCode]!['confirmPassword']!;
  String get passwordLength =>
      _localizedValues[locale.languageCode]!['passwordLength']!;
  String get passwordRequired =>
      _localizedValues[locale.languageCode]!['passwordRequired']!;
  String get invalidEmail =>
      _localizedValues[locale.languageCode]!['invalidEmail']!;
  String get emailRequired =>
      _localizedValues[locale.languageCode]!['emailRequired']!;
  String get createAccount =>
      _localizedValues[locale.languageCode]!['createAccount']!;
  String get registrationError =>
      _localizedValues[locale.languageCode]!['registrationError']!;
  String get emailInUse =>
      _localizedValues[locale.languageCode]!['emailInUse']!;
  String get weakPassword =>
      _localizedValues[locale.languageCode]!['weakPassword']!;
  String get registrationSuccess =>
      _localizedValues[locale.languageCode]!['registrationSuccess']!;

  String get backHome => _localizedValues[locale.languageCode]!['back_home']!;
  String get analyzing => _localizedValues[locale.languageCode]!['analyzing']!;
  String get appDescription =>
      _localizedValues[locale.languageCode]!['app_description']!;
  String get howItWorks =>
      _localizedValues[locale.languageCode]!['how_it_works']!;
  String get aiPowered => _localizedValues[locale.languageCode]!['ai_powered']!;
  String get tipLabel => _localizedValues[locale.languageCode]!['tip_label']!;
  String get tip1 => _localizedValues[locale.languageCode]!['tip1']!;
  String get tip2 => _localizedValues[locale.languageCode]!['tip2']!;
  String get tip3 => _localizedValues[locale.languageCode]!['tip3']!;
  String get captureOrUpload =>
      _localizedValues[locale.languageCode]!['capture_or_upload']!;
  String get aiProcess => _localizedValues[locale.languageCode]!['ai_process']!;
  String get instantResults =>
      _localizedValues[locale.languageCode]!['instant_results']!;
  String get settings => _localizedValues[locale.languageCode]!['settings']!;
  String get language => _localizedValues[locale.languageCode]!['language']!;
  String get appInfo => _localizedValues[locale.languageCode]!['app_info']!;
  String get privacyPolicy =>
      _localizedValues[locale.languageCode]!['privacy_policy']!;
  String get version => _localizedValues[locale.languageCode]!['version']!;
  String get languageDescription =>
      _localizedValues[locale.languageCode]!['language_description']!;
  String get versionInfo =>
      _localizedValues[locale.languageCode]!['version_info']!;
  String get openingPrivacyPolicy =>
      _localizedValues[locale.languageCode]!['opening_privacy_policy']!;
  String get diagnosisGuideTitle =>
      _localizedValues[locale.languageCode]!['diagnosis_guide_title']!;
  String get diagnosisStep1 =>
      _localizedValues[locale.languageCode]!['diagnosis_step1']!;
  String get diagnosisStep2 =>
      _localizedValues[locale.languageCode]!['diagnosis_step2']!;
  String get diagnosisStep3 =>
      _localizedValues[locale.languageCode]!['diagnosis_step3']!;
  String get howItWorksStep1 =>
      _localizedValues[locale.languageCode]!['how_it_works_step1']!;
  String get howItWorksStep2 =>
      _localizedValues[locale.languageCode]!['how_it_works_step2']!;
  String get howItWorksStep3 =>
      _localizedValues[locale.languageCode]!['how_it_works_step3']!;
  String get faq1Question =>
      _localizedValues[locale.languageCode]!['faq1_question']!;
  String get faq1Answer =>
      _localizedValues[locale.languageCode]!['faq1_answer']!;
  String get faq2Question =>
      _localizedValues[locale.languageCode]!['faq2_question']!;
  String get faq2Answer =>
      _localizedValues[locale.languageCode]!['faq2_answer']!;
  String get faq3Question =>
      _localizedValues[locale.languageCode]!['faq3_question']!;
  String get faq3Answer =>
      _localizedValues[locale.languageCode]!['faq3_answer']!;
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
