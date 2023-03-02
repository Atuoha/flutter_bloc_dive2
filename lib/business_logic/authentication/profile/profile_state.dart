part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final ProcessStatus status;
  final User user;
  final CustomError error;

  const ProfileState({
    required this.user,
    required this.status,
    required this.error,
  });

  factory ProfileState.initial() => ProfileState(
        user: User.initial(),
        status: ProcessStatus.initial,
        error: CustomError.initial(),
      );

  @override
  List<Object> get props => [user, status, error];

  @override
  String toString() =>
      'ProfileState{status: $status, user: $user, error: $error}';

  ProfileState copyWith({
    ProcessStatus? status,
    User? user,
    CustomError? error,
  }) {
    return ProfileState(
      status: status ?? this.status,
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }
}
