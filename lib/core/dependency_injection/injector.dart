import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../helper/firebase_auth_helper.dart';

final getIt = GetIt.instance;

class Injector {
  Injector._();
  static Future<void> setUpLocator() async {
    // getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
    // getIt.registerSingleton<FirebaseHelper>(FirebaseHelper(getIt()));

    getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
    getIt.registerSingleton<FirebaseAuthHelper>(
        FirebaseAuthHelper(firebaseAuth: getIt()));

    // getIt.registerSingletonAsync<SharedPreferences>(
    //     () async => await SharedPreferences.getInstance());
    // await getIt.isReady<SharedPreferences>();
    // getIt.registerSingleton<SharedPreferencesHelper>(
    //     SharedPreferencesHelper(getIt()));
  }
}
