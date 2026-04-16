/// Base class for all failures in the application
abstract class Failure {
  final String message;

  const Failure(this.message);
}

/// Server failure (API errors)
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

/// Cache failure (Local storage errors)
class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

/// Network failure (No internet connection)
class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

/// Location failure (GPS/Permission errors)
class LocationFailure extends Failure {
  const LocationFailure(super.message);
}

/// Authentication failure
class AuthFailure extends Failure {
  const AuthFailure(super.message);
}

/// Validation failure
class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}
