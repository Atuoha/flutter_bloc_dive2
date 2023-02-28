import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_dive2/data/models/auth/custom_error.dart';
import '../../../constants/enums/auth_process_status.dart';
import '../../../repositories/auth_repositories.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepository authRepository;

  SignInCubit({required this.authRepository}) : super(SignInState.initial());

  // signin
  Future<void> signIn({required String email, required String password}) async {
    emit(state.copyWith(signInStatus: AuthProcessStatus.loading));
    try {
      await authRepository.signIn(email: email, password: password);
      emit(state.copyWith(signInStatus: AuthProcessStatus.success));
    } on CustomError catch (e) {
      emit(
        state.copyWith(
          signInStatus: AuthProcessStatus.error,
          error: e,
        ),
      );
    }
  }
}
