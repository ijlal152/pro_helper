import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../features/auth/presentation/cubit/auth_state.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/pages/welcome_page.dart';
import '../../features/booking/presentation/pages/bookings_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/search/presentation/pages/search_page.dart';
import '../../injection.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final authCubit = getIt<AuthCubit>();
      final authState = authCubit.state;

      final isAuthenticated = authState is AuthAuthenticated;
      final isAuthRoute =
          state.matchedLocation == '/login' ||
          state.matchedLocation == '/register' ||
          state.matchedLocation == '/';

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
      GoRoute(path: '/home', builder: (context, state) => const HomePage()),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(path: '/search', builder: (context, state) => const SearchPage()),
      GoRoute(
        path: '/bookings',
        builder: (context, state) => const BookingsPage(),
      ),
    ],
  );
}
