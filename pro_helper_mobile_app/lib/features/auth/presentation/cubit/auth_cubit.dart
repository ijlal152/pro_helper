import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/get_current_user.dart';
import '../../domain/usecases/login_with_email.dart';
import '../../domain/usecases/logout.dart';
import '../../domain/usecases/register_user.dart';
import 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final LoginWithEmail loginWithEmail;
  final RegisterUser registerUser;
  final Logout logout;
  final GetCurrentUser getCurrentUser;

  AuthCubit({
    required this.loginWithEmail,
    required this.registerUser,
    required this.logout,
    required this.getCurrentUser,
  }) : super(AuthInitial());

  /// Check if user is already logged in
  Future<void> checkAuthStatus() async {
    emit(AuthLoading());

    final result = await getCurrentUser(const NoParams());

    result.fold(
      (failure) => emit(AuthUnauthenticated()),
      (user) => emit(AuthAuthenticated(user)),
    );
  }

  /// Login with email and password
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());

    final result = await loginWithEmail(
      LoginWithEmailParams(email: email, password: password),
    );

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(AuthAuthenticated(user)),
    );
  }

  /// Register new user
  Future<void> register({
    required String name,
    required String email,
    String? phoneNumber,
    required String password,
    required UserType userType,
    ProfessionType? professionType,
    Location? location,
  }) async {
    emit(AuthLoading());

    final result = await registerUser(
      RegisterUserParams(
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
        userType: userType,
        professionType: professionType,
        location: location,
      ),
    );

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(AuthAuthenticated(user)),
    );
  }

  /// Logout
  Future<void> signOut() async {
    emit(AuthLoading());

    final result = await logout(const NoParams());

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(AuthUnauthenticated()),
    );
  }

  /// Test login for UI testing (bypasses API)
  void testLogin({required String email, String name = 'Test User'}) {
    final mockUser = User(
      id: 'test-user-id',
      name: name,
      email: email,
      phoneNumber: '+1234567890',
      userType: UserType.customer,
    );
    emit(AuthAuthenticated(mockUser));
  }
}
