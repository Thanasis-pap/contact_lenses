import 'package:contact_lenses/global_dirs.dart';
import 'package:contact_lenses/home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844), // Example: iPhone 12 size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          initialRoute: '/home',
          routes: {
            '/home': (context) =>
            const MyHomePage(title: 'Contact Lenses Assistant'),
          },
          debugShowCheckedModeBanner: false,
          title: 'Contact Lenses Assistant',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.lightBlue.shade100,
            ),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue.shade200,
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
          ),
          builder: (context, widget) {
            // Ensures text scaling adapts properly
            ScreenUtil.ensureScreenSize();
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: TextScaler.linear(1.0),
              ),
              child: widget!,
            );
          },
        );
      },
    );
  }
}
