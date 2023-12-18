import 'package:contact_lenses/global_dirs.dart';

class Astigmatism extends StatefulWidget {
  const Astigmatism({super.key});

  @override
  _Astigmatism createState() => _Astigmatism();
}

class _Astigmatism extends State<Astigmatism> {
  List<String> astigmaCylinder = [
    '0.00',
    '-0,25','-0.50','-0.75',
    '-1.00','-1,25','-1.50','-1.75',
    '-2.00','-2,25','-2.50','-2.75',
    '-3.00','-3,25','-3.50','-3.75',
    '-4.00','-4,25','-4.50','-4.75',
    '-5.00','-5,25','-5.50','-5.75',
    '-6.00','-6,25','-6.50','-6.75',
    '-7.00','-7,25','-7.50','-7.75',
    '-8.00','-8,25','-8.50','-8.75',
    '-9.00',
  ];
  List<String> astigmaAxis = [
    '0','10','20','30','40','50','60','70','80','90','100','110','120','130','140','150','160','170','180'
  ];

  void getAstigmatism() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      Global.astigmaParams= (prefs.getStringList('astigmaParams') ?? ['0.00','0','0.00','0']);
    });
  }

  void setStringList(List<String> astigmaList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setStringList('astigmaParams', astigmaList);
    });
  }

  @override
  void initState() {
    super.initState();
    getAstigmatism();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        title: const Text('Astigmatism Parameters'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    'Cylinder',
                    style: TextStyle(fontSize: Global.fontSize),
                  ),
                  SizedBox(
                    width: 120,
                    height: 40,
                    child: Container(
                      height: 36.0,
                      width: 280.0,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: Theme.of(context).highlightColor,
                          borderRadius: BorderRadius.circular(30)),
                      // dropdown below..
                      child: DropdownButton(
                        isExpanded: true,
                        // Initial Value
                        value: Global.astigmaParams[0],
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: astigmaCylinder.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            Global.astigmaParams[0] = newValue!;
                            setStringList(Global.astigmaParams);
                          });
                        },
                        underline: const SizedBox(),
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
                    'Axis (°)',
                    style: TextStyle(fontSize: Global.fontSize),
                  ),
                  SizedBox(
                    width: 120,
                    height: 40,
                    child: Container(
                      height: 36.0,
                      width: 280.0,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: Theme.of(context).highlightColor,
                          borderRadius: BorderRadius.circular(30)),
                      // dropdown below..
                      child: DropdownButton(
                        isExpanded: true,
                        // Initial Value
                        value: Global.astigmaParams[1],
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: astigmaAxis.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            Global.astigmaParams[1] = newValue!;
                            setStringList(Global.astigmaParams);
                          });
                        },
                        underline: const SizedBox(),
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
                    'Cylinder',
                    style: TextStyle(fontSize: Global.fontSize),
                  ),
                  SizedBox(
                    width: 120,
                    height: 40,
                    child: Container(
                      height: 36.0,
                      width: 280.0,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: Theme.of(context).highlightColor,
                          borderRadius: BorderRadius.circular(30)),
                      // dropdown below..
                      child: DropdownButton(
                        isExpanded: true,
                        // Initial Value
                        value: Global.astigmaParams[2],
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: astigmaCylinder.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            Global.astigmaParams[2] = newValue!;
                            setStringList(Global.astigmaParams);
                          });
                        },
                        underline: const SizedBox(),
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
                    'Axis (°)',
                    style: TextStyle(fontSize: Global.fontSize),
                  ),
                  SizedBox(
                    width: 120,
                    height: 40,
                    child: Container(
                      height: 36.0,
                      width: 280.0,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: Theme.of(context).highlightColor,
                          borderRadius: BorderRadius.circular(30)),
                      // dropdown below..
                      child: DropdownButton(
                        isExpanded: true,
                        // Initial Value
                        value: Global.astigmaParams[3],
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: astigmaAxis.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            Global.astigmaParams[3] = newValue!;
                            setStringList(Global.astigmaParams);
                          });
                        },
                        underline: const SizedBox(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
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
