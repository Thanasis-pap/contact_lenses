import '../global_dirs.dart';

class Timestamps {

  static Widget timestamp(BuildContext context){
    return SizedBox(
      width: 320.0,
      height: 200,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text('You wore your lenses at:'),
              const SizedBox(height: 10.0),
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  primary: true,
                  child: AutoSizeText(
                    Global.timestamps.join('\n'),
                    style: TextStyle(fontSize: Global.fontSize),
                    textAlign: TextAlign.left,
                    minFontSize: Global.fontSize - 8,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
