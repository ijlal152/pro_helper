import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/professional.dart';
import '../../domain/entities/review.dart';

class ProfessionalDetailState {
  final Professional? professional;
  final List<Review> reviews;
  final bool isLoading;
  final bool isBookmarked;
  final int currentImageIndex;
  final String? error;

  const ProfessionalDetailState({
    this.professional,
    this.reviews = const [],
    this.isLoading = true,
    this.isBookmarked = false,
    this.currentImageIndex = 0,
    this.error,
  });

  ProfessionalDetailState copyWith({
    Professional? professional,
    List<Review>? reviews,
    bool? isLoading,
    bool? isBookmarked,
    int? currentImageIndex,
    String? error,
  }) {
    return ProfessionalDetailState(
      professional: professional ?? this.professional,
      reviews: reviews ?? this.reviews,
      isLoading: isLoading ?? this.isLoading,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      currentImageIndex: currentImageIndex ?? this.currentImageIndex,
      error: error ?? this.error,
    );
  }
}

class ProfessionalDetailCubit extends Cubit<ProfessionalDetailState> {
  ProfessionalDetailCubit() : super(const ProfessionalDetailState());

  Future<void> loadProfessionalDetails(String professionalId) async {
    emit(state.copyWith(isLoading: true));

    try {
      // TODO: Fetch from repository
      await Future.delayed(const Duration(seconds: 1));

      final professional = _getMockProfessional(professionalId);
      final reviews = _getMockReviews(professionalId);

      emit(
        state.copyWith(
          professional: professional,
          reviews: reviews,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: 'Failed to load professional details: $e',
        ),
      );
    }
  }

  void toggleBookmark() {
    emit(state.copyWith(isBookmarked: !state.isBookmarked));
  }

  void updateImageIndex(int index) {
    emit(state.copyWith(currentImageIndex: index));
  }

  Professional _getMockProfessional(String professionalId) {
    return Professional(
      id: professionalId,
      userId: 'user_123',
      fullName: 'Ahmed Khan',
      email: 'ahmed@example.com',
      phoneNumber: '+923001234567',
      profession: 'plumber',
      experienceYears: 8,
      bio:
          'Experienced plumber with 8 years of expertise in residential and commercial plumbing. Specialized in pipe installations, repairs, and water system maintenance.',
      rating: 4.7,
      totalJobs: 150,
      totalReviews: 45,
      isAvailable: true,
      workImages: [
        'https://via.placeholder.com/400x300/6C47FF/FFFFFF?text=Work+1',
        'https://via.placeholder.com/400x300/4CAF50/FFFFFF?text=Work+2',
        'https://via.placeholder.com/400x300/FF9800/FFFFFF?text=Work+3',
      ],
      profileImage: null,
      createdAt: DateTime.now().subtract(const Duration(days: 730)),
    );
  }

  List<Review> _getMockReviews(String professionalId) {
    return [
      Review(
        id: '1',
        professionalId: professionalId,
        customerId: 'user_1',
        customerName: 'Ali Hassan',
        rating: 5.0,
        comment: 'Excellent work! Very professional and punctual.',
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
      ),
      Review(
        id: '2',
        professionalId: professionalId,
        customerId: 'user_2',
        customerName: 'Sara Ahmed',
        rating: 4.5,
        comment: 'Good service, but slightly expensive.',
        createdAt: DateTime.now().subtract(const Duration(days: 15)),
      ),
      Review(
        id: '3',
        professionalId: professionalId,
        customerId: 'user_3',
        customerName: 'Bilal Mahmood',
        rating: 5.0,
        comment: 'Highly recommended! Fixed the issue quickly.',
        createdAt: DateTime.now().subtract(const Duration(days: 30)),
      ),
    ];
  }
}
