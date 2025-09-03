import 'package:contact_lenses/global_dirs.dart';

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
      final saved = prefs.getStringList('timestamps') ?? [];
      Global.timestamps = saved.map((s) => DateTime.parse(s)).toList();
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

  void setTimestamps(List<DateTime> times) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setStringList(
        'timestamps',
        times.map((dt) => dt.toIso8601String()).toList(),
      );
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
        toolbarHeight: 100.h,
        scrolledUnderElevation: 0.0,
        title: Text(widget.title, style: TextStyle(fontSize: 28.sp)),
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
            selectedIcon: Icon(Icons.calendar_month),
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Lenses\' Calendar',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.remove_red_eye),
            icon: Icon(Icons.remove_red_eye_outlined),
            label: 'Parameters',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.settings),
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      body: <Widget>[
        LensesCenterWidget(
          leftIncrement: () {
            Lifespan.alert(context);
            Global.leftEye += 1;
            setInt(Global.leftEye, Global.rightEye);
          },
          rightIncrement: () {
            Lifespan.alert(context);
            Global.rightEye += 1;
            setInt(Global.leftEye, Global.rightEye);
          },
          onLensesOn: () {
            if (Global.tips) {
              showDialog<String>(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Tip:', style: TextStyle(fontSize: 26.sp)),
                  content:
                      Text(Tips.selectTip(), style: TextStyle(fontSize: 16.sp)),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('OK', style: TextStyle(fontSize: 16.sp)),
                    )
                  ],
                ),
              );
            }
            Lifespan.alert(context);
            Global.leftEye++;
            Global.rightEye++;
            setInt(Global.leftEye, Global.rightEye);
            Global.timestamps.add(DateTime.now());
            setTimestamps(Global.timestamps);
          },
        ),
        Timestamps(),
        ParametersPage(),
        Settings(),
      ][currentPageIndex],
      floatingActionButton: currentPageIndex == 0
          ? FloatingActionButton(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title:
                      Text('Warning', style: TextStyle(fontSize: 16.sp + 10)),
                  content: Text(
                      'Would  you like to reset your Contact Lenses counter?',
                      style: TextStyle(fontSize: 16.sp)),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: Text('Cancel', style: TextStyle(fontSize: 16.sp)),
                    ),
                    TextButton(
                      onPressed: () {
                        Global.leftEye = 0;
                        Global.rightEye = 0;
                        Global.timestamps = [];
                        setInt(Global.leftEye, Global.rightEye);
                        setTimestamps(Global.timestamps);
                        Navigator.pop(context, 'OK');
                      },
                      child: Text('OK', style: TextStyle(fontSize: 16.sp)),
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
