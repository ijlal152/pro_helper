part of 'profile_cubit.dart';

class ProfileState {
  final bool isDarkMode;
  final String selectedLanguage;

  const ProfileState({
    this.isDarkMode = false,
    this.selectedLanguage = 'English (US)',
  });

  ProfileState copyWith({bool? isDarkMode, String? selectedLanguage}) {
    return ProfileState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
    );
  }
}
