import '../global_dirs.dart';

class Counter {

  static Widget lensesCount(BuildContext context,String lens,String counter){
    return SizedBox(
      width: 140.0,
      height: 100,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius:
          BorderRadius.all(Radius.circular(30)),
        ),
        child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(lens,
                  style: TextStyle(
                      fontSize: Global.fontSize)),
              Text(counter,
                  style: TextStyle(
                      fontSize: Global.fontSize + 10)),
            ]),
      ),
    );
  }
}
