import 'package:flutter/material.dart';

import '../core/services/profession_service.dart';

/// Example 1: Using in a widget (works with ANY implementation)
class ProfessionListWidget extends StatelessWidget {
  const ProfessionListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Get professions through the abstraction layer
    // This works whether you use enum, OOP, or API implementation!
    final professionService = ProfessionServiceProvider.instance;
    final professions = professionService.getAll();

    return ListView.builder(
      itemCount: professions.length,
      itemBuilder: (context, index) {
        final profession = professions[index];
        return ListTile(
          leading: Text(profession.icon, style: const TextStyle(fontSize: 32)),
          title: Text(profession.displayName),
          subtitle: Text(profession.description),
          onTap: () {
            // Navigate using profession name
            // This will work with ANY implementation
            Navigator.pushNamed(context, '/professionals/${profession.name}');
          },
        );
      },
    );
  }
}

/// Example 2: Migration Strategy
/// Phase 1: Start with Enum (current - simple and works)
void setupPhase1() {
  // Default - enum based
  // No code needed, it's the default!
  ProfessionServiceProvider.instance.getAll(); // Uses enum
}

/// Phase 2: Add custom professions (hybrid approach)
void setupPhase2() {
  // Switch to hybrid mode
  ProfessionServiceProvider.useHybrid();

  final service = ProfessionServiceProvider.instance as HybridProfessionService;

  // Add custom professions at runtime!
  service.addCustomProfession(
    const ProfessionData(
      id: 'hvac',
      name: 'hvacTechnician',
      displayName: 'HVAC Technician',
      icon: '🌡️',
      description: 'Heating, ventilation, and air conditioning',
      category: 'Technical Service',
      averageHourlyRate: 70.0,
      commonServices: ['AC repair', 'Heating installation', 'Duct cleaning'],
    ),
  );

  service.addCustomProfession(
    const ProfessionData(
      id: 'carpenter',
      name: 'carpenter',
      displayName: 'Carpenter',
      icon: '🪚',
      description: 'Custom woodwork and furniture',
      category: 'Construction',
      averageHourlyRate: 55.0,
      commonServices: [
        'Custom furniture',
        'Cabinet installation',
        'Door and window repair',
      ],
    ),
  );

  // Now you have 6 original + 2 custom = 8 professions!
  print('Total professions: ${service.getAll().length}');
}

/// Phase 3: Backend-driven professions (ultimate scalability)
Future<void> setupPhase3() async {
  // Switch to API-based service
  ProfessionServiceProvider.useAPI();

  final service = ProfessionServiceProvider.instance as ApiProfessionService;

  // Fetch professions from backend
  // Admin can add/remove professions without app update!
  await service.fetchProfessions();

  print('Loaded ${service.getAll().length} professions from backend');
}

/// Example 3: Using categories
class ProfessionByCategoryWidget extends StatelessWidget {
  const ProfessionByCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final professionService = ProfessionServiceProvider.instance;
    final categories = professionService.getCategories();

    return DefaultTabController(
      length: categories.length,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            tabs: categories.map((category) => Tab(text: category)).toList(),
          ),
          Expanded(
            child: TabBarView(
              children: categories.map((category) {
                final professions = professionService.getByCategory(category);
                return ListView.builder(
                  itemCount: professions.length,
                  itemBuilder: (context, index) {
                    final profession = professions[index];
                    return ListTile(
                      leading: Text(
                        profession.icon,
                        style: const TextStyle(fontSize: 32),
                      ),
                      title: Text(profession.displayName),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(profession.description),
                          Text(
                            '\$${profession.averageHourlyRate}/hr',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

/// Example 4: Feature Flag Pattern
/// Gradually roll out new implementation
class FeatureFlags {
  static bool useOOPProfessions = false;
  static bool useHybridProfessions = false;
  static bool useAPIProfessions = false;
}

void initializeProfessionService() {
  if (FeatureFlags.useAPIProfessions) {
    ProfessionServiceProvider.useAPI();
  } else if (FeatureFlags.useHybridProfessions) {
    ProfessionServiceProvider.useHybrid();
  } else if (FeatureFlags.useOOPProfessions) {
    ProfessionServiceProvider.useOOP();
  }
  // else: default enum implementation
}

/// Example 5: Testing - Easy to mock!
class MockProfessionService implements ProfessionService {
  @override
  List<ProfessionData> getAll() {
    return [
      const ProfessionData(
        id: 'test',
        name: 'testProfession',
        displayName: 'Test Profession',
        icon: '🧪',
        description: 'For testing only',
      ),
    ];
  }

  @override
  ProfessionData? getByName(String name) {
    return getAll().first;
  }

  @override
  List<String> getCategories() => ['Test'];

  @override
  List<ProfessionData> getByCategory(String category) => getAll();
}

// In your tests:
/*
void main() {
  setUp(() {
    // Use mock service for testing
    ProfessionServiceProvider.use(MockProfessionService());
  });

  testWidgets('Should display professions', (tester) async {
    await tester.pumpWidget(ProfessionListWidget());
    expect(find.text('Test Profession'), findsOneWidget);
  });
}
*/

/// Example 6: Admin Panel - Add professions at runtime
class AdminAddProfessionForm extends StatefulWidget {
  const AdminAddProfessionForm({super.key});

  @override
  State<AdminAddProfessionForm> createState() => _AdminAddProfessionFormState();
}

class _AdminAddProfessionFormState extends State<AdminAddProfessionForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _displayNameController = TextEditingController();
  final _iconController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Name'),
            validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
          ),
          TextFormField(
            controller: _displayNameController,
            decoration: const InputDecoration(labelText: 'Display Name'),
            validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
          ),
          TextFormField(
            controller: _iconController,
            decoration: const InputDecoration(labelText: 'Icon Emoji'),
            validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
          ),
          TextFormField(
            controller: _descriptionController,
            decoration: const InputDecoration(labelText: 'Description'),
            validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Switch to hybrid mode if not already
                if (ProfessionServiceProvider.instance
                    is! HybridProfessionService) {
                  ProfessionServiceProvider.useHybrid();
                }

                final service =
                    ProfessionServiceProvider.instance
                        as HybridProfessionService;

                // Add new profession
                service.addCustomProfession(
                  ProfessionData(
                    id: _nameController.text,
                    name: _nameController.text,
                    displayName: _displayNameController.text,
                    icon: _iconController.text,
                    description: _descriptionController.text,
                  ),
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Profession added successfully!'),
                  ),
                );

                Navigator.pop(context);
              }
            },
            child: const Text('Add Profession'),
          ),
        ],
      ),
    );
  }
}

/// Example 7: Performance comparison
void performanceComparison() {
  print('=== Performance Test ===\n');

  // Enum approach (current)
  final enumStart = DateTime.now();
  ProfessionServiceProvider.instance.getAll();
  final enumDuration = DateTime.now().difference(enumStart);
  print('Enum approach: ${enumDuration.inMicroseconds}μs');

  // OOP approach
  ProfessionServiceProvider.useOOP();
  final oopStart = DateTime.now();
  ProfessionServiceProvider.instance.getAll();
  final oopDuration = DateTime.now().difference(oopStart);
  print('OOP approach: ${oopDuration.inMicroseconds}μs');

  // Hybrid approach
  ProfessionServiceProvider.useHybrid();
  final hybridStart = DateTime.now();
  ProfessionServiceProvider.instance.getAll();
  final hybridDuration = DateTime.now().difference(hybridStart);
  print('Hybrid approach: ${hybridDuration.inMicroseconds}μs');

  print('\nConclusion: For small data, performance difference is negligible!');
}
