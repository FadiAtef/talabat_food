import 'package:flutter_bloc/flutter_bloc.dart';
import 'model/profile_form_data.dart';
import 'profile_repository.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository _repository;

  ProfileCubit(this._repository) : super(ProfileInitial());

  Future<void> loadProfile() async {
    emit(ProfileLoading());
    try {
      final profile = _repository.getProfile();
      if (profile != null) {
        emit(ProfileLoaded(profile));
      } else {
        // Initial empty state or default values
        emit(
          ProfileLoaded(
            ProfileFormData(
              name: 'Fadi Atef',
              phone: '0123456789',
              email: 'fadi@example.com',
              nationalId: '12345678901234',
            ),
          ),
        );
      }
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> updateProfile(ProfileFormData profile) async {
    emit(ProfileLoading());
    try {
      await _repository.saveProfile(profile);
      emit(ProfileLoaded(profile));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
