import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const _localizedValues = {
    'en': {
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
      'emil': 'emil',
      'login': 'Login',
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
    },
    'ar': {
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
    },
  };

  String get welcome => _localizedValues[locale.languageCode]!['welcome']!;
  String get startDiagnosis =>
      _localizedValues[locale.languageCode]!['start_diagnosis']!;
  String get captureImage =>
      _localizedValues[locale.languageCode]!['capture_image']!;
  String get capture => _localizedValues[locale.languageCode]!['capture']!;
  String get upload => _localizedValues[locale.languageCode]!['upload']!;
  String get results => _localizedValues[locale.languageCode]!['results']!;
  String get disease => _localizedValues[locale.languageCode]!['disease']!;
  String get loading => _localizedValues[locale.languageCode]!['loading']!;
  String get goreg => _localizedValues[locale.languageCode]!['go_to_register']!;
  String get confidence =>
      _localizedValues[locale.languageCode]!['confidence']!;

  String get logpage => _localizedValues[locale.languageCode]!['login_page']!;
  String get regpage =>
      _localizedValues[locale.languageCode]!['register_page']!;
  String get email => _localizedValues[locale.languageCode]!['emil']!;
  String get password => _localizedValues[locale.languageCode]!['password']!;
  String get log => _localizedValues[locale.languageCode]!['login']!;
  String get gologin => _localizedValues[locale.languageCode]!['go_to_login']!;

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
