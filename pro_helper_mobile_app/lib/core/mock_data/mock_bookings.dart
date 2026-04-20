import '../constants/constants.dart';

/// Mock bookings for testing UI
class MockBookings {
  static List<Booking> getAllBookings() {
    return [
      Booking(
        id: 'booking-1',
        professionalId: 'prof-1',
        professionalName: 'John Smith',
        profession: ProfessionType.plumber,
        customerId: 'customer-1',
        customerName: 'Test User',
        serviceDescription: 'Fix leaking kitchen sink',
        scheduledDate: DateTime.now().add(const Duration(days: 2)),
        estimatedDuration: 2,
        hourlyRate: 75.0,
        status: BookingStatus.confirmed,
        address: '123 Main St, San Francisco, CA',
      ),
      Booking(
        id: 'booking-2',
        professionalId: 'prof-3',
        professionalName: 'David Johnson',
        profession: ProfessionType.electrician,
        customerId: 'customer-1',
        customerName: 'Test User',
        serviceDescription: 'Install new light fixtures in living room',
        scheduledDate: DateTime.now().subtract(const Duration(days: 5)),
        estimatedDuration: 3,
        hourlyRate: 80.0,
        status: BookingStatus.completed,
        address: '123 Main St, San Francisco, CA',
        rating: 5.0,
        review: 'Excellent work! Very professional and on time.',
      ),
      Booking(
        id: 'booking-3',
        professionalId: 'prof-5',
        professionalName: 'Michael Chen',
        profession: ProfessionType.cctvInstaller,
        customerId: 'customer-1',
        customerName: 'Test User',
        serviceDescription: 'Install 4 CCTV cameras around property',
        scheduledDate: DateTime.now().add(const Duration(days: 7)),
        estimatedDuration: 5,
        hourlyRate: 90.0,
        status: BookingStatus.pending,
        address: '123 Main St, San Francisco, CA',
      ),
      Booking(
        id: 'booking-4',
        professionalId: 'prof-2',
        professionalName: 'Maria Garcia',
        profession: ProfessionType.plumber,
        customerId: 'customer-1',
        customerName: 'Test User',
        serviceDescription: 'Bathroom renovation - replace toilet and sink',
        scheduledDate: DateTime.now().add(const Duration(days: 1)),
        estimatedDuration: 4,
        hourlyRate: 85.0,
        status: BookingStatus.inProgress,
        address: '123 Main St, San Francisco, CA',
      ),
    ];
  }

  static List<Booking> getBookingsByStatus(BookingStatus status) {
    return getAllBookings()
        .where((booking) => booking.status == status)
        .toList();
  }

  static Booking? getBookingById(String id) {
    try {
      return getAllBookings().firstWhere((booking) => booking.id == id);
    } catch (e) {
      return null;
    }
  }

  static List<Booking> getUpcomingBookings() {
    final now = DateTime.now();
    return getAllBookings()
        .where(
          (booking) =>
              booking.scheduledDate.isAfter(now) &&
              (booking.status == BookingStatus.confirmed ||
                  booking.status == BookingStatus.pending),
        )
        .toList()
      ..sort((a, b) => a.scheduledDate.compareTo(b.scheduledDate));
  }

  static List<Booking> getPastBookings() {
    final now = DateTime.now();
    return getAllBookings()
        .where(
          (booking) =>
              booking.scheduledDate.isBefore(now) ||
              booking.status == BookingStatus.completed ||
              booking.status == BookingStatus.cancelled,
        )
        .toList()
      ..sort((a, b) => b.scheduledDate.compareTo(a.scheduledDate));
  }
}

/// Booking model
class Booking {
  final String id;
  final String professionalId;
  final String professionalName;
  final ProfessionType profession;
  final String customerId;
  final String customerName;
  final String serviceDescription;
  final DateTime scheduledDate;
  final int estimatedDuration; // in hours
  final double hourlyRate;
  final BookingStatus status;
  final String address;
  final double? rating;
  final String? review;

  Booking({
    required this.id,
    required this.professionalId,
    required this.professionalName,
    required this.profession,
    required this.customerId,
    required this.customerName,
    required this.serviceDescription,
    required this.scheduledDate,
    required this.estimatedDuration,
    required this.hourlyRate,
    required this.status,
    required this.address,
    this.rating,
    this.review,
  });

  double get totalCost => hourlyRate * estimatedDuration;
}
