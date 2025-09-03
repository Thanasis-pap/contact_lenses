import 'package:contact_lenses/global_dirs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:contact_lenses/home.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // Load saved settings on init
  @override
  void initState() {
    super.initState();
    _loadPreferences();
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

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      Global.tips = prefs.getBool('tips') ?? true;
      Global.myopia = prefs.getBool('myopia') ?? false;
      Global.astigmatism = prefs.getBool('astigmatism') ?? false;
      Global.presbyopia = prefs.getBool('presbyopia') ?? false;
    });
  }

  Future<void> _savePreference(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            Heading.title(context, 'General'),
            const SizedBox(height: 10.0),

            // Show Tips
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Show Tips',
                  style: TextStyle(fontSize: 16.sp),
                ),
                Switch(
                  value: Global.tips,
                  onChanged: (bool value) {
                    setState(() {
                      Global.tips = value;
                      setTip(value);
                    });
                    _savePreference('tips', value);
                  },
                ),
              ],
            ),

            const SizedBox(height: 20.0),
            Heading.title(context, 'Conditions'),
            const SizedBox(height: 20.0),

            // Myopia
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Myopia/Hyperopia',
                  style: TextStyle(fontSize: 16.sp),
                ),
                Switch(
                  value: Global.myopia,
                  onChanged: (bool value) {
                    setState(() {
                      Global.myopia = value;
                      setBool(value, Global.astigmatism, Global.presbyopia);
                    });
                    _savePreference('myopia', value);
                  },
                ),
              ],
            ),

            // Astigmatism
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Astigmatism',
                  style: TextStyle(fontSize: 16.sp),
                ),
                Switch(
                  value: Global.astigmatism,
                  onChanged: (bool value) {
                    setState(() {
                      Global.astigmatism = value;
                      setBool(Global.myopia, value, Global.presbyopia);
                    });
                    _savePreference('astigmatism', value);
                  },
                ),
              ],
            ),

            // Presbyopia
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Presbyopia',
                  style: TextStyle(fontSize: 16.sp),
                ),
                Switch(
                  value: Global.presbyopia,
                  onChanged: (bool value) {
                    setState(() {
                      Global.presbyopia = value;
                      setBool(Global.myopia, Global.astigmatism, value);
                    });
                    _savePreference('presbyopia', value);
                  },
                ),
              ],
            ),

            const SizedBox(height: 75.0),
          ],
        ),
      ),
    );
  }
}
