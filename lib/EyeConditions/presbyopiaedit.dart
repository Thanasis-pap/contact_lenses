import 'package:contact_lenses/global_dirs.dart';

class Presbyopia extends StatefulWidget {
  const Presbyopia({super.key});

  @override
  _Presbyopia createState() => _Presbyopia();
}

class _Presbyopia extends State<Presbyopia> {
  List<String> presbyopiaAdd = [
    '0.00',
    '+0,25','+0.50','+0.75',
    '+1.00','+1,25','+1.50','+1.75',
    '+2.00','+2,25','+2.50','+2.75',
    '+3.00',
  ];

  void getPresbyopia() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      Global.presbyopiaParams = (prefs.getStringList('presbyopiaParams') ?? ['0.00','0.00']);
    });
  }

  void setStringList(List<String> presbyopiaList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setStringList('presbyopiaParams', presbyopiaList);
    });
  }

  @override
  void initState() {
    super.initState();
    getPresbyopia();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        title: const Text('Presbyopia Parameters'),
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
                    'Addition',
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
                        value: Global.presbyopiaParams[0],
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: presbyopiaAdd.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            Global.presbyopiaParams[0] = newValue!;
                            setStringList(Global.presbyopiaParams);
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
                    'Addition',
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
                        value: Global.presbyopiaParams[1],
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: presbyopiaAdd.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            Global.presbyopiaParams[1] = newValue!;
                            setStringList(Global.presbyopiaParams);
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
