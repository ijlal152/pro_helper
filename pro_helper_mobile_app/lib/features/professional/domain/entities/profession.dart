import 'package:equatable/equatable.dart';

/// Profession category entity
class Profession extends Equatable {
  final String id;
  final String name;
  final String description;
  final String? iconUrl;

  const Profession({
    required this.id,
    required this.name,
    required this.description,
    this.iconUrl,
  });

  @override
  List<Object?> get props => [id, name, description, iconUrl];
}

/// Predefined profession categories
class ProfessionCategories {
  static const List<String> categories = [
    'Plumber',
    'Electrician',
    'CCTV Installer',
    'Carpenter',
    'Painter',
    'AC Technician',
    'Appliance Repair',
    'Home Cleaning',
    'Pest Control',
    'Gardener',
  ];
}
