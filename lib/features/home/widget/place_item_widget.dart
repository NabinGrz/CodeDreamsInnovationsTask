import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/text_styles.dart';
import '../../../shared/widgets/sizebox.dart';
import '../data/models/place_model.dart';

class PlaceItemWidget extends StatelessWidget {
  const PlaceItemWidget({
    super.key,
    required this.place,
  });

  final Description place;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
      ),
      child: Row(
        children: [
          Icon(
            Icons.location_on,
            color: Colors.white,
            size: 18.w,
          ),
          sizedBox(10),
          Expanded(
            child: Text(
              "${place.description}",
              style: regular().copyWith(
                fontSize: 16.sp,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
