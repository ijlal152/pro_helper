/// Object-oriented approach for professions
/// This allows for more flexibility and extensibility

/// Base abstract class for all professions
abstract class Profession {
  String get id;
  String get name;
  String get displayName;
  String get icon;
  String get description;
  String get category; // e.g., 'Home Service', 'Technical', 'Construction'

  // Optional: Different professions might have different properties
  List<String> get requiredCertifications => [];
  double get averageHourlyRate => 0.0;
  List<String> get commonServices => [];

  // Method that can be overridden for custom behavior
  String getBookingMessage() {
    return 'Book a $displayName professional';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Profession && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => displayName;
}

/// Concrete implementations
class Plumber extends Profession {
  @override
  String get id => 'plumber';

  @override
  String get name => 'plumber';

  @override
  String get displayName => 'Plumber';

  @override
  String get icon => '🔧';

  @override
  String get description => 'Pipe fixing, water system repairs';

  @override
  String get category => 'Home Service';

  @override
  List<String> get commonServices => [
    'Pipe repair',
    'Water heater installation',
    'Drain cleaning',
    'Faucet replacement',
  ];

  @override
  double get averageHourlyRate => 50.0;

  @override
  List<String> get requiredCertifications => ['Plumbing License'];
}

class Electrician extends Profession {
  @override
  String get id => 'electrician';

  @override
  String get name => 'electrician';

  @override
  String get displayName => 'Electrician';

  @override
  String get icon => '⚡';

  @override
  String get description => 'Electrical wiring & repairs';

  @override
  String get category => 'Technical Service';

  @override
  List<String> get commonServices => [
    'Wiring installation',
    'Circuit breaker repair',
    'Lighting installation',
    'Electrical inspection',
  ];

  @override
  double get averageHourlyRate => 65.0;

  @override
  List<String> get requiredCertifications => [
    'Electrical License',
    'Safety Certification',
  ];
}

class CCTVInstaller extends Profession {
  @override
  String get id => 'cctv_installer';

  @override
  String get name => 'cctvInstaller';

  @override
  String get displayName => 'CCTV Installation';

  @override
  String get icon => '📹';

  @override
  String get description => 'Security camera installation';

  @override
  String get category => 'Security Service';

  @override
  List<String> get commonServices => [
    'Camera installation',
    'DVR setup',
    'System maintenance',
    'Remote monitoring setup',
  ];

  @override
  double get averageHourlyRate => 55.0;
}

class SolarPanelInstaller extends Profession {
  @override
  String get id => 'solar_panel_installer';

  @override
  String get name => 'solarPanelInstaller';

  @override
  String get displayName => 'Solar Panel Installation';

  @override
  String get icon => '☀️';

  @override
  String get description => 'Solar panel setup & maintenance';

  @override
  String get category => 'Green Energy';

  @override
  List<String> get commonServices => [
    'Solar panel installation',
    'Inverter setup',
    'Battery storage installation',
    'System maintenance',
  ];

  @override
  double get averageHourlyRate => 75.0;

  @override
  List<String> get requiredCertifications => [
    'Solar Installation Certification',
    'Electrical License',
  ];
}

class Painter extends Profession {
  @override
  String get id => 'painter';

  @override
  String get name => 'painter';

  @override
  String get displayName => 'Painting';

  @override
  String get icon => '🎨';

  @override
  String get description => 'Interior & exterior painting';

  @override
  String get category => 'Home Improvement';

  @override
  List<String> get commonServices => [
    'Interior painting',
    'Exterior painting',
    'Wall texture',
    'Cabinet refinishing',
  ];

  @override
  double get averageHourlyRate => 40.0;
}

class Mover extends Profession {
  @override
  String get id => 'mover';

  @override
  String get name => 'mover';

  @override
  String get displayName => 'Shifting';

  @override
  String get icon => '🚚';

  @override
  String get description => 'Home & office relocation';

  @override
  String get category => 'Logistics';

  @override
  List<String> get commonServices => [
    'Residential moving',
    'Office relocation',
    'Packing services',
    'Furniture assembly',
  ];

  @override
  double get averageHourlyRate => 45.0;

  @override
  String getBookingMessage() {
    return 'Schedule your move with professional movers';
  }
}

/// Registry pattern for managing all professions
class ProfessionRegistry {
  static final ProfessionRegistry _instance = ProfessionRegistry._internal();
  factory ProfessionRegistry() => _instance;
  ProfessionRegistry._internal();

  final Map<String, Profession> _professions = {
    'plumber': Plumber(),
    'electrician': Electrician(),
    'cctvInstaller': CCTVInstaller(),
    'solarPanelInstaller': SolarPanelInstaller(),
    'painter': Painter(),
    'mover': Mover(),
  };

  /// Register a new profession at runtime (extensibility!)
  void register(Profession profession) {
    _professions[profession.name] = profession;
  }

  /// Get profession by name
  Profession? getByName(String name) => _professions[name];

  /// Get all professions
  List<Profession> get all => _professions.values.toList();

  /// Get professions by category
  List<Profession> getByCategory(String category) {
    return _professions.values.where((p) => p.category == category).toList();
  }

  /// Get all categories
  List<String> get categories {
    return _professions.values.map((p) => p.category).toSet().toList();
  }
}

/// Extension for easy access
extension ProfessionExtension on String {
  Profession? toProfession() => ProfessionRegistry().getByName(this);
}
