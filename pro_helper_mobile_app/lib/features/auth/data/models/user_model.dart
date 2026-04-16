import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/constants.dart';
import '../../domain/entities/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String name,
    required String email,
    String? phoneNumber,
    required String userType,
    String? professionType,
    double? rating,
    int? yearsOfExperience,
    LocationModel? currentLocation,
    LocationModel? workLocation,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
class LocationModel with _$LocationModel {
  const factory LocationModel({
    required double latitude,
    required double longitude,
    String? address,
  }) = _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
}

/// Extension to convert model to entity
extension UserModelX on UserModel {
  User toEntity() {
    return User(
      id: id,
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      userType: userType == 'customer'
          ? UserType.customer
          : UserType.professional,
      professionType: professionType != null
          ? (professionType == 'plumber'
                ? ProfessionType.plumber
                : ProfessionType.electrician)
          : null,
      rating: rating,
      yearsOfExperience: yearsOfExperience,
      currentLocation: currentLocation?.toEntity(),
      workLocation: workLocation?.toEntity(),
    );
  }
}

extension LocationModelX on LocationModel {
  Location toEntity() {
    return Location(latitude: latitude, longitude: longitude, address: address);
  }
}

/// Extension to convert entity to model
extension UserEntityX on User {
  UserModel toModel() {
    return UserModel(
      id: id,
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      userType: userType.value,
      professionType: professionType?.name,
      rating: rating,
      yearsOfExperience: yearsOfExperience,
      currentLocation: currentLocation?.toModel(),
      workLocation: workLocation?.toModel(),
    );
  }
}

extension LocationEntityX on Location {
  LocationModel toModel() {
    return LocationModel(
      latitude: latitude,
      longitude: longitude,
      address: address,
    );
  }
}
