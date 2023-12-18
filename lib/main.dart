import 'package:contact_lenses/global_dirs.dart';
import 'package:contact_lenses/home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/home',
      routes: {
        '/home' : (context) => const MyHomePage(title: 'Contact Lenses Assistant',),
      },
      debugShowCheckedModeBanner: false,
      title: 'Contact Lenses Assistant',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue.shade100),

        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue.shade200,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),

    );

  }
}

