import 'package:core_dreams_innovations/core/constants/app_colors.dart';
import 'package:core_dreams_innovations/core/constants/app_styles.dart';
import 'package:core_dreams_innovations/core/constants/text_styles.dart';
import 'package:core_dreams_innovations/features/home/presentation/home.dart';
import 'package:core_dreams_innovations/features/otp/domain/entities/auth_state.dart';
import 'package:core_dreams_innovations/features/otp/provider/otp_provider.dart';
import 'package:core_dreams_innovations/shared/widgets/sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'widgets/login_failed_dialog.dart';

class OTPScreen extends ConsumerStatefulWidget {
  final String verificationId;
  const OTPScreen(this.verificationId, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OTPScreenState();
}

class _OTPScreenState extends ConsumerState<OTPScreen> {
  final otpController = TextEditingController();
  void listenToProvider() {
    ref.listen(otpProvider.select((value) => value), (previous, next) {
      if (next.type == AuthStateType.failure) {
        showDialog(
          context: context,
          builder: (context) => LoginFailedDialog(
            message: next.failedAppStateResponse ?? "",
            onPressed: () {
              Navigator.pop(context);
              otpController.clear();
            },
          ),
        );
      } else if (next.type == AuthStateType.success) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const Home(),
            ),
            (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    listenToProvider();
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
              autofocus: true,
              onPressed: () async {
                if (otpController.text.isNotEmpty) {
                  await ref
                      .read(otpProvider.notifier)
                      .verifyOTP(widget.verificationId, otpController.text);
                } else {
                  ref
                      .read(otpValidationProvider.notifier)
                      .update((state) => "Please enter your OTP");
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
              onChanged: (value) {
                if (ref.watch(otpValidationProvider) != null) {
                  ref
                      .read(otpValidationProvider.notifier)
                      .update((state) => null);
                }
              },
              keyboardType: TextInputType.number,
              pinTheme: PinTheme(
                disabledColor: Colors.amber,
                inactiveFillColor: Colors.amber,
                activeColor: Colors.blue,
                inactiveColor: Colors.white,
                selectedColor: Colors.white,
              ),
            ),
            if (ref.watch(otpValidationProvider) != null) ...{
              sizedBox(8),
              Text(
                "${ref.watch(otpValidationProvider)}",
                style: light().copyWith(
                  fontSize: 16.sp,
                  color: Colors.red,
                ),
              ),
            },
          ],
        ),
      ),
    );
  }
}
