import 'package:contact_lenses/global_dirs.dart';
import 'package:contact_lenses/EyeConditions/conditions.dart';

class MyHomePage extends StatefulWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void getParams() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      Global.fontSize = (prefs.getDouble('fontsize') ?? 18);
      Global.leftEye = (prefs.getInt('lefteye') ?? 0);
      Global.rightEye = (prefs.getInt('righteye') ?? 0);
      Global.tips = (prefs.getBool('tips') ?? true);
      Global.myopia = (prefs.getBool('myopia') ?? true);
      Global.astigmatism = (prefs.getBool('astigmatism') ?? false);
      Global.presbyopia = (prefs.getBool('presbyopia') ?? false);
      Global.timestamps = (prefs.getStringList('timestamps') ?? []);
      Global.myopiaParams =
          (prefs.getStringList('myopiaParams') ?? ['0.00', '0.00']);
      Global.astigmaParams =
          (prefs.getStringList('astigmaParams') ?? ['0.00', '0', '0.00', '0']);
      Global.presbyopiaParams =
          (prefs.getStringList('presbyopiaParams') ?? ['0.00', '0.00']);
      Global.lensesInfo =
          (prefs.getStringList('infoParams') ?? ['', 'Daily', '', '', '', '']);
    });
  }

  void reset() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Global.lensesInfo = ['', 'Daily', '', '', '', '', '', ''];
    Global.myopiaParams = ['0.00', '0.00'];
    Global.astigmaParams = ['0.00', '0', '0.00', '0'];
    Global.presbyopiaParams = ['0.00', '0.00'];
    setState(() {
      (prefs.setStringList('myopiaParams', Global.myopiaParams));
      (prefs.setStringList('astigmaParams', Global.astigmaParams));
      (prefs.setStringList('presbyopiaParams', Global.presbyopiaParams));
      (prefs.setStringList('infoParams', Global.lensesInfo));
    });
  }

  void setDouble(double size) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setDouble('fontsize', size);
    });
  }

  void setInt(int left, int right) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setInt('lefteye', left);
      prefs.setInt('righteye', right);
    });
  }

  void setStringList(List<String> times) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setStringList('timestamps', times);
    });
  }

  void setBool(bool myopia, bool astigmatism, bool presbyopia) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool('myopia', myopia);
      prefs.setBool('astigmatism', astigmatism);
      prefs.setBool('presbyopia', presbyopia);
    });
  }

  void setTip(bool tips) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool('tips', tips);
    });
  }

  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;

  @override
  void initState() {
    super.initState();
    getParams();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        scrolledUnderElevation: 0.0,
        title: Text(widget.title,
            style: TextStyle(fontSize: Global.fontSize + 10)),
        centerTitle: false,
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home_filled),
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.remove_red_eye),
            icon: Icon(Icons.remove_red_eye_outlined),
            label: 'Lenses\' Parameters',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.settings),
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      body: <Widget>[
        ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44),
              child: Timestamps.timestamp(context),
            ),
            //Timestamps
            //Lenses counter
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Counter.lensesCount(
                            context, 'Left Lens', Global.leftEye.toString()),
                        const SizedBox(height: 10.0),
                        ElevatedButton(
                          onPressed: () {
                            Lifespan.alert(context);
                            Global.leftEye += 1;
                            setInt(Global.leftEye, Global.rightEye);
                          },
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Counter.lensesCount(
                            context, 'Right Lens', Global.rightEye.toString()),
                        const SizedBox(height: 10.0),
                        ElevatedButton(
                          onPressed: () {
                            Lifespan.alert(context);
                            Global.rightEye += 1;
                            setInt(Global.leftEye, Global.rightEye);
                          },
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 50.0),
                SizedBox(
                  height: 75,
                  width: 200,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (Global.tips == false){
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text('Tip:',
                              style: TextStyle(fontSize: Global.fontSize + 10)),
                          content: Text(Tips.selectTip(),
                              style: TextStyle(fontSize: Global.fontSize)),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, 'OK');
                              },
                              child: Text('OK',
                                  style: TextStyle(fontSize: Global.fontSize)),
                            ),
                          ],
                        ),
                      );}
                      Lifespan.alert(context);
                      Global.leftEye++;
                      Global.rightEye++;
                      setInt(Global.leftEye, Global.rightEye);
                      String date = DateTime.now().toString().substring(0, 19);
                      Global.timestamps.add(date);
                      setStringList(Global.timestamps);
                    },
                    icon: const Icon(Icons.remove_red_eye_sharp),
                    label: Text('Lenses on',
                        style: TextStyle(fontSize: Global.fontSize + 4)),
                  ),
                ),
                const SizedBox(height: 75.0),
              ],
            ),
          ],
        ),
        ListView(
          padding: const EdgeInsets.all(15),
          children: <Widget>[
            SizedBox(
              width: 120.0,
              height: 430 + (Global.fontSize * 9),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Heading.title(context, 'Lenses Info'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Lenses Brand',
                        style: TextStyle(fontSize: Global.fontSize),
                      ),
                    ),
                    Container(
                      width: 280,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).highlightColor,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Text(
                        Global.lensesInfo[0],
                        style: TextStyle(fontSize: Global.fontSize),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Lenses Lifespan',
                        style: TextStyle(fontSize: Global.fontSize),
                      ),
                    ),
                    Container(
                      width: 280,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).highlightColor,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Text(
                        Global.lensesInfo[1],
                        style: TextStyle(fontSize: Global.fontSize),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    EyeCondition.infoCard(context),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: FloatingActionButton.small(
                          onPressed: () {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const GeneralInfo()))
                                .then((_) {
                              setState(() {});
                            });
                          },
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          backgroundColor: Theme.of(context).highlightColor,
                          elevation: 0,
                          child: const Icon(Icons.edit),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: Global.myopia,
              child: const SizedBox(height: 15.0),
            ),
            Visibility(
              visible: Global.myopia,
              child: SizedBox(
                width: 120.0,
                height: 150 + (Global.fontSize * 8),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Heading.title(context, 'Myopia/Hyperopia'),
                        ),
                      ),
                      EyeCondition.myopiaCard(context),
                      const Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: FloatingActionButton.small(
                            onPressed: () {
                              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const Myopia()))
                                  .then((_) {
                                setState(() {});
                              });
                            },
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            backgroundColor: Theme.of(context).highlightColor,
                            elevation: 0,
                            child: const Icon(Icons.edit),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: Global.astigmatism,
              child: const SizedBox(height: 15.0),
            ),
            Visibility(
              visible: Global.astigmatism,
              child: SizedBox(
                width: 120.0,
                height: 250 + (Global.fontSize * 7),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Heading.title(context, 'Astigmatism'),
                        ),
                      ),
                      EyeCondition.astigmatismCard(context),
                      const Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: FloatingActionButton.small(
                            onPressed: () {
                              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const Astigmatism()))
                                  .then((_) {
                                setState(() {});
                              });
                            },
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            backgroundColor: Theme.of(context).highlightColor,
                            elevation: 0,
                            child: const Icon(Icons.edit),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: Global.presbyopia,
              child: const SizedBox(height: 15.0),
            ),
            Visibility(
              visible: Global.presbyopia,
              child: SizedBox(
                width: 120.0,
                height: 150 + (Global.fontSize * 8),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Heading.title(context, 'Presbyopia'),
                        ),
                      ),
                      EyeCondition.presbyopiaCard(context),
                      const Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: FloatingActionButton.small(
                            onPressed: () {
                              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const Presbyopia()))
                                  .then((_) {
                                setState(() {});
                              });
                            },
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            backgroundColor: Theme.of(context).highlightColor,
                            elevation: 0,
                            child: const Icon(Icons.edit),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              child: const Text('Reset all values'),
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text('Warning',
                      style: TextStyle(fontSize: Global.fontSize + 10)),
                  content: Text(
                      'Would  you like to reset all your Contact Lenses values?',
                      style: TextStyle(fontSize: Global.fontSize)),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: Text('Cancel',
                          style: TextStyle(fontSize: Global.fontSize)),
                    ),
                    TextButton(
                      onPressed: () {
                        reset();
                        Navigator.pop(context, 'OK');
                      },
                      child: Text('OK',
                          style: TextStyle(fontSize: Global.fontSize)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 75.0),
          ],
        ),
        SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20.0),
                Heading.title(context, 'General'),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Font size',
                      style: TextStyle(fontSize: Global.fontSize),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: Text(
                        Global.fontSize.toInt().toString(),
                        style: TextStyle(
                            fontSize: Global.fontSize,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20.0),
                Slider(
                  value: Global.fontSize,
                  min: 14,
                  max: 22,
                  divisions: 2,
                  label: Global.fontSize.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      setDouble(value);
                      Global.fontSize = value;
                    });
                  },
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Disable Tips',
                      style: TextStyle(fontSize: Global.fontSize),
                    ),
                    Switch(
                      // This bool value toggles the switch.
                      value: Global.tips,
                      onChanged: (bool value) {
                        // This is called when the user toggles the switch.
                        setState(() {
                          setTip(value);
                          Global.tips = value;
                        });
                      },
                    )
                  ],
                ),
                const SizedBox(height: 20.0),
                Heading.title(context, 'Conditions'),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Myopia/Hyperopia',
                      style: TextStyle(fontSize: Global.fontSize),
                    ),
                    Switch(
                      // This bool value toggles the switch.
                      value: Global.myopia,
                      onChanged: (bool value) {
                        // This is called when the user toggles the switch.
                        setState(() {
                          setBool(value, Global.astigmatism, Global.presbyopia);
                          Global.myopia = value;
                        });
                      },
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Astigmatism',
                      style: TextStyle(fontSize: Global.fontSize),
                    ),
                    Switch(
                      // This bool value toggles the switch.
                      value: Global.astigmatism,
                      onChanged: (bool value) {
                        // This is called when the user toggles the switch.
                        setState(() {
                          setBool(Global.myopia, value, Global.presbyopia);
                          Global.astigmatism = value;
                        });
                      },
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Presbyopia',
                      style: TextStyle(fontSize: Global.fontSize),
                    ),
                    Switch(
                      // This bool value toggles the switch.
                      value: Global.presbyopia,
                      onChanged: (bool value) {
                        // This is called when the user toggles the switch.
                        setState(() {
                          setBool(Global.myopia, Global.astigmatism, value);
                          Global.presbyopia = value;
                        });
                      },
                    )
                  ],
                ),
                const SizedBox(height: 75.0),
              ],
            ),
          ),
        ),
      ][currentPageIndex],
      floatingActionButton: currentPageIndex == 0
          ? FloatingActionButton(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text('Warning',
                      style: TextStyle(fontSize: Global.fontSize + 10)),
                  content: Text(
                      'Would  you like to reset your Contact Lenses counter?',
                      style: TextStyle(fontSize: Global.fontSize)),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: Text('Cancel',
                          style: TextStyle(fontSize: Global.fontSize)),
                    ),
                    TextButton(
                      onPressed: () {
                        Global.leftEye = 0;
                        Global.rightEye = 0;
                        Global.timestamps = [];
                        setInt(Global.leftEye, Global.rightEye);
                        setStringList(Global.timestamps);
                        Navigator.pop(context, 'OK');
                      },
                      child: Text('OK',
                          style: TextStyle(fontSize: Global.fontSize)),
                    ),
                  ],
                ),
              ),
              child: Transform.scale(
                scaleX: -1,
                child: const Icon(
                  Icons.refresh_rounded,
                ),
              ),
            )
          : null,
    );
  }
}
