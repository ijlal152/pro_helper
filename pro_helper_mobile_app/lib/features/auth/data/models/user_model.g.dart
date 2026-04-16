// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(
  Map<String, dynamic> json,
) => _$UserModelImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  phoneNumber: json['phoneNumber'] as String?,
  userType: json['userType'] as String,
  professionType: json['professionType'] as String?,
  rating: (json['rating'] as num?)?.toDouble(),
  yearsOfExperience: (json['yearsOfExperience'] as num?)?.toInt(),
  currentLocation: json['currentLocation'] == null
      ? null
      : LocationModel.fromJson(json['currentLocation'] as Map<String, dynamic>),
  workLocation: json['workLocation'] == null
      ? null
      : LocationModel.fromJson(json['workLocation'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'userType': instance.userType,
      'professionType': instance.professionType,
      'rating': instance.rating,
      'yearsOfExperience': instance.yearsOfExperience,
      'currentLocation': instance.currentLocation,
      'workLocation': instance.workLocation,
    };

_$LocationModelImpl _$$LocationModelImplFromJson(Map<String, dynamic> json) =>
    _$LocationModelImpl(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      address: json['address'] as String?,
    );

Map<String, dynamic> _$$LocationModelImplToJson(_$LocationModelImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': instance.address,
    };
