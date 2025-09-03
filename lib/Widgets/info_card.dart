import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../global_dirs.dart';

class InfoCard {
  static Widget infoCard(BuildContext context) {
    return Column(
      children: [
        _buildLensRow(
          context,
          label: 'Left Lens',
          bcValue: Global.lensesInfo[2],
          diaValue: Global.lensesInfo[3],
        ),
        _buildLensRow(
          context,
          label: 'Right Lens',
          bcValue: Global.lensesInfo[4],
          diaValue: Global.lensesInfo[5],
        ),
      ],
    );
  }

  static Widget _buildLensRow(
      BuildContext context, {
        required String label,
        required String bcValue,
        required String diaValue,
      }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center, // keep label aligned with values
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16.sp),
          ),
          Row(
            children: [
              _buildValueBox(context, 'Base Curve (BC)', bcValue),
              const SizedBox(width: 10.0),
              _buildValueBox(context, 'Diameter (DIA)', diaValue),
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
      crossAxisAlignment: CrossAxisAlignment.end,
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
            style: TextStyle(fontSize: 14.sp),
          ),
        ),
      ],
    );
  }
}
