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

  Future<Either<UserCredential?, String?>> login(
      {required String phoneNumber,
      // required String verificationCode,
      required void Function(String, int?) codeSent}) async {
    UserCredential? userCredentials;
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: "+977$phoneNumber",
        verificationCompleted: (phoneAuthCredential) async {
          userCredentials =
              await _firebaseAuth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (error) {
          error;
          print(error);
        },
        codeSent: (verificationId, forceResendingToken) async {
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

  // test() async {/
  //   await _firebaseAuth.signInWithPhoneNumber(phoneNumber);
  // }
  // Future<Either<UserCredential?, String?>> register(
  //     {required String email, required String password}) async {
  //   try {
  //     final userCredentials = await _firebaseAuth
  //         .createUserWithEmailAndPassword(email: email, password: password);
  //     return Left(userCredentials);
  //   } on FirebaseAuthException catch (e) {
  //     return Right(e.message);
  //   }
  // }

  // Future<void> signOut() async {
  //   await _firebaseAuth.signOut();
  // }
}
