import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_dive2/constants/enums/auth_process_status.dart';

import '../../../data/models/auth/custom_error.dart';
import '../../../repositories/auth_repositories.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepository authRepository;

  SignUpCubit({required this.authRepository}) : super(SignUpState.initial());

  Future<void> signUp({
    required String email,
    required String password,
    required String phone,
  }) async {
    emit(state.copyWith(signUpStatus: AuthProcessStatus.loading));

    try {
      await authRepository.signUp(
          email: email, phone: phone, password: password);
      emit(state.copyWith(signUpStatus: AuthProcessStatus.success));
    } on CustomError catch (e) {
      emit(state.copyWith(signUpStatus: AuthProcessStatus.error, error: e));
    }
  }
}
