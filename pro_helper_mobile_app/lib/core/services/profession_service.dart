import 'package:pro_helper_mobile_app/core/models/profession.dart';

import '../constants/constants.dart';

/// Abstraction layer that works with both enum and OOP approaches
/// This allows you to migrate from enum to OOP gradually

/// Common interface for profession data
class ProfessionData {
  final String id;
  final String name;
  final String displayName;
  final String icon;
  final String description;
  final String category;
  final List<String> commonServices;
  final double averageHourlyRate;

  const ProfessionData({
    required this.id,
    required this.name,
    required this.displayName,
    required this.icon,
    required this.description,
    this.category = 'General',
    this.commonServices = const [],
    this.averageHourlyRate = 0.0,
  });

  /// Create from enum (current approach)
  factory ProfessionData.fromEnum(ProfessionType type) {
    return ProfessionData(
      id: type.name,
      name: type.name,
      displayName: type.displayName,
      icon: type.icon,
      description: type.description,
    );
  }

  /// Create from OOP class
  factory ProfessionData.fromProfession(Profession profession) {
    return ProfessionData(
      id: profession.id,
      name: profession.name,
      displayName: profession.displayName,
      icon: profession.icon,
      description: profession.description,
      category: profession.category,
      commonServices: profession.commonServices,
      averageHourlyRate: profession.averageHourlyRate,
    );
  }

