part of 'edit_profile_cubit.dart';

class EditProfileState {
  final String fullName;
  final String firstName;
  final String dateOfBirth;
  final String email;
  final String country;
  final String phone;
  final String gender;
  final String address;
  final bool isLoading;

  const EditProfileState({
    this.fullName = '',
    this.firstName = '',
    this.dateOfBirth = '',
    this.email = '',
    this.country = '',
    this.phone = '',
    this.gender = '',
    this.address = '',
    this.isLoading = false,
  });

  EditProfileState copyWith({
    String? fullName,
    String? firstName,
    String? dateOfBirth,
    String? email,
    String? country,
    String? phone,
    String? gender,
    String? address,
    bool? isLoading,
  }) {
    return EditProfileState(
      fullName: fullName ?? this.fullName,
      firstName: firstName ?? this.firstName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      email: email ?? this.email,
      country: country ?? this.country,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      address: address ?? this.address,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
