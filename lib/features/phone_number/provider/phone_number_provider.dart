import 'package:core_dreams_innovations/core/dependency_injection/injector.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/helper/firebase_auth_helper.dart';
import '../../otp/presentation/otp_screen.dart';

final numberValidationProvider = StateProvider<String?>((ref) => null);
final idProvider = StateProvider<String?>((ref) => null);
final authHelperProvider =
    Provider<FirebaseAuthHelper>((ref) => getIt<FirebaseAuthHelper>());
final verifyPhoneNumberProvider =
    StateNotifierProvider<PhoneNumberNotifier, bool>(
        (ref) => PhoneNumberNotifier(auth: ref.read(authHelperProvider)));

class PhoneNumberNotifier extends StateNotifier<bool> {
  final FirebaseAuthHelper auth;

  PhoneNumberNotifier({required this.auth}) : super(false);

  Future<void> verifyPhoneNumber(
      String number, BuildContext context, WidgetRef ref) async {
    state = true;
    await auth.verifyPhoneNumber(
      phoneNumber: number,
      codeSent: (verificationId, forceResendingToken) {
        ref.read(idProvider.notifier).update((state) => verificationId);
      },
    );
    await Future.delayed(const Duration(seconds: 3)).then((_) async {
      if (ref.watch(idProvider) != null) {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OTPScreen(
              ref.watch(idProvider)!,
            ),
          ),
        );
        state = false;
      }
    });
  }
}
