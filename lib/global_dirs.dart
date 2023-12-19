export 'package:flutter/material.dart';
export 'package:auto_size_text/auto_size_text.dart';
export 'package:get/get.dart';
export 'package:shared_preferences/shared_preferences.dart';
export 'package:contact_lenses/EyeConditions/myopiaedit.dart';
export 'package:contact_lenses/EyeConditions/astigmaedit.dart';
export 'package:contact_lenses/EyeConditions/presbyopiaedit.dart';
export 'package:contact_lenses/EyeConditions/infoedit.dart';
export 'package:contact_lenses/Widgets/checklifespan.dart';
export 'package:contact_lenses/Widgets/counter.dart';
export 'package:contact_lenses/Widgets/timestamps.dart';
export 'package:contact_lenses/Widgets/tips.dart';
export 'package:contact_lenses/Widgets/title.dart';

class Global {
  static double fontSize = 18;
  static bool myopia = true;
  static bool astigmatism = false;
  static bool presbyopia = false;
  static bool tips = false;
  static int leftEye = 0;
  static int rightEye = 0;
  static List<String> timestamps = [];

  static List<String> lensesInfo = ['', 'Daily', '', '', '', '','',''];
  static List<String> myopiaParams = ['0.00','0.00'];
  static List<String> astigmaParams = ['0.00','0','0.00','0'];
  static List<String> presbyopiaParams = ['0.00','0.00'];
}