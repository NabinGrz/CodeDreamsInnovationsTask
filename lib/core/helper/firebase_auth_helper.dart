import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthHelper {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthHelper({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;
  User? get user => _firebaseAuth.currentUser;
  FirebaseAuth get firebaseAuth => _firebaseAuth;

  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required void Function(FirebaseAuthException) verificationFailed,
    required void Function(PhoneAuthCredential) verificationCompleted,
    required void Function(String) codeAutoRetrievalTimeout,
    required void Function(String, int?) codeSent,
    required void Function(String?) onException,
  }) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: "+977$phoneNumber",
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
        timeout: const Duration(seconds: 60),
      );
    } on FirebaseAuthException catch (e) {
      onException(e.message);
    }
  }
}
