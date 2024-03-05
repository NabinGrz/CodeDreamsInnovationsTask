import 'package:core_dreams_innovations/core/dependency_injection/injector.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/helper/firebase_auth_helper.dart';
import '../../otp/presentation/otp_screen.dart';

final numberValidationProvider = StateProvider<String?>((ref) => null);
final authHelperProvider =
    Provider<FirebaseAuthHelper>((ref) => getIt<FirebaseAuthHelper>());
final verifyPhoneNumberProvider = ChangeNotifierProvider(
    (ref) => PhoneNumberNotifier(auth: ref.read(authHelperProvider)));

class PhoneNumberNotifier extends ChangeNotifier {
  final FirebaseAuthHelper auth;

  PhoneNumberNotifier({required this.auth});
  bool isLoading = false;
  Future<void> verifyPhoneNumber(String number, BuildContext context) async {
    isLoading = true;
    print(isLoading);
    await auth
        .verifyPhoneNumber(
          phoneNumber: number,
          codeSent: (verificationId, forceResendingToken) async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OTPScreen(
                  verificationId,
                ),
              ),
            );
          },
        )
        .then((value) => isLoading = false);

    print(isLoading);
    notifyListeners();
  }
}
