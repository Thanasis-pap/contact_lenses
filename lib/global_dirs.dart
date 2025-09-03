export 'package:flutter/material.dart';
export 'package:auto_size_text/auto_size_text.dart';
export 'package:get/get.dart';
export 'package:shared_preferences/shared_preferences.dart';
export 'package:contact_lenses/pages/myopiaedit.dart';
export 'package:contact_lenses/pages/astigmaedit.dart';
export 'package:contact_lenses/pages/presbyopiaedit.dart';
export 'package:contact_lenses/pages/infoedit.dart';
export 'package:contact_lenses/pages/parameters_page.dart';
export 'package:contact_lenses/Widgets/myopia_card.dart';
export 'package:contact_lenses/Widgets/astigmatism_card.dart';
export 'package:contact_lenses/Widgets/info_card.dart';
export 'package:contact_lenses/Widgets/presbyopia_card.dart';
export 'package:contact_lenses/Widgets/checklifespan.dart';
export 'package:contact_lenses/Widgets/counter.dart';
export 'package:contact_lenses/pages/timestamps_page.dart';
export 'package:contact_lenses/Widgets/tips.dart';
export 'package:contact_lenses/Widgets/title.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:contact_lenses/pages/lenses_on_page.dart';
export 'package:contact_lenses/pages/settings_page.dart';

class Global {
  static double fontSize = 18;
  static bool myopia = true;
  static bool astigmatism = false;
  static bool presbyopia = false;
  static bool tips = false;
  static int leftEye = 0;
  static int rightEye = 0;
  static List<DateTime> timestamps = [];

  static List<String> lensesInfo = ['', 'Daily', '', '', '', '','',''];
  static List<String> myopiaParams = ['0.00','0.00'];
  static List<String> astigmaParams = ['0.00','0','0.00','0'];
  static List<String> presbyopiaParams = ['0.00','0.00'];
}