part of 'sign_up_cubit.dart';

 class SignUpState extends Equatable {
  final AuthProcessStatus signUpStatus;
  final CustomError error;
  const SignUpState({required this.signUpStatus, required this.error});

  factory SignUpState.initial()=> SignUpState(signUpStatus: AuthProcessStatus.initial, error: CustomError.initial());

  @override
  List<Object> get props => [signUpStatus,error];

  @override
  String toString() {
    return 'SignUpState{signUpStatus: $signUpStatus, error: $error}';
  }

  SignUpState copyWith({
    AuthProcessStatus? signUpStatus,
    CustomError? error,
  }) {
    return SignUpState(
      signUpStatus: signUpStatus ?? this.signUpStatus,
      error: error ?? this.error,
    );
  }
}

