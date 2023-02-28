part of 'sign_in_cubit.dart';

class SignInState extends Equatable {
  final SignInStatus signInStatus;
  final CustomError error;

  const SignInState({required this.signInStatus, required this.error});

  factory SignInState.initial() => SignInState(
        signInStatus: SignInStatus.initial,
        error: CustomError.initial(),
      );

  @override
  List<Object> get props => [signInStatus, error];

  @override
  String toString() =>
      'SignInState{signInStatus: $signInStatus, error: $error}';

  SignInState copyWith({
    SignInStatus? signInStatus,
    CustomError? error,
  }) {
    return SignInState(
      signInStatus: signInStatus ?? this.signInStatus,
      error: error ?? this.error,
    );
  }
}
