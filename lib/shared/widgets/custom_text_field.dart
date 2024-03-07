import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isReadOnly,
    this.onChanged,
  });

  final TextEditingController? controller;
  final String hintText;
  final bool? isReadOnly;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: isReadOnly ?? false,
      controller: controller,
      style: regular().copyWith(
        fontSize: 20.sp,
        color: Colors.white,
      ),
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(
          left: 10,
        ),
        hintText: hintText,
        hintStyle: regular().copyWith(
          fontSize: 20.sp,
          color: AppColors.textGreyColor,
        ),
        border: InputBorder.none,
      ),
    );
  }
}
