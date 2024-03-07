import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthHelper {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthHelper({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;
  User? get user => _firebaseAuth.currentUser;
  FirebaseAuth get firebaseAuth => _firebaseAuth;
  // Future<void> updateDisplayName({required String displayName}) async {
  //   await user?.updateDisplayName(displayName);
  // }

  // Future<void> updatePassword({required String newPassword}) async {
  //   await user?.updatePassword(newPassword);
  // }

  // Future<void> updatePhotoURL({required String photoUrl}) async {
  //   await user?.updatePhotoURL(photoUrl);
  // }

  Future<Either<UserCredential?, String?>> verifyPhoneNumber(
      {required String phoneNumber,
      required void Function(String, int?) codeSent}) async {
    UserCredential? userCredentials;
    // await _firebaseAuth.setSettings(appVerificationDisabledForTesting: true);
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: "+977$phoneNumber",
        verificationCompleted: (phoneAuthCredential) async {
          userCredentials =
              await _firebaseAuth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (error) {
          error;
        },
        codeSent: (verificationId, forceResendingToken) {
          codeSent(verificationId, forceResendingToken);
        },
        codeAutoRetrievalTimeout: (verificationId) {},
        timeout: const Duration(seconds: 60),
      );
      return Left(userCredentials);
    } on FirebaseAuthException catch (e) {
      return Right(e.message);
    }
  }
}
