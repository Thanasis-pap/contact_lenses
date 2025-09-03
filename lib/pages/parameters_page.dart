import 'package:contact_lenses/global_dirs.dart';

class ParametersPage extends StatefulWidget {
  const ParametersPage({super.key});

  @override
  State<ParametersPage> createState() => _ParametersPageState();
}

class _ParametersPageState extends State<ParametersPage> {
  void reset() async {
    final prefs = await SharedPreferences.getInstance();
    Global.lensesInfo = ['', 'Daily', '', '', '', '', '', ''];
    Global.myopiaParams = ['0.00', '0.00'];
    Global.astigmaParams = ['0.00', '0', '0.00', '0'];
    Global.presbyopiaParams = ['0.00', '0.00'];
    setState(() {
      prefs.setStringList('myopiaParams', Global.myopiaParams);
      prefs.setStringList('astigmaParams', Global.astigmaParams);
      prefs.setStringList('presbyopiaParams', Global.presbyopiaParams);
      prefs.setStringList('infoParams', Global.lensesInfo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(15),
      children: <Widget>[
        // Lenses Info Card
        SizedBox(
          width: 120.w,
          height: 420.h,
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Heading.title(context, 'Lenses Info'),
                  ),
                ),
                // Brand
                _buildInfoRow(
                  context,
                  label: 'Lenses Brand',
                  value: Global.lensesInfo[0],
                ),
                // Lifespan
                _buildInfoRow(
                  context,
                  label: 'Lenses Lifespan',
                  value: Global.lensesInfo[1],
                ),
                InfoCard.infoCard(context),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child:SizedBox(
                      width: 40.w, // adjust as needed
                      height: 40.h,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const GeneralInfo()),
                          ).then((_) => setState(() {}));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).highlightColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                          padding: EdgeInsets.zero, // centers the icon
                        ),
                        child: const Icon(Icons.edit),
                      ),
                    ),

                  ),
                ),
              ],
            ),
          ),
        ),

        // Myopia
        if (Global.myopia) const SizedBox(height: 15),
        if (Global.myopia)
          _buildConditionCard(
            context,
            title: 'Myopia/Hyperopia',
            child: MyopiaCard.myopiaCard(context),
            onEdit: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Myopia()),
              ).then((_) => setState(() {}));
            },
            height: 310.h,
            width: 120.w,
          ),

        // Astigmatism
        if (Global.astigmatism) const SizedBox(height: 15),
        if (Global.astigmatism)
          _buildConditionCard(
            context,
            title: 'Astigmatism',
            child: AstigmatismCard.astigmatismCard(context),
            onEdit: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Astigmatism()),
              ).then((_) => setState(() {}));
            },
            height: 310.h,
            width: 120.w,
          ),

        // Presbyopia
        if (Global.presbyopia) const SizedBox(height: 15),
        if (Global.presbyopia)
          _buildConditionCard(
            context,
            title: 'Presbyopia',
            child: PresbyopiaCard.presbyopiaCard(context),
            onEdit: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Presbyopia()),
              ).then((_) => setState(() {}));
            },
            height: 310.h,
            width: 120.w,
          ),

        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end, // aligns the button to the right
          children: [
            ElevatedButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text('Warning', style: TextStyle(fontSize: 26)),
                  content: const Text(
                      'Would you like to reset all your Contact Lenses values?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        reset();
                        Navigator.pop(context, 'OK');
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text('Reset all values'),
            ),
          ],
        ),
        const SizedBox(height: 75),
      ],
    );
  }

  // Helper widget for rows like Brand/Lifespan
  Widget _buildInfoRow(BuildContext context,
      {required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 16.sp)),
          Container(
            width: 180.w,
            height: 35.h,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(value),
          ),
        ],
      ),
    );
  }

  // Helper widget for Myopia/Astigmatism/Presbyopia cards
  Widget _buildConditionCard(BuildContext context,
      {required String title,
      required Widget child,
      required VoidCallback onEdit,
      required double height,
      required double width}) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Heading.title(context, title),
              ),
            ),
            child,
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  width: 40.w, // adjust as needed
                  height: 40.h, // adjust as needed
                  child: ElevatedButton(
                    onPressed: onEdit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).highlightColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                      padding: EdgeInsets.zero, // centers the icon
                    ),
                    child: const Icon(Icons.edit),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
