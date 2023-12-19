import 'package:contact_lenses/global_dirs.dart';

class Heading {
  static Widget title(BuildContext context,String text) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      width: Global.fontSize * 10,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).highlightColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: Global.fontSize),
      ),
    );
  }
}