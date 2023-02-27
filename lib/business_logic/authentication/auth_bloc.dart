import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbauth;

import '../../constants/enums/auth_status.dart';
import '../../data/models/auth/custom_error.dart';
import '../../data/models/auth/user.dart';
import '../../repositories/auth_repositories.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  late StreamSubscription authSubscription;

  AuthBloc({required this.authRepository}) : super(AuthState.unknown()) {
    authSubscription = authRepository.user.listen((fbauth.User? user) {
      add(AuthStateChangesEvent(user));
    });

    on<AuthStateChangesEvent>((event, emit) {
      if (event.user != null) {
        emit(state.copyWith(
            authStatus: AuthStatus.authenticated, user: event.user));
      } else {
        emit(
            state.copyWith(authStatus: AuthStatus.unauthenticated, user: null));
      }
    });

    // // signup event
    // on<SignUpEvent>((event, emit) {
    //   try {
    //     authRepository.signUp(
    //         email: event.email, phone: event.phone, password: event.password);
    //   } on fbauth.FirebaseAuthException catch (e) {
    //     CustomError(code: e.code, errMsg: e.message!, plugin: e.plugin);
    //   } catch (e) {
    //     CustomError(
    //       code: 'Exception',
    //       errMsg: e.toString(),
    //       plugin: 'firebase_exception/server_error',
    //     );
    //   }
    // });
    //
    // // signin event
    // on<SignInEvent>((event, emit) {
    //   try {
    //     authRepository.signIn(email: event.email, password: event.password);
    //   } on fbauth.FirebaseAuthException catch (e) {
    //     CustomError(code: e.code, errMsg: e.message!, plugin: e.plugin);
    //   } catch (e) {
    //     CustomError(
    //       code: 'Exception',
    //       errMsg: e.toString(),
    //       plugin: 'firebase_exception/server_error',
    //     );
    //   }
    // });
    //
    // // google auth event
    // on<GoogleAuthEvent>((event, emit) {
    //   try {
    //     authRepository.googleAuthenticate();
    //   } on fbauth.FirebaseAuthException catch (e) {
    //     CustomError(code: e.code, errMsg: e.message!, plugin: e.plugin);
    //   } catch (e) {
    //     CustomError(
    //       code: 'Exception',
    //       errMsg: e.toString(),
    //       plugin: 'firebase_exception/server_error',
    //     );
    //   }
    // });

    // sign out event
    on<SignOutEvent>((event, emit) async {
      await authRepository.signOut();
    });
  }
}
