import 'package:core_dreams_innovations/core/constants/app_colors.dart';
import 'package:core_dreams_innovations/core/constants/app_styles.dart';
import 'package:core_dreams_innovations/core/constants/text_styles.dart';
import 'package:core_dreams_innovations/features/phone_number/provider/phone_number_provider.dart';
import 'package:core_dreams_innovations/shared/widgets/sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PhoneNumberScreen extends ConsumerStatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends ConsumerState<PhoneNumberScreen> {
  final mobileNumberController = TextEditingController();
  PhoneNumberNotifier get notifier =>
      ref.read(verifyPhoneNumberProvider.notifier);

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
                  await ref
                      .read(verifyPhoneNumberProvider.notifier)
                      .verifyPhoneNumber(
                          mobileNumberController.text, context, ref);
                } else {
                  ref
                      .read(numberValidationProvider.notifier)
                      .update((state) => "This field is required");
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
      body: Consumer(
        builder: (context, ref, child) {
          return ref.watch(verifyPhoneNumberProvider)
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : Padding(
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/america.png",
                              height: 40.w,
                              width: 40.w,
                            ),
                            sizedBox(18),
                            Flexible(
                              child: TextFormField(
                                autofocus: false,
                                maxLength: 10,
                                controller: mobileNumberController,
                                onChanged: (value) {
                                  if (ref.watch(numberValidationProvider) !=
                                      null) {
                                    ref
                                        .read(numberValidationProvider.notifier)
                                        .update((state) => null);
                                  }
                                },
                                style: light().copyWith(
                                    fontSize: 20.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100,
                                    letterSpacing: 3),
                                decoration: InputDecoration(
                                    counterText: "",
                                    hintText: "Phone Number",
                                    hintStyle: light().copyWith(
                                      fontSize: 20.sp,
                                      letterSpacing: 3,
                                      color: AppColors.textGreyColor,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.r),
                                        borderSide: BorderSide.none)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (ref.watch(numberValidationProvider) != null) ...{
                        sizedBox(8),
                        Text(
                          "${ref.watch(numberValidationProvider)}",
                          style: light().copyWith(
                            fontSize: 16.sp,
                            color: Colors.red,
                          ),
                        ),
                      },
                    ],
                  ),
                );
        },
      ),
    );
  }
}
