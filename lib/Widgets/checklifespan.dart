import 'package:contact_lenses/global_dirs.dart';

class Lifespan {
  static List lifespanCheckList = [
    ['Weekly', 7],
    ['15 Days', 15],
    ['Monthly', 30],
    ['6 Months', 180],
    ['Yearly', 365]
  ];
  static var snackBar = const SnackBar(content: Text('Your Lenses have reached their lifespan. Consider replacing'),);

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? alert(BuildContext context) {
    for (int i = 0; i < lifespanCheckList.length; i++) {
      if ((Global.lensesInfo[1]==lifespanCheckList[i][0] && (Global.leftEye>= lifespanCheckList[i][1] || Global.rightEye>=lifespanCheckList[i][1])) ){
        return ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
    return null;
  }
}
