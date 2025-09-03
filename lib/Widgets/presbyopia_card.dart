import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../global_dirs.dart';

class PresbyopiaCard {
  static Widget presbyopiaCard(BuildContext context) {
    return Column(
      children: [
        _buildLensRow(
          context,
          label: 'Left Lens',
          addition: Global.presbyopiaParams[0],
        ),
        _buildLensRow(
          context,
          label: 'Right Lens',
          addition: Global.presbyopiaParams[1],
        ),
      ],
    );
  }

  static Widget _buildLensRow(
      BuildContext context, {
        required String label,
        required String addition,
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
          _buildValueBox(context, 'Addition', addition),
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
