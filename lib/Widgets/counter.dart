import '../global_dirs.dart';

class Counter {
  static Widget lensesCount(BuildContext context, String lens, String counter, Alignment alignment) {
    return SizedBox(
      width: 150.0,
      height: 200,
      child: Column(children: [
          Align(
            alignment: alignment,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(lens, style: TextStyle(fontSize: 18.sp)),
            ),
          ),
          Align(
            child: Text(counter, style: TextStyle(fontSize: 65.sp)),
          ),
        ]),

    );
  }
}
