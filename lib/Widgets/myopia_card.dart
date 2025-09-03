import 'package:flutter/material.dart';
import '../global_dirs.dart';

class MyopiaCard {
  static Widget myopiaCard(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Left Lens
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 10, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
                child: Text(
                  'Left Lens',
                  style: TextStyle(fontSize: 16.sp),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Dioptres / Sphere',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  Container(
                    width: 75.w,
                    height: 35.h,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      Global.myopiaParams[0],
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Right Lens
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
                child: Text(
                  'Right Lens',
                  style: TextStyle(fontSize: 16.sp),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Dioptres / Sphere',
                    style: TextStyle(fontSize: 16.sp - 3),
                  ),
                  Container(
                    width: 75.w,
                    height: 35.h,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      Global.myopiaParams[1],
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
