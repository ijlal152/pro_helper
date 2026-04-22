import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPasswordVisibilityState {
  final bool obscurePassword;
  final bool obscureConfirmPassword;

  const RegisterPasswordVisibilityState({
    this.obscurePassword = true,
    this.obscureConfirmPassword = true,
  });

  RegisterPasswordVisibilityState copyWith({
    bool? obscurePassword,
    bool? obscureConfirmPassword,
  }) {
    return RegisterPasswordVisibilityState(
      obscurePassword: obscurePassword ?? this.obscurePassword,
      obscureConfirmPassword:
          obscureConfirmPassword ?? this.obscureConfirmPassword,
    );
  }
}

class RegisterPasswordVisibilityCubit
    extends Cubit<RegisterPasswordVisibilityState> {
  RegisterPasswordVisibilityCubit()
    : super(const RegisterPasswordVisibilityState());

  void togglePassword() {
    emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }

  void toggleConfirmPassword() {
    emit(state.copyWith(obscureConfirmPassword: !state.obscureConfirmPassword));
  }
}
