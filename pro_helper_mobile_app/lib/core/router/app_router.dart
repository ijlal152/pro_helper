import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_config.dart';
import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../features/auth/presentation/cubit/auth_state.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/pages/welcome_page.dart';
import '../../features/booking/presentation/pages/bookings_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/professional/presentation/bloc/professional_registration_bloc.dart';
import '../../features/professional/presentation/pages/professional_detail_page.dart';
import '../../features/professional/presentation/pages/professional_registration_screen.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/search/presentation/pages/search_page.dart';
import '../../injection.dart';

// Create a notifier for auth state changes
class AuthNotifier extends ChangeNotifier {
  final AuthCubit authCubit;

  AuthNotifier(this.authCubit) {
    authCubit.stream.listen((_) {
      notifyListeners();
    });
  }
}

class AppRouter {
  static final _authNotifier = AuthNotifier(getIt<AuthCubit>());

  static GoRouter router = GoRouter(
    initialLocation: '/',
    refreshListenable: _authNotifier,
    redirect: (context, state) {
      final authCubit = getIt<AuthCubit>();
      final authState = authCubit.state;

      final isAuthenticated = authState is AuthAuthenticated;
      final isAuthRoute =
          state.matchedLocation == '/login' ||
          state.matchedLocation == '/register' ||
          state.matchedLocation == '/';

      // In test mode, allow access to professional registration
      final isProfessionalRegistration = state.matchedLocation.startsWith(
        '/professional-registration',
      );
      if (AppConfig.useTestData && isProfessionalRegistration) {
        return null; // Allow access in test mode
      }

      // Redirect to home if authenticated and trying to access auth pages
      if (isAuthenticated && isAuthRoute) {
        return '/home';
      }

      // Redirect to welcome if not authenticated and trying to access protected pages
      if (!isAuthenticated && !isAuthRoute) {
        return '/';
      }

      return null; // No redirect needed
    },
    routes: [
      GoRoute(path: '/', builder: (context, state) => const WelcomePage()),
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: '/professional-registration/:userId',
        builder: (context, state) {
          final userId = state.pathParameters['userId']!;
          return BlocProvider(
            create: (context) => getIt<ProfessionalRegistrationBloc>(),
            child: ProfessionalRegistrationScreen(userId: userId),
          );
        },
      ),
      GoRoute(path: '/home', builder: (context, state) => const HomePage()),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(path: '/search', builder: (context, state) => const SearchPage()),
      GoRoute(
        path: '/professional-detail/:id',
        builder: (context, state) {
          final professionalId = state.pathParameters['id']!;
          return ProfessionalDetailPage(professionalId: professionalId);
        },
      ),
      GoRoute(
        path: '/bookings',
        builder: (context, state) => const BookingsPage(),
      ),
    ],
  );
}
