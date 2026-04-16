import 'package:equatable/equatable.dart';

/// Review entity for professional ratings
class Review extends Equatable {
  final String id;
  final String professionalId;
  final String customerId;
  final String customerName;
  final String? customerImage;
  final double rating;
  final String comment;
  final DateTime createdAt;

  const Review({
    required this.id,
    required this.professionalId,
    required this.customerId,
    required this.customerName,
    this.customerImage,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
    id,
    professionalId,
    customerId,
    customerName,
    customerImage,
    rating,
    comment,
    createdAt,
  ];
}
