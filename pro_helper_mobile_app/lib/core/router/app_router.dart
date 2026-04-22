import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/professional/presentation/pages/professional_detail_page.dart';
import '../../features/professional/presentation/pages/professionals_list_page.dart';
import '../../features/profile/presentation/pages/edit_profile_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../injection.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      // TODO: Enable redirect guards when API is ready
      // For UI testing, redirect is disabled to allow free navigation
      return null;

      // final authCubit = getIt<AuthCubit>();
      // final authState = authCubit.state;

      // final isAuthenticated = authState is AuthAuthenticated;
      // final isAuthRoute =
      //     state.matchedLocation == '/login' ||
      //     state.matchedLocation == '/register';

      // // Redirect to home if authenticated and trying to access auth pages
      // if (isAuthenticated && isAuthRoute) {
      //   return '/home';
      // }

      // // Redirect to login if not authenticated and trying to access protected pages
      // if (!isAuthenticated && !isAuthRoute) {
      //   return '/login';
      // }

      // return null;
    },
    routes: [
      // Auth Routes
      GoRoute(
        path: '/login',
        builder: (context, state) => BlocProvider.value(
          value: getIt<AuthCubit>(),
          child: const LoginPage(),
        ),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => BlocProvider.value(
          value: getIt<AuthCubit>(),
          child: const RegisterPage(),
        ),
      ),

      // Home Route
      GoRoute(
        path: '/home',
        builder: (context, state) => BlocProvider.value(
          value: getIt<AuthCubit>(),
          child: const HomePage(),
        ),
      ),

      // Professionals List Route
      GoRoute(
        path: '/professionals/:professionType',
        builder: (context, state) {
          final professionType = state.pathParameters['professionType']!;
          return ProfessionalsListPage(professionType: professionType);
        },
      ),

      // Professional Detail Route
      GoRoute(
        path: '/professional/:id',
        builder: (context, state) {
          final professionalId = state.pathParameters['id']!;
          return ProfessionalDetailPage(professionalId: professionalId);
        },
      ),

      // Profile Routes
      GoRoute(
        path: '/profile',
        builder: (context, state) => BlocProvider.value(
          value: getIt<AuthCubit>(),
          child: const ProfilePage(),
        ),
      ),
      GoRoute(
        path: '/profile/edit',
        builder: (context, state) => const EditProfilePage(),
      ),
    ],
  );
}
