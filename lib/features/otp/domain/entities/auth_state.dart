enum AuthStateType {
  initial,
  loading,
  failure,
  success,
  registeredWithGoogle,
}

class AuthState {
  final AuthStateType type;
  final String? failedAppStateResponse;
  final String? successfulAppStateResponse;

  const AuthState.initial()
      : type = AuthStateType.initial,
        failedAppStateResponse = null,
        successfulAppStateResponse = null;

  const AuthState.loading()
      : type = AuthStateType.loading,
        failedAppStateResponse = null,
        successfulAppStateResponse = null;

  const AuthState.failure(this.failedAppStateResponse)
      : type = AuthStateType.failure,
        successfulAppStateResponse = null;

  const AuthState.success(this.successfulAppStateResponse)
      : type = AuthStateType.success,
        failedAppStateResponse = null;

  const AuthState.registeredWithGoogle()
      : type = AuthStateType.registeredWithGoogle,
        failedAppStateResponse = null,
        successfulAppStateResponse = null;
}
