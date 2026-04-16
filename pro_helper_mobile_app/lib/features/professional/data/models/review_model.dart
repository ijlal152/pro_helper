import '../../domain/entities/review.dart';

/// Review data model
class ReviewModel extends Review {
  const ReviewModel({
    required super.id,
    required super.professionalId,
    required super.customerId,
    required super.customerName,
    super.customerImage,
    required super.rating,
    required super.comment,
    required super.createdAt,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'] as String,
      professionalId: json['professionalId'] as String,
      customerId: json['customerId'] as String,
      customerName: json['customerName'] as String,
      customerImage: json['customerImage'] as String?,
      rating: (json['rating'] as num).toDouble(),
      comment: json['comment'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'professionalId': professionalId,
      'customerId': customerId,
      'customerName': customerName,
      'customerImage': customerImage,
      'rating': rating,
      'comment': comment,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
