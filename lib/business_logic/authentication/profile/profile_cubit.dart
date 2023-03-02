import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../constants/enums/process_status.dart';
import '../../../data/models/auth/custom_error.dart';
import '../../../data/models/auth/user.dart';
import '../../../repositories/profile_repositories.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository profileRepository;

  ProfileCubit({required this.profileRepository})
      : super(ProfileState.initial());

  Future<void> getProfile({required String uId}) async {
    emit(state.copyWith(status: ProcessStatus.loading));

    try {
      final user = await profileRepository.getProfile(uId: uId);
      emit(state.copyWith(status: ProcessStatus.success, user: user));
    } on CustomError catch (e) {
      emit(state.copyWith(status: ProcessStatus.error, error: e));
    }
  }
}
