import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_styles.dart';
import '../../../core/constants/text_styles.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(
        left: screenMargin,
        right: screenMargin,
        top: screenMargin * 2,
      ),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Cancel',
              style: regular().copyWith(
                fontSize: 18.sp,
                color: Colors.white,
              ),
            ),
            Text(
              'Enter Location',
              style: bold().copyWith(
                fontSize: 18.sp,
                color: Colors.white,
              ),
            ),
            Text(
              'Done',
              style: bold().copyWith(
                fontSize: 18.sp,
                color: AppColors.yellowColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
