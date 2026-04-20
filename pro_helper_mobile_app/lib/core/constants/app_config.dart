/// Application configuration and feature flags
class AppConfig {
  /// Enable test mode with mock data (no API calls)
  static const bool useTestData = true; // Set to false for production

  /// API base URL
  static const String apiBaseUrl = 'https://api.prohelper.com';

  /// Enable debug logging
  static const bool enableLogging = true;

  /// App version
  static const String appVersion = '1.0.0';
}
