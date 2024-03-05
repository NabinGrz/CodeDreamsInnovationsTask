import 'package:core_dreams_innovations/core/constants/app_colors.dart';
import 'package:core_dreams_innovations/core/constants/app_styles.dart';
import 'package:core_dreams_innovations/core/constants/text_styles.dart';
import 'package:core_dreams_innovations/core/dependency_injection/injector.dart';
import 'package:core_dreams_innovations/core/helper/firebase_auth_helper.dart';
import 'package:core_dreams_innovations/shared/widgets/sizebox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends StatefulWidget {
  final String verificationId;
  const OTPScreen({super.key, required this.verificationId});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: AppColors.yellowColor,
        ),
        actions: [
          TextButton(
              onPressed: () async {
                if (otpController.text.isNotEmpty) {
                  final helper = getIt<FirebaseAuthHelper>();
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: widget.verificationId,
                    smsCode: otpController.text,
                  );
                  final user = await helper.firebaseAuth
                      .signInWithCredential(credential);
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
              "Enter OTP Code",
              style: bold().copyWith(
                fontSize: 26.sp,
                color: AppColors.textColor,
              ),
            ),
            sizedBox(12),
            PinCodeTextField(
              controller: otpController,
              appContext: context,
              length: 6,
              textStyle: light().copyWith(
                fontSize: 20.sp,
                color: Colors.white,
              ),
              keyboardType: TextInputType.number,
              pinTheme: PinTheme(
                disabledColor: Colors.amber,
                inactiveFillColor: Colors.amber,
                activeColor: Colors.blue,
                inactiveColor: Colors.white,
                selectedColor: Colors.white,
              ),
            )
            // Container(
            //   decoration: BoxDecoration(
            //     color: AppColors.backgroundGreyColor,
            //     borderRadius: BorderRadius.circular(18.r),
            //   ),
            //   padding: EdgeInsets.only(left: screenMargin + 10),
            //   child: Row(
            //     children: [
            //       Image.asset(
            //         "assets/images/america.png",
            //         height: 40.w,
            //         width: 40.w,
            //       ),
            //       sizedBox(18),
            //       Flexible(
            //         child: TextFormField(
            //           style: light().copyWith(
            //             fontSize: 20.sp,
            //             color: Colors.white,
            //           ),
            //           decoration: InputDecoration(
            //               hintText: "Phone Number",
            //               hintStyle: light().copyWith(
            //                 fontSize: 20.sp,
            //                 color: AppColors.textGreyColor,
            //               ),
            //               border: OutlineInputBorder(
            //                   borderRadius: BorderRadius.circular(18.r),
            //                   borderSide: BorderSide.none)),
            //         ),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
