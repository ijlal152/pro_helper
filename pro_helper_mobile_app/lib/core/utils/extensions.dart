import 'package:intl/intl.dart';

/// Extension methods for String
extension StringExtension on String {
  /// Capitalize first letter
  String get capitalize {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Check if string is a valid email
  bool get isValidEmail {
    return RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+').hasMatch(this);
  }

  /// Check if string is a valid phone number
  bool get isValidPhoneNumber {
    return RegExp(r'^\+?[1-9]\d{9,14}$').hasMatch(this);
  }
}

/// Extension methods for DateTime
extension DateTimeExtension on DateTime {
  /// Format date to 'MMM dd, yyyy'
  String get formattedDate {
    return DateFormat('MMM dd, yyyy').format(this);
  }

  /// Format date with time
  String get formattedDateTime {
    return DateFormat('MMM dd, yyyy hh:mm a').format(this);
  }

  /// Format time only
  String get formattedTime {
    return DateFormat('hh:mm a').format(this);
  }
}

/// Extension methods for double
extension DoubleExtension on double {
  /// Format rating (e.g., 4.5)
  String get formattedRating {
    return toStringAsFixed(1);
  }

  /// Format distance in km
  String get formattedDistance {
    if (this < 1) {
      return '${(this * 1000).round()} m';
    }
    return '${toStringAsFixed(1)} km';
  }
}