  /// Create from JSON (backend)
  factory ProfessionData.fromJson(Map<String, dynamic> json) {
    return ProfessionData(
      id: json['id'] as String,
      name: json['name'] as String,
      displayName: json['display_name'] as String,
      icon: json['icon'] as String,
      description: json['description'] as String,
      category: json['category'] as String? ?? 'General',
      commonServices:
          (json['common_services'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      averageHourlyRate:
          (json['average_hourly_rate'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'display_name': displayName,
      'icon': icon,
      'description': description,
      'category': category,
      'common_services': commonServices,
      'average_hourly_rate': averageHourlyRate,
    };
  }
}

/// Abstract service for managing professions
/// This allows you to swap implementations without changing UI code
abstract class ProfessionService {
  List<ProfessionData> getAll();
  ProfessionData? getByName(String name);
  List<String> getCategories();
  List<ProfessionData> getByCategory(String category);
}

/// Implementation using ENUM (current approach)
/// Use this for now - simple and works well
class EnumProfessionService implements ProfessionService {
  @override
  List<ProfessionData> getAll() {
    return ProfessionType.values
        .map((type) => ProfessionData.fromEnum(type))
        .toList();
  }

  @override
  ProfessionData? getByName(String name) {
    try {
      final type = ProfessionType.values.firstWhere((e) => e.name == name);
      return ProfessionData.fromEnum(type);
    } catch (_) {
      return null;
    }
  }

  @override
  List<String> getCategories() {
    // For enum approach, we could add categories later
    return ['All Services'];
  }

  @override
  List<ProfessionData> getByCategory(String category) {
    return getAll();
  }
}

/// Implementation using OOP (scalable approach)
/// Switch to this when you need more flexibility
class OOPProfessionService implements ProfessionService {
  final ProfessionRegistry _registry = ProfessionRegistry();

  @override
  List<ProfessionData> getAll() {
    return _registry.all
        .map((profession) => ProfessionData.fromProfession(profession))
        .toList();
  }

  @override
  ProfessionData? getByName(String name) {
    final profession = _registry.getByName(name);
    return profession != null
        ? ProfessionData.fromProfession(profession)
        : null;
  }

  @override
  List<String> getCategories() {
    return _registry.categories;
  }

  @override
  List<ProfessionData> getByCategory(String category) {
    return _registry
        .getByCategory(category)
        .map((profession) => ProfessionData.fromProfession(profession))
        .toList();
  }
}

/// HYBRID approach - Best of both worlds!
/// Use enum for core professions + allow custom additions
class HybridProfessionService implements ProfessionService {
  final Map<String, ProfessionData> _customProfessions = {};

  /// Add custom profession at runtime
  void addCustomProfession(ProfessionData profession) {
    _customProfessions[profession.name] = profession;
  }

  /// Remove custom profession
  void removeCustomProfession(String name) {
    _customProfessions.remove(name);
  }

  @override
  List<ProfessionData> getAll() {
    // Get enum-based professions
    final enumProfessions = ProfessionType.values
        .map((type) => ProfessionData.fromEnum(type))
        .toList();

    // Add custom professions
    return [...enumProfessions, ..._customProfessions.values];
  }

  @override
  ProfessionData? getByName(String name) {
    // First check enum professions
    try {
      final type = ProfessionType.values.firstWhere((e) => e.name == name);
      return ProfessionData.fromEnum(type);
    } catch (_) {
      // Fall back to custom professions
      return _customProfessions[name];
    }
  }

  @override
  List<String> getCategories() {
    final categories = <String>{};
    for (var profession in getAll()) {
      categories.add(profession.category);
    }
    return categories.toList();
  }

  @override
  List<ProfessionData> getByCategory(String category) {
    return getAll().where((p) => p.category == category).toList();
  }
}

/// Future: API-based service
/// Load professions from backend - ultimate scalability!
class ApiProfessionService implements ProfessionService {
  // Cached professions
  List<ProfessionData>? _cachedProfessions;

  /// Fetch professions from backend
  Future<void> fetchProfessions() async {
    // TODO: Implement API call
    // final response = await dio.get('/api/professions');
    // _cachedProfessions = (response.data as List)
    //     .map((json) => ProfessionData.fromJson(json))
    //     .toList();

    // For now, use enum as fallback
    _cachedProfessions = ProfessionType.values
        .map((type) => ProfessionData.fromEnum(type))
        .toList();
  }

  @override
  List<ProfessionData> getAll() {
    return _cachedProfessions ?? [];
  }

  @override
  ProfessionData? getByName(String name) {
    return _cachedProfessions?.firstWhere(
      (p) => p.name == name,
      orElse: () => _cachedProfessions!.first,
    );
  }

  @override
  List<String> getCategories() {
    final categories = <String>{};
    for (var profession in getAll()) {
      categories.add(profession.category);
    }
    return categories.toList();
  }

  @override
  List<ProfessionData> getByCategory(String category) {
    return getAll().where((p) => p.category == category).toList();
  }
}

// Singleton instance - swap implementations easily!
class ProfessionServiceProvider {
  static ProfessionService? _instance;

  /// Get current instance (defaults to Enum-based)
  static ProfessionService get instance {
    _instance ??= EnumProfessionService();
    return _instance!;
  }

  /// Switch to OOP implementation
  static void useOOP() {
    _instance = OOPProfessionService();
  }

  /// Switch to Hybrid implementation
  static void useHybrid() {
    _instance = HybridProfessionService();
  }

  /// Switch to API implementation
  static void useAPI() {
    _instance = ApiProfessionService();
  }

  /// Use custom implementation
  static void use(ProfessionService service) {
    _instance = service;
  }
}

// Usage example in your UI:
/*
// In your widget:
final professionService = ProfessionServiceProvider.instance;
final allProfessions = professionService.getAll();

// Later, when you want to add custom professions:
ProfessionServiceProvider.useHybrid();
final hybridService = ProfessionServiceProvider.instance as HybridProfessionService;
hybridService.addCustomProfession(
  ProfessionData(
    id: 'hvac',
    name: 'hvacTechnician',
    displayName: 'HVAC Technician',
    icon: '🌡️',
    description: 'Heating and cooling systems',
  ),
);

// Or switch to API-based when backend is ready:
ProfessionServiceProvider.useAPI();
await (ProfessionServiceProvider.instance as ApiProfessionService).fetchProfessions();
*/
