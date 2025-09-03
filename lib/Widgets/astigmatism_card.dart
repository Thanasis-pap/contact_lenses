import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../global_dirs.dart';

class AstigmatismCard {
  static Widget astigmatismCard(BuildContext context) {
    return Column(
      children: [
        _buildLensRow(
          context,
          label: 'Left Lens',
          cylinder: Global.astigmaParams[0],
          axis: Global.astigmaParams[1],
        ),
        _buildLensRow(
          context,
          label: 'Right Lens',
          cylinder: Global.astigmaParams[2],
          axis: Global.astigmaParams[3],
        ),
      ],
    );
  }

  static Widget _buildLensRow(
      BuildContext context, {
        required String label,
        required String cylinder,
        required String axis,
      }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16.sp),
          ),
          Row(
            children: [
              _buildValueBox(context, 'Cylinder', cylinder),
              const SizedBox(width: 10.0),
              _buildValueBox(context, 'Axis', '$axis°'),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _buildValueBox(
      BuildContext context,
      String title,
      String value,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
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
            value,
            style: TextStyle(fontSize: 16.sp),
          ),
        ),
      ],
    );
  }
}
