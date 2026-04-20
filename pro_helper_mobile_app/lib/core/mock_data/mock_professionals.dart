import '../../features/auth/domain/entities/user.dart';
import '../constants/constants.dart';

/// Mock data for testing UI
class MockProfessionals {
  static List<Professional> getAllProfessionals() {
    return [
      // Plumbers
      Professional(
        user: const User(
          id: 'prof-1',
          name: 'John Smith',
          email: 'john.smith@example.com',
          phoneNumber: '+1234567890',
          userType: UserType.professional,
          professionType: ProfessionType.plumber,
          rating: 4.8,
          yearsOfExperience: 8,
          currentLocation: Location(
            latitude: 37.7749,
            longitude: -122.4194,
            address: 'San Francisco, CA',
          ),
        ),
        bio:
            'Experienced plumber specializing in residential and commercial plumbing. Available for emergency services.',
        hourlyRate: 75.0,
        isAvailable: true,
        workImages: [
          'https://images.unsplash.com/photo-1581578731548-c64695cc6952?w=800',
          'https://images.unsplash.com/photo-1607472586893-edb57bdc0e39?w=800',
          'https://images.unsplash.com/photo-1584622650111-993a426fbf0a?w=800',
        ],
        servicesOffered: [
          'Pipe Installation',
          'Leak Repair',
          'Drain Cleaning',
          'Water Heater Installation',
        ],
        completedJobs: 156,
      ),
      Professional(
        user: const User(
          id: 'prof-2',
          name: 'Maria Garcia',
          email: 'maria.garcia@example.com',
          phoneNumber: '+1234567891',
          userType: UserType.professional,
          professionType: ProfessionType.plumber,
          rating: 4.9,
          yearsOfExperience: 12,
          currentLocation: Location(
            latitude: 37.7849,
            longitude: -122.4094,
            address: 'Oakland, CA',
          ),
        ),
        bio:
            'Licensed master plumber with over 12 years of experience. Specializing in bathroom and kitchen renovations.',
        hourlyRate: 85.0,
        isAvailable: true,
        workImages: [
          'https://images.unsplash.com/photo-1607472586893-edb57bdc0e39?w=800',
          'https://images.unsplash.com/photo-1584622650111-993a426fbf0a?w=800',
          'https://images.unsplash.com/photo-1581578731548-c64695cc6952?w=800',
        ],
        servicesOffered: [
          'Bathroom Renovation',
          'Kitchen Plumbing',
          'Gas Line Installation',
          'Sewer Line Repair',
        ],
        completedJobs: 234,
      ),

      // Electricians
      Professional(
        user: const User(
          id: 'prof-3',
          name: 'David Johnson',
          email: 'david.johnson@example.com',
          phoneNumber: '+1234567892',
          userType: UserType.professional,
          professionType: ProfessionType.electrician,
          rating: 4.7,
          yearsOfExperience: 10,
          currentLocation: Location(
            latitude: 37.7649,
            longitude: -122.4294,
            address: 'San Francisco, CA',
          ),
        ),
        bio:
            'Certified electrician with expertise in residential and commercial electrical work. 24/7 emergency services available.',
        hourlyRate: 80.0,
        isAvailable: true,
        workImages: [
          'https://images.unsplash.com/photo-1621905251189-08b45d6a269e?w=800',
          'https://images.unsplash.com/photo-1473341304170-971dccb5ac1e?w=800',
          'https://images.unsplash.com/photo-1581094271901-8022df4466f9?w=800',
        ],
        servicesOffered: [
          'Electrical Panel Upgrade',
          'Wiring Installation',
          'Lighting Installation',
          'Outlet & Switch Repair',
        ],
        completedJobs: 189,
      ),
      Professional(
        user: const User(
          id: 'prof-4',
          name: 'Sarah Williams',
          email: 'sarah.williams@example.com',
          phoneNumber: '+1234567893',
          userType: UserType.professional,
          professionType: ProfessionType.electrician,
          rating: 4.6,
          yearsOfExperience: 7,
          currentLocation: Location(
            latitude: 37.7549,
            longitude: -122.4394,
            address: 'Daly City, CA',
          ),
        ),
        bio:
            'Professional electrician specializing in smart home installations and energy-efficient solutions.',
        hourlyRate: 70.0,
        isAvailable: false,
        workImages: [
          'https://images.unsplash.com/photo-1581094271901-8022df4466f9?w=800',
          'https://images.unsplash.com/photo-1621905251189-08b45d6a269e?w=800',
          'https://images.unsplash.com/photo-1473341304170-971dccb5ac1e?w=800',
        ],
        servicesOffered: [
          'Smart Home Setup',
          'Solar Panel Installation',
          'EV Charger Installation',
          'Energy Audits',
        ],
        completedJobs: 112,
      ),

      // CCTV Installers
      Professional(
        user: const User(
          id: 'prof-5',
          name: 'Michael Chen',
          email: 'michael.chen@example.com',
          phoneNumber: '+1234567894',
          userType: UserType.professional,
          professionType: ProfessionType.cctvInstaller,
          rating: 4.9,
          yearsOfExperience: 9,
          currentLocation: Location(
            latitude: 37.7449,
            longitude: -122.4494,
            address: 'San Francisco, CA',
          ),
        ),
        bio:
            'Expert in security camera installation and monitoring systems. Specializing in residential and commercial security solutions.',
        hourlyRate: 90.0,
        isAvailable: true,
        workImages: [
          'https://images.unsplash.com/photo-1557597774-9d273605dfa9?w=800',
          'https://images.unsplash.com/photo-1558002038-1055907df827?w=800',
          'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=800',
        ],
        servicesOffered: [
          'CCTV Camera Installation',
          'DVR/NVR Setup',
          'Remote Monitoring Setup',
          'Security System Maintenance',
        ],
        completedJobs: 145,
      ),
      Professional(
        user: const User(
          id: 'prof-6',
          name: 'Robert Taylor',
          email: 'robert.taylor@example.com',
          phoneNumber: '+1234567895',
          userType: UserType.professional,
          professionType: ProfessionType.cctvInstaller,
          rating: 4.8,
          yearsOfExperience: 11,
          currentLocation: Location(
            latitude: 37.7349,
            longitude: -122.4594,
            address: 'Pacifica, CA',
          ),
        ),
        bio:
            'Professional security systems installer with expertise in IP cameras and network video recording.',
        hourlyRate: 95.0,
        isAvailable: true,
        workImages: [
          'https://images.unsplash.com/photo-1558002038-1055907df827?w=800',
          'https://images.unsplash.com/photo-1557597774-9d273605dfa9?w=800',
          'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=800',
        ],
        servicesOffered: [
          'IP Camera Installation',
          'Access Control Systems',
          'Alarm System Integration',
          'Video Analytics Setup',
        ],
        completedJobs: 201,
      ),

      // More professionals
      Professional(
        user: const User(
          id: 'prof-7',
          name: 'James Anderson',
          email: 'james.anderson@example.com',
          phoneNumber: '+1234567896',
          userType: UserType.professional,
          professionType: ProfessionType.plumber,
          rating: 4.5,
          yearsOfExperience: 6,
          currentLocation: Location(
            latitude: 37.7949,
            longitude: -122.3994,
            address: 'Berkeley, CA',
          ),
        ),
        bio:
            'Reliable plumber offering quality service at competitive rates. Emergency services available.',
        hourlyRate: 65.0,
        isAvailable: true,
        workImages: [
          'https://images.unsplash.com/photo-1584622650111-993a426fbf0a?w=800',
          'https://images.unsplash.com/photo-1581578731548-c64695cc6952?w=800',
        ],
        servicesOffered: [
          'General Plumbing',
          'Fixture Installation',
          'Emergency Repairs',
        ],
        completedJobs: 98,
      ),
      Professional(
        user: const User(
          id: 'prof-8',
          name: 'Lisa Martinez',
          email: 'lisa.martinez@example.com',
          phoneNumber: '+1234567897',
          userType: UserType.professional,
          professionType: ProfessionType.electrician,
          rating: 4.9,
          yearsOfExperience: 15,
          currentLocation: Location(
            latitude: 37.8049,
            longitude: -122.4294,
            address: 'Albany, CA',
          ),
        ),
        bio:
            'Master electrician with extensive experience in commercial and industrial electrical systems.',
        hourlyRate: 100.0,
        isAvailable: true,
        workImages: [
          'https://images.unsplash.com/photo-1473341304170-971dccb5ac1e?w=800',
          'https://images.unsplash.com/photo-1581094271901-8022df4466f9?w=800',
          'https://images.unsplash.com/photo-1621905251189-08b45d6a269e?w=800',
        ],
        servicesOffered: [
          'Commercial Wiring',
          'Industrial Electrical',
          'Code Compliance',
          'Electrical Inspections',
        ],
        completedJobs: 287,
      ),
    ];
  }

  static List<Professional> getProfessionalsByType(ProfessionType type) {
    return getAllProfessionals()
        .where((prof) => prof.user.professionType == type)
        .toList();
  }

  static List<Professional> getAvailableProfessionals() {
    return getAllProfessionals().where((prof) => prof.isAvailable).toList();
  }

  static Professional? getProfessionalById(String id) {
    try {
      return getAllProfessionals().firstWhere((prof) => prof.user.id == id);
    } catch (e) {
      return null;
    }
  }
}

/// Professional model extending User with additional fields
class Professional {
  final User user;
  final String bio;
  final double hourlyRate;
  final bool isAvailable;
  final List<String> workImages;
  final List<String> servicesOffered;
  final int completedJobs;

  Professional({
    required this.user,
    required this.bio,
    required this.hourlyRate,
    required this.isAvailable,
    required this.workImages,
    required this.servicesOffered,
    required this.completedJobs,
  });
}
