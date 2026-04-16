import 'package:equatable/equatable.dart';

import '../../../../core/constants/constants.dart';

/// User entity
class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String? phoneNumber;
  final UserType userType;
  final ProfessionType? professionType;
  final double? rating;
  final int? yearsOfExperience;
  final Location? currentLocation;
  final Location? workLocation;

  const User({
    required this.id,
    required this.name,
    required this.email,
    this.phoneNumber,
    required this.userType,
    this.professionType,
    this.rating,
    this.yearsOfExperience,
    this.currentLocation,
    this.workLocation,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        phoneNumber,
        userType,
        professionType,
        rating,
        yearsOfExperience,
        currentLocation,
        workLocation,
      ];
}

/// Location entity
class Location extends Equatable {
  final double latitude;
  final double longitude;
  final String? address;

  const Location({
    required this.latitude,
    required this.longitude,
    this.address,
  });

  @override
  List<Object?> get props => [latitude, longitude, address];
}
