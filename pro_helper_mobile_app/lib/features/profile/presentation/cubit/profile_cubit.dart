import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState());

  void toggleDarkMode(bool value) {
    emit(state.copyWith(isDarkMode: value));
  }

  void changeLanguage(String language) {
    emit(state.copyWith(selectedLanguage: language));
  }
}
