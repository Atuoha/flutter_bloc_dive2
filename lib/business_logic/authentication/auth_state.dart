part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final AuthStatus authStatus;
  final fbauth.User? user;

  const AuthState({required this.authStatus, this.user});

  factory AuthState.unknown() =>
      const AuthState(authStatus: AuthStatus.unknown);

  @override
  List<Object?> get props => [authStatus, user];

  @override
  String toString() =>
      'AuthenticationState{authStatus: $authStatus, user: $user}';

  AuthState copyWith({
    AuthStatus? authStatus,
    fbauth.User? user,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      user: user ?? this.user,
    );
  }
}
