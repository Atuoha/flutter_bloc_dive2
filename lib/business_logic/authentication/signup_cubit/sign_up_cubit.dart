import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_dive2/constants/enums/process_status.dart';

import '../../../data/models/auth/custom_error.dart';
import '../../../repositories/auth_repositories.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepository authRepository;

  SignUpCubit({required this.authRepository}) : super(SignUpState.initial());

  Future<void> signUp({
    required String fullname,
    required String email,
    required String password,
    required String phone,
  }) async {
    emit(state.copyWith(signUpStatus: ProcessStatus.loading));

    try {
      await authRepository.signUp(
          email: email, phone: phone, password: password, fullname:fullname,);
      emit(state.copyWith(signUpStatus: ProcessStatus.success));
    } on CustomError catch (e) {
      emit(state.copyWith(signUpStatus: ProcessStatus.error, error: e));
    }
  }
}
