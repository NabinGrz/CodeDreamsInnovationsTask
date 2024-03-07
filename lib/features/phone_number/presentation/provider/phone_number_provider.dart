import 'package:core_dreams_innovations/core/dependency_injection/injector.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/helper/firebase_auth_helper.dart';
import '../../../otp/presentation/otp_screen.dart';
import '../../../otp/presentation/widgets/login_failed_dialog.dart';

final numberValidationProvider = StateProvider<String?>((ref) => null);
final idProvider = StateProvider<String?>((ref) => null);
final authHelperProvider =
    Provider<FirebaseAuthHelper>((ref) => getIt<FirebaseAuthHelper>());
final isLoadingProvider = StateNotifierProvider<PhoneNumberNotifier, bool>(
    (ref) => PhoneNumberNotifier(auth: ref.read(authHelperProvider)));

class PhoneNumberNotifier extends StateNotifier<bool> {
  final FirebaseAuthHelper auth;

  PhoneNumberNotifier({required this.auth}) : super(false);

  Future<void> verifyPhoneNumber(
      String number, BuildContext context, WidgetRef ref) async {
    state = true;
    await auth.verifyPhoneNumber(
      phoneNumber: number,
      verificationCompleted: (phoneAuthCredential) async {
        await auth.firebaseAuth.signInWithCredential(phoneAuthCredential);
        state = false;
      },
      verificationFailed: (error) {
        state = false;
        showDialog(
          context: context,
          builder: (context) => CustomDialog(
            message: error.message ?? "Something went wrong",
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        );
        FocusScope.of(context).unfocus();
      },
      codeSent: (verificationId, forceResendingToken) async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OTPScreen(
              verificationId,
            ),
          ),
        );
        state = false;
      },
      codeAutoRetrievalTimeout: (verificationId) {},
      onException: (message) {
        state = false;
        showDialog(
          context: context,
          builder: (context) => CustomDialog(
            message: message ?? "Something went wrong",
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }
}
