import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/langs/en_us.dart';
import 'package:vehicle_doctor_mobile/common/langs/zh_hans.dart';
import 'package:vehicle_doctor_mobile/common/langs/zh_hk.dart';

/*

https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPInternational/LanguageandLocaleIDs/LanguageandLocaleIDs.html
https://www.ibabbleon.com/iOS-Language-Codes-ISO-639.html

*/

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static const fallbackLocale = Locale('en', 'US');
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUs,
        'zh_Hans': zhHans,
        'zh_HK': zhHK,
      };
}
