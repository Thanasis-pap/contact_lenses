import 'package:contact_lenses/global_dirs.dart';
import 'package:flutter/services.dart';

class GeneralInfo extends StatefulWidget {
  const GeneralInfo({super.key});

  @override
  _GeneralInfo createState() => _GeneralInfo();
}

class _GeneralInfo extends State<GeneralInfo> {
  List<String> listOfValue = [
    'Daily',
    'Weekly',
    '15 Days',
    'Monthly',
    'Six Months',
    'Yearly',
  ];

  List<String> previousValues = Global.lensesInfo;

  void getInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      Global.lensesInfo =
          (prefs.getStringList('infoParams') ?? ['', 'Daily', '', '', '', '']);
    });
  }

  void setStringList(List<String> infoList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setStringList('infoParams', infoList);
    });
  }

  @override
  void initState() {
    super.initState();
    getInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,

        title: const Text('Lenses Info'),
        centerTitle: true,
      ),
      body: Center(
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Lenses Brand',
                      style: TextStyle(fontSize: Global.fontSize + 2),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 280,
                      height: 40,
                      child: TextField(
                        maxLength: 22,
                        style: TextStyle(fontSize: Global.fontSize),
                        onChanged: (text) {
                          Global.lensesInfo[0] = text;
                          setStringList(Global.lensesInfo);
                        },
                        decoration: InputDecoration(
                          labelText: previousValues[0],
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          counterText: '',
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.transparent, width: 0),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.transparent, width: 0),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          filled: true,
                          fillColor:
                              Theme.of(context).highlightColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Lenses Duration',
                      style: TextStyle(fontSize: Global.fontSize + 2),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 280,
                      height: 40,
                      child: Container(
                        height: 36.0,
                        width: 280.0,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                            color: Theme.of(context).highlightColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: DropdownButton(
                          isExpanded: true,
                          // Initial Value
                          value: Global.lensesInfo[1],
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),
                          // Array list of items
                          items: listOfValue.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              Global.lensesInfo[1] = newValue!;
                              setStringList(Global.lensesInfo);
                            });
                          },
                          underline: const SizedBox(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Left Lens',
                      style: TextStyle(fontSize: Global.fontSize + 2),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Curvature (BC)',
                        style: TextStyle(fontSize: Global.fontSize),
                      ),
                      SizedBox(
                        width: 100,
                        height: 40,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          maxLength: 6,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'(^\d*\.?\d*)'))
                          ],
                          style: TextStyle(fontSize: Global.fontSize),
                          onChanged: (text) {
                            Global.lensesInfo[2] = text;
                            setStringList(Global.lensesInfo);
                          },
                          decoration: InputDecoration(
                            labelText: previousValues[2],
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            counterText: '',
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 0),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 0),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            filled: true,
                            fillColor:
                                Theme.of(context).highlightColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Average (DIA)',
                        style: TextStyle(fontSize: Global.fontSize),
                      ),
                      SizedBox(
                        width: 100,
                        height: 40,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          maxLength: 6,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'(^\d*\.?\d*)'))
                          ],
                          style: TextStyle(fontSize: Global.fontSize),
                          onChanged: (text) {
                            Global.lensesInfo[3] = text;
                            setStringList(Global.lensesInfo);
                          },
                          decoration: InputDecoration(
                            labelText: previousValues[3],
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            counterText: '',
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 0),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 0),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            filled: true,
                            fillColor:
                                Theme.of(context).highlightColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40.0),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Right Lens',
                      style: TextStyle(fontSize: Global.fontSize + 2),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Curvature (BC)',
                        style: TextStyle(fontSize: Global.fontSize),
                      ),
                      SizedBox(
                        width: 100,
                        height: 40,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          maxLength: 6,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'(^\d*\.?\d*)'))
                          ],
                          style: TextStyle(fontSize: Global.fontSize),
                          onChanged: (text) {
                            Global.lensesInfo[4] = text;
                            setStringList(Global.lensesInfo);
                          },
                          decoration: InputDecoration(
                            labelText: previousValues[4],
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            counterText: '',
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 0),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 0),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            filled: true,
                            fillColor:
                                Theme.of(context).highlightColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Average (DIA)',
                        style: TextStyle(fontSize: Global.fontSize),
                      ),
                      SizedBox(
                        width: 100,
                        height: 40,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          maxLength: 6,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'(^\d*\.?\d*)'))
                          ],
                          style: TextStyle(fontSize: Global.fontSize),
                          onChanged: (text) {
                            Global.lensesInfo[5] = text;
                            setStringList(Global.lensesInfo);
                          },
                          decoration: InputDecoration(
                            labelText: previousValues[5],
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            counterText: '',
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 0),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 0),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            filled: true,
                            fillColor:
                                Theme.of(context).highlightColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //const SizedBox(height: 300.0),
                ],
              ),
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/home', (Route<dynamic> route) => false);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.home),
      ),
    );
  }
}
