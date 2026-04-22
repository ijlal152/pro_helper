import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit({
    required String fullName,
    required String firstName,
    required String dateOfBirth,
    required String email,
    required String country,
    required String phone,
    required String gender,
    required String address,
  }) : super(
         EditProfileState(
           fullName: fullName,
           firstName: firstName,
           dateOfBirth: dateOfBirth,
           email: email,
           country: country,
           phone: phone,
           gender: gender,
           address: address,
         ),
       );

  void updateFullName(String value) {
    emit(state.copyWith(fullName: value));
  }

  void updateFirstName(String value) {
    emit(state.copyWith(firstName: value));
  }

  void updateDateOfBirth(String value) {
    emit(state.copyWith(dateOfBirth: value));
  }

  void updateEmail(String value) {
    emit(state.copyWith(email: value));
  }

  void updateCountry(String value) {
    emit(state.copyWith(country: value));
  }

  void updatePhone(String value) {
    emit(state.copyWith(phone: value));
  }

  void updateGender(String value) {
    emit(state.copyWith(gender: value));
  }

  void updateAddress(String value) {
    emit(state.copyWith(address: value));
  }

  void setLoading(bool value) {
    emit(state.copyWith(isLoading: value));
  }

  Future<void> saveProfile() async {
    emit(state.copyWith(isLoading: true));

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    // TODO: Integrate with actual API when ready

    emit(state.copyWith(isLoading: false));
  }
}
