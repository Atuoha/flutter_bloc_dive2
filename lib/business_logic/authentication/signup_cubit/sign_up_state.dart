part of 'sign_up_cubit.dart';

 class SignUpState extends Equatable {
  final ProcessStatus signUpStatus;
  final CustomError error;
  const SignUpState({required this.signUpStatus, required this.error});

  factory SignUpState.initial()=> SignUpState(signUpStatus: ProcessStatus.initial, error: CustomError.initial());

  @override
  List<Object> get props => [signUpStatus,error];

  @override
  String toString() {
    return 'SignUpState{signUpStatus: $signUpStatus, error: $error}';
  }

  SignUpState copyWith({
    ProcessStatus? signUpStatus,
    CustomError? error,
  }) {
    return SignUpState(
      signUpStatus: signUpStatus ?? this.signUpStatus,
      error: error ?? this.error,
    );
  }
}

