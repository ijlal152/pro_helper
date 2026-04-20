import '../models/professional_model.dart';
import '../models/review_model.dart';

/// Mock data for testing UI
class MockProfessionalData {
  static final List<ProfessionalModel> professionals = [
    ProfessionalModel(
      id: '1',
      userId: 'user1',
      fullName: 'Ahmed Hassan',
      email: 'ahmed.hassan@email.com',
      phoneNumber: '+971 50 123 4567',
      profession: 'Plumber',
      experienceYears: 8,
      bio:
          'Professional plumber with 8 years of experience. Specialized in residential and commercial plumbing services. Available 24/7 for emergency repairs.',
      rating: 4.8,
      totalJobs: 156,
      totalReviews: 89,
      isAvailable: true,
      workImages: [
        'https://picsum.photos/400/300?random=1',
        'https://picsum.photos/400/300?random=2',
        'https://picsum.photos/400/300?random=3',
      ],
      profileImage: 'https://i.pravatar.cc/300?img=12',
      createdAt: DateTime.now().subtract(const Duration(days: 365 * 2)),
      updatedAt: DateTime.now().subtract(const Duration(days: 5)),
    ),
    ProfessionalModel(
      id: '2',
      userId: 'user2',
      fullName: 'Mohammed Ali',
      email: 'mohammed.ali@email.com',
      phoneNumber: '+971 52 234 5678',
      profession: 'Electrician',
      experienceYears: 12,
      bio:
          'Certified electrician specializing in home automation, electrical installations, and repairs. Licensed and insured.',
      rating: 4.9,
      totalJobs: 234,
      totalReviews: 145,
      isAvailable: true,
      workImages: [
        'https://picsum.photos/400/300?random=4',
        'https://picsum.photos/400/300?random=5',
      ],
      profileImage: 'https://i.pravatar.cc/300?img=33',
      createdAt: DateTime.now().subtract(const Duration(days: 365 * 3)),
      updatedAt: DateTime.now().subtract(const Duration(days: 2)),
    ),
    ProfessionalModel(
      id: '3',
      userId: 'user3',
      fullName: 'Fatima Khan',
      email: 'fatima.khan@email.com',
      phoneNumber: '+971 55 345 6789',
      profession: 'CCTV Installer',
      experienceYears: 5,
      bio:
          'Expert in security camera installation and smart home security systems. Providing complete CCTV solutions for homes and offices.',
      rating: 4.7,
      totalJobs: 98,
      totalReviews: 67,
      isAvailable: true,
      workImages: [
        'https://picsum.photos/400/300?random=6',
        'https://picsum.photos/400/300?random=7',
        'https://picsum.photos/400/300?random=8',
        'https://picsum.photos/400/300?random=9',
      ],
      profileImage: 'https://i.pravatar.cc/300?img=47',
      createdAt: DateTime.now().subtract(const Duration(days: 365)),
      updatedAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
    ProfessionalModel(
      id: '4',
      userId: 'user4',
      fullName: 'Omar Abdullah',
      email: 'omar.abdullah@email.com',
      phoneNumber: '+971 50 456 7890',
      profession: 'Carpenter',
      experienceYears: 15,
      bio:
          'Master carpenter with expertise in custom furniture, cabinet making, and home renovations.',
      rating: 5.0,
      totalJobs: 312,
      totalReviews: 198,
      isAvailable: false,
      workImages: [
        'https://picsum.photos/400/300?random=10',
        'https://picsum.photos/400/300?random=11',
      ],
      profileImage: 'https://i.pravatar.cc/300?img=68',
      createdAt: DateTime.now().subtract(const Duration(days: 365 * 5)),
      updatedAt: DateTime.now().subtract(const Duration(hours: 3)),
    ),
    ProfessionalModel(
      id: '5',
      userId: 'user5',
      fullName: 'Sara Ahmed',
      email: 'sara.ahmed@email.com',
      phoneNumber: '+971 52 567 8901',
      profession: 'Painter',
      experienceYears: 6,
      bio:
          'Professional painter offering interior and exterior painting services. Quality work guaranteed.',
      rating: 4.6,
      totalJobs: 142,
      totalReviews: 95,
      isAvailable: true,
      workImages: [
        'https://picsum.photos/400/300?random=12',
        'https://picsum.photos/400/300?random=13',
        'https://picsum.photos/400/300?random=14',
      ],
      profileImage: 'https://i.pravatar.cc/300?img=28',
      createdAt: DateTime.now().subtract(const Duration(days: 365 * 2)),
      updatedAt: DateTime.now().subtract(const Duration(days: 7)),
    ),
  ];

  static List<ReviewModel> getReviewsForProfessional(String professionalId) {
    return [
      ReviewModel(
        id: 'review1',
        professionalId: professionalId,
        customerId: 'customer1',
        customerName: 'John Smith',
        customerImage: 'https://i.pravatar.cc/150?img=15',
        rating: 5.0,
        comment:
            'Excellent service! Very professional and completed the work on time.',
        createdAt: DateTime.now().subtract(const Duration(days: 15)),
      ),
      ReviewModel(
        id: 'review2',
        professionalId: professionalId,
        customerId: 'customer2',
        customerName: 'Lisa Anderson',
        customerImage: 'https://i.pravatar.cc/150?img=45',
        rating: 4.5,
        comment: 'Great work quality. Would definitely recommend!',
        createdAt: DateTime.now().subtract(const Duration(days: 30)),
      ),
      ReviewModel(
        id: 'review3',
        professionalId: professionalId,
        customerId: 'customer3',
        customerName: 'Mike Johnson',
        rating: 5.0,
        comment: 'Very satisfied with the service. Professional and skilled.',
        createdAt: DateTime.now().subtract(const Duration(days: 45)),
      ),
    ];
  }

  static ProfessionalModel getProfessionalById(String id) {
    return professionals.firstWhere(
      (p) => p.id == id,
      orElse: () => professionals.first,
    );
  }

  static List<ProfessionalModel> getProfessionalsByProfession(
    String profession,
  ) {
    return professionals.where((p) => p.profession == profession).toList();
  }

  static List<ProfessionalModel> getAvailableProfessionals() {
    return professionals.where((p) => p.isAvailable).toList();
  }
}
