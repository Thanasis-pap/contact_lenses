import '../global_dirs.dart';

class EyeCondition {

  static Widget infoCard(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                'Left Lens',
                style: TextStyle(fontSize: Global.fontSize),
              ),
              const SizedBox(height: 20.0),
              Text(
                'Curvature (BC)',
                style:
                TextStyle(fontSize: Global.fontSize - 3),
              ),
              Container(
                width: 75,
                alignment: Alignment.center,
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).highlightColor,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Text(
                  Global.lensesInfo[2],
                  style: TextStyle(fontSize: Global.fontSize),
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Average (DIA)',
                style:
                TextStyle(fontSize: Global.fontSize - 3),
              ),
              Container(
                width: 75,
                alignment: Alignment.center,
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).highlightColor,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Text(
                  Global.lensesInfo[3],
                  style: TextStyle(fontSize: Global.fontSize),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Text(
              'Rigth Lens',
              style: TextStyle(fontSize: Global.fontSize),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Curvature (BC)',
              style: TextStyle(fontSize: Global.fontSize - 3),
            ),
            Container(
              width: 75,
              alignment: Alignment.center,
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Theme.of(context).highlightColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(
                Global.lensesInfo[4],
                style: TextStyle(fontSize: Global.fontSize),
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Average (DIA)',
              style: TextStyle(fontSize: Global.fontSize - 3),
            ),
            Container(
              width: 75,
              alignment: Alignment.center,
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Theme.of(context).highlightColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(
                Global.lensesInfo[5],
                style: TextStyle(fontSize: Global.fontSize),
              ),
            ),
          ],
        ),
      ],
    );
  }

  static Widget myopiaCard(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                'Left Lens',
                style: TextStyle(fontSize: Global.fontSize),
              ),
              const SizedBox(height: 20.0),
              Text(
                'Dioptres/Sphere',
                style: TextStyle(fontSize: Global.fontSize - 3),
              ),
              Container(
                width: 75,
                alignment: Alignment.center,
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).highlightColor,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Text(
                  Global.myopiaParams[0],
                  style: TextStyle(fontSize: Global.fontSize),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Text(
              'Rigth Lens',
              style: TextStyle(fontSize: Global.fontSize),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Dioptres/Sphere',
              style: TextStyle(fontSize: Global.fontSize - 3),
            ),
            Container(
              width: 75,
              alignment: Alignment.center,
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Theme.of(context).highlightColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(
                Global.myopiaParams[1],
                style: TextStyle(fontSize: Global.fontSize),
              ),
            ),
          ],
        ),
      ],
    );
  }

  static Widget astigmatismCard(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                'Left Lens',
                style: TextStyle(fontSize: Global.fontSize),
              ),
              const SizedBox(height: 20.0),
              Text(
                'Cylinder',
                style: TextStyle(fontSize: Global.fontSize - 3),
              ),
              Container(
                width: 75,
                alignment: Alignment.center,
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).highlightColor,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Text(
                  Global.astigmaParams[0],
                  style: TextStyle(fontSize: Global.fontSize),
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Axis',
                style: TextStyle(fontSize: Global.fontSize - 3),
              ),
              Container(
                width: 75,
                alignment: Alignment.center,
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).highlightColor,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Text(
                  '${Global.astigmaParams[1]}°',
                  style: TextStyle(fontSize: Global.fontSize),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Text(
              'Rigth Lens',
              style: TextStyle(fontSize: Global.fontSize),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Cylinder',
              style: TextStyle(fontSize: Global.fontSize - 3),
            ),
            Container(
              width: 75,
              alignment: Alignment.center,
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Theme.of(context).highlightColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(
                Global.astigmaParams[2],
                style: TextStyle(fontSize: Global.fontSize),
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Axis',
              style: TextStyle(fontSize: Global.fontSize - 3),
            ),
            Container(
              width: 75,
              alignment: Alignment.center,
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Theme.of(context).highlightColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(
                '${Global.astigmaParams[3]}°',
                style: TextStyle(fontSize: Global.fontSize),
              ),
            ),
          ],
        ),
      ],
    );
  }

  static Widget presbyopiaCard(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                'Left Lens',
                style: TextStyle(fontSize: Global.fontSize),
              ),
              const SizedBox(height: 20.0),
              Text(
                'Addition',
                style: TextStyle(fontSize: Global.fontSize - 3),
              ),
              Container(
                width: 75,
                alignment: Alignment.center,
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).highlightColor,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Text(
                  Global.presbyopiaParams[0],
                  style: TextStyle(fontSize: Global.fontSize),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Text(
              'Rigth Lens',
              style: TextStyle(fontSize: Global.fontSize),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Addition',
              style: TextStyle(fontSize: Global.fontSize - 3),
            ),
            Container(
              width: 75,
              alignment: Alignment.center,
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Theme.of(context).highlightColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(
                Global.presbyopiaParams[1],
                style: TextStyle(fontSize: Global.fontSize),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
