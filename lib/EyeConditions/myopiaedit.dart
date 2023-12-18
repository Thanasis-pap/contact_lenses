import 'package:contact_lenses/global_dirs.dart';

class Myopia extends StatefulWidget {
  const Myopia({super.key});

  @override
  _Myopia createState() => _Myopia();
}

class _Myopia extends State<Myopia> {
  List<String> myopiaSphere = [
    '-9.00',
    '-8.75','-8.50','-8.25','-8.00',
    '-7.75','-7.50','-7.25','-7.00',
    '-6.75','-6.50','-6.25','-6.00',
    '-5.75','-5.50','-5.25','-5.00',
    '-5.75','-5.50','-5.25','-5.00',
    '-4.75','-4.50','-4.25','-4.00',
    '-3.75','-3.50','-3.25','-3.00',
    '-2.75','-2.50','-2.25','-2.00',
    '-1.75','-1.50','-1.25','-1.00',
    '-0.75','-0.50','-0.25',
    '0.00',
    '+0,25','+0.50','+0.75',
    '+1.00','+1,25','+1.50','+1.75',
    '+2.00','+2,25','+2.50','+2.75',
    '+3.00','+3,25','+3.50','+3.75',
    '+4.00','+4,25','+4.50','+4.75',
    '+5.00','+5,25','+5.50','+5.75',
    '+6.00','+6,25','+6.50','+6.75',
    '+7.00','+7,25','+7.50','+7.75',
    '+8.00','+8,25','+8.50','+8.75',
    '+9.00',
  ];

  void getMyopia() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      Global.myopiaParams = (prefs.getStringList('myopiaParams') ?? ['0.00','0.00']);
    });
  }

  void setStringList(List<String> myopiaList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setStringList('myopiaParams', myopiaList);
    });
  }

  @override
  void initState() {
    super.initState();
    getMyopia();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        title: const Text('Myopia/Hyperopia Parameters'),
        centerTitle: true,
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.arrow_back),),
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
                  style: TextStyle(fontSize: Global.fontSize+2),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dioptres/Sphere',
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
                        value: Global.myopiaParams[0],
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: myopiaSphere.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            Global.myopiaParams[0] = newValue!;
                            setStringList(Global.myopiaParams);
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
                  style: TextStyle(fontSize: Global.fontSize+2),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dioptres/Sphere',
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
                        value: Global.myopiaParams[1],
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: myopiaSphere.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            Global.myopiaParams[1] = newValue!;
                            setStringList(Global.myopiaParams);
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
