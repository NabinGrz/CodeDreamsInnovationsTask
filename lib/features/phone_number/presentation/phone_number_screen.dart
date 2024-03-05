import 'package:core_dreams_innovations/core/constants/app_colors.dart';
import 'package:core_dreams_innovations/core/constants/app_styles.dart';
import 'package:core_dreams_innovations/core/constants/text_styles.dart';
import 'package:core_dreams_innovations/features/otp/presentation/otp_screen.dart';
import 'package:core_dreams_innovations/shared/widgets/sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/dependency_injection/injector.dart';
import '../../../core/helper/firebase_auth_helper.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  final mobileNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () async {
                if (mobileNumberController.text.isNotEmpty) {
                  final helper = getIt<FirebaseAuthHelper>();
                  await helper.login(
                    phoneNumber: mobileNumberController.text,
                    codeSent: (verificationId, forceResendingToken) async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OTPScreen(
                            verificationId: verificationId,
                          ),
                        ),
                      );
                    },
                  );
                }
              },
              child: Text(
                "Done",
                style: bold().copyWith(
                  fontSize: 20.sp,
                  color: AppColors.yellowColor,
                ),
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenMargin,
          vertical: screenMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter Phone Number",
              style: bold().copyWith(
                fontSize: 26.sp,
                color: AppColors.textColor,
              ),
            ),
            sizedBox(12),
            Container(
              decoration: BoxDecoration(
                color: AppColors.backgroundGreyColor,
                borderRadius: BorderRadius.circular(18.r),
              ),
              padding: EdgeInsets.only(left: screenMargin + 10),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/america.png",
                    height: 40.w,
                    width: 40.w,
                  ),
                  sizedBox(18),
                  Flexible(
                    child: TextFormField(
                      controller: mobileNumberController,
                      style: light().copyWith(
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                          hintText: "Phone Number",
                          hintStyle: light().copyWith(
                            fontSize: 20.sp,
                            color: AppColors.textGreyColor,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18.r),
                              borderSide: BorderSide.none)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
