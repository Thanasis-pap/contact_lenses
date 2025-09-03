import 'package:flutter/material.dart';
import '../global_dirs.dart';

class LensesCenterWidget extends StatelessWidget {
  const LensesCenterWidget({
    super.key,
    required this.leftIncrement,
    required this.rightIncrement,
    required this.onLensesOn,
  });

  final VoidCallback leftIncrement;
  final VoidCallback rightIncrement;
  final VoidCallback onLensesOn;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Counter.lensesCount(
                      context, 'L', Global.leftEye.toString(), Alignment.topLeft),
                  const SizedBox(height: 10.0),
                  IconButton.filled(
                    onPressed: leftIncrement,
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
              const SizedBox(width: 16.0),
              Column(
                children: [
                  Counter.lensesCount(
                      context, 'R', Global.rightEye.toString(), Alignment.topRight),
                  const SizedBox(height: 10.0),
                  IconButton.filled(
                    onPressed: rightIncrement,
                    icon: const Icon(Icons.add),
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
              onPressed: onLensesOn,
              icon: const Icon(Icons.remove_red_eye_sharp),
              label: Text('Lenses on', style: TextStyle(fontSize: 20.sp)),
            ),
          ),
          const SizedBox(height: 75.0),
        ],
      ),
    );
  }
}
