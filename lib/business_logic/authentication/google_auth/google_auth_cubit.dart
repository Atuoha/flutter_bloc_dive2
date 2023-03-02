import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../constants/enums/process_status.dart';
import '../../../data/models/auth/custom_error.dart';
import '../../../repositories/auth_repositories.dart';

part 'google_auth_state.dart';

class GoogleAuthCubit extends Cubit<GoogleAuthState> {
  final AuthRepository authRepository;

  GoogleAuthCubit({required this.authRepository})
      : super(GoogleAuthState.initial());

  Future<void> authenticate() async {
    emit(state.copyWith(status: ProcessStatus.loading));
    try {
      await authRepository.googleAuthenticate();
      emit(state.copyWith(status: ProcessStatus.success));
    } on CustomError catch (e) {
      emit(state.copyWith(status: ProcessStatus.error, error: e));
    }
  }
}
