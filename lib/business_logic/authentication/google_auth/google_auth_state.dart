part of 'google_auth_cubit.dart';

class GoogleAuthState extends Equatable {
  final AuthProcessStatus status;
  final CustomError error;

  const GoogleAuthState({required this.status, required this.error});

  factory GoogleAuthState.initial() => GoogleAuthState(
        status: AuthProcessStatus.initial,
        error: CustomError.initial(),
      );

  @override
  List<Object> get props => [status, error];

  @override
  String toString() {
    return 'AuthState{status: $status, error: $error}';
  }

  GoogleAuthState copyWith({
    AuthProcessStatus? status,
    CustomError? error,
  }) {
    return GoogleAuthState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
