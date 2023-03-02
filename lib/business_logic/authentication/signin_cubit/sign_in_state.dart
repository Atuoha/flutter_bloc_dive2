part of 'sign_in_cubit.dart';

class SignInState extends Equatable {
  final ProcessStatus signInStatus;
  final CustomError error;

  const SignInState({required this.signInStatus, required this.error});

  factory SignInState.initial() => SignInState(
        signInStatus: ProcessStatus.initial,
        error: CustomError.initial(),
      );

  @override
  List<Object> get props => [signInStatus, error];

  @override
  String toString() =>
      'SignInState{signInStatus: $signInStatus, error: $error}';

  SignInState copyWith({
    ProcessStatus? signInStatus,
    CustomError? error,
  }) {
    return SignInState(
      signInStatus: signInStatus ?? this.signInStatus,
      error: error ?? this.error,
    );
  }
}
