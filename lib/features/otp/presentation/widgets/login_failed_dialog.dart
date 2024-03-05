import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/text_styles.dart';

class LoginFailedDialog extends StatelessWidget {
  final String message;
  final void Function()? onPressed;
  const LoginFailedDialog({super.key, required this.message, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      surfaceTintColor: Colors.transparent,
      title: Text(
        "Authentication Failed",
        style: bold().copyWith(fontSize: 20.sp),
        textAlign: TextAlign.center,
      ),
      titlePadding: EdgeInsets.only(top: 20.h),
      contentPadding: EdgeInsets.symmetric(
        vertical: 10.h,
        horizontal: 16.w,
      ),
      actionsPadding: EdgeInsets.symmetric(vertical: 6.h),
      content: Text(
        message,
        style: semiBold(),
        textAlign: TextAlign.center,
      ),
      actions: [
        Center(
          child: TextButton(
              onPressed: onPressed ??
                  () {
                    Navigator.pop(context);
                  },
              child: Text(
                "OK",
                style: medium().copyWith(fontSize: 20.sp),
              )),
        )
      ],
    );
  }
}
