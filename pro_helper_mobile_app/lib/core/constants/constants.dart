import 'app_config.dart';

/// API endpoints
class ApiConstants {
  static const String baseUrl = AppConfig.apiBaseUrl;

  // Auth endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String logout = '/auth/logout';
  static const String refreshToken = '/auth/refresh';

  // User endpoints
  static const String userProfile = '/user/profile';
  static const String updateProfile = '/user/profile/update';

  // Professional endpoints
  static const String searchProfessionals = '/professionals/search';
  static const String professionalDetails = '/professionals';
  static const String updateAvailability = '/professionals/availability';

  // Booking endpoints
  static const String createBooking = '/bookings/create';
  static const String bookings = '/bookings';
  static const String cancelBooking = '/bookings/cancel';

  // Rating endpoints
  static const String submitRating = '/ratings/submit';
  static const String professionalRatings = '/ratings/professional';
}

/// App constants
class AppConstants {
  static const String appName = 'ProHelper';
  static const int defaultPageSize = 20;
  static const int searchRadius = 10; // kilometers

  // Storage keys
  static const String authTokenKey = 'auth_token';
  static const String userDataKey = 'user_data';
  static const String userTypeKey = 'user_type';
}

/// User types
enum UserType {
  customer,
  professional;

  String get value => name;
}

/// Professional types
enum ProfessionType {
  plumber,
  electrician;

  String get displayName {
    switch (this) {
      case ProfessionType.plumber:
        return 'Plumber';
      case ProfessionType.electrician:
        return 'Electrician';
    }
  }
}

/// Booking status
enum BookingStatus {
  pending,
  confirmed,
  inProgress,
  completed,
  cancelled;

  String get displayName {
    switch (this) {
      case BookingStatus.pending:
        return 'Pending';
      case BookingStatus.confirmed:
        return 'Confirmed';
      case BookingStatus.inProgress:
        return 'In Progress';
      case BookingStatus.completed:
        return 'Completed';
      case BookingStatus.cancelled:
        return 'Cancelled';
    }
  }
}
