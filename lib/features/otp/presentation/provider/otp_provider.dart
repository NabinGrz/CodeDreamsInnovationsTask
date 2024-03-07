import 'package:core_dreams_innovations/features/otp/domain/entities/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/helper/firebase_auth_helper.dart';
import '../../../phone_number/presentation/provider/phone_number_provider.dart';

final otpValidationProvider = StateProvider<String?>((ref) => null);
final otpProvider = StateNotifierProvider<OTPNotifier, AuthState>(
    (ref) => OTPNotifier(auth: ref.read(authHelperProvider)));

class OTPNotifier extends StateNotifier<AuthState> {
  final FirebaseAuthHelper auth;

  OTPNotifier({required this.auth}) : super(const AuthState.initial());

  Future<void> verifyOTP(String verificationId, String otp) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    );
    await signInUser(credential);
  }

  Future<void> signInUser(PhoneAuthCredential credential) async {
    try {
      state = const AuthState.loading();
      await auth.firebaseAuth.signInWithCredential(credential);
      state = const AuthState.success("Done");
    } on FirebaseAuthException catch (e) {
      state = AuthState.failure(e.message);
    }
  }
}
