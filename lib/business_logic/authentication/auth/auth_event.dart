part of 'auth_bloc.dart';

class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthStateChangesEvent extends AuthEvent {
  final fbauth.User? user;

  const AuthStateChangesEvent(this.user);

  @override
  List<Object?> get props => [user];
}
//
// // sign up event
// class SignUpEvent extends AuthEvent {
//   final String email;
//   final String phone;
//   final String password;
//
//   const SignUpEvent({
//     required this.email,
//     required this.phone,
//     required this.password,
//   });
//
//   @override
//   List<Object?> get props => [email, phone, password];
//
//   @override
//   String toString() =>
//       'SignUpEvent{email: $email, phone: $phone, password: $password}';
// }
//
// // sign in event
// class SignInEvent extends AuthEvent {
//   final String email;
//   final String password;
//
//   const SignInEvent({
//     required this.email,
//     required this.password,
//   });
//
//   @override
//   List<Object?> get props => [email, password];
//
//   @override
//   String toString() => 'SignInEvent{email: $email, password: $password}';
// }
//
// // google auth
// class GoogleAuthEvent extends AuthEvent {}

// sign out
class SignOutEvent extends AuthEvent {}
