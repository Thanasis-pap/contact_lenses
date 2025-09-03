import 'package:contact_lenses/global_dirs.dart';

class Heading {
  static Widget title(BuildContext context,String text) {
    return Text(
    text,
    style: TextStyle(fontSize: 22.sp),
    );
  }
}