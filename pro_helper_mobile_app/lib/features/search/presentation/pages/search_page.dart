import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/mock_data/mock_professionals.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ProfessionType? _selectedProfession;
  bool _showAvailableOnly = false;
  String _searchQuery = '';
  final _searchController = TextEditingController();

  List<Professional> get _filteredProfessionals {
    var professionals = MockProfessionals.getAllProfessionals();

    // Filter by profession
    if (_selectedProfession != null) {
      professionals = professionals
          .where((p) => p.user.professionType == _selectedProfession)
          .toList();
    }

    // Filter by availability
    if (_showAvailableOnly) {
      professionals = professionals.where((p) => p.isAvailable).toList();
    }

    // Filter by search query
    if (_searchQuery.isNotEmpty) {
      professionals = professionals
          .where(
            (p) =>
                p.user.name.toLowerCase().contains(
                  _searchQuery.toLowerCase(),
                ) ||
                p.bio.toLowerCase().contains(_searchQuery.toLowerCase()),
          )
          .toList();
    }

    // Sort by rating (highest first)
    professionals.sort(
      (a, b) => (b.user.rating ?? 0).compareTo(a.user.rating ?? 0),
    );

    return professionals;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final professionals = _filteredProfessionals;

    return Scaffold(
      appBar: AppBar(title: const Text('Find Professionals'), elevation: 0),
      body: Column(
        children: [
          // Search and Filter Section
          Container(
            color: Theme.of(context).primaryColor,
            child: Column(
              children: [
                // Search Bar
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search by name or service...',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: _searchQuery.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                _searchController.clear();
                                setState(() {
                                  _searchQuery = '';
                                });
                              },
                            )
                          : null,
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                  ),
                ),

                // Filter Chips
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      // All filter
                      FilterChip(
                        label: const Text('All'),
                        selected: _selectedProfession == null,
                        onSelected: (selected) {
                          setState(() {
                            _selectedProfession = null;
                          });
                        },
                        backgroundColor: Colors.white.withOpacity(0.9),
                        selectedColor: Colors.white,
                      ),
                      const SizedBox(width: 8),

                      // Profession filters
                      ...ProfessionType.values.map((profession) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: FilterChip(
                            label: Text(
                              '${profession.icon} ${profession.displayName}',
                            ),
                            selected: _selectedProfession == profession,
                            onSelected: (selected) {
                              setState(() {
                                _selectedProfession = selected
                                    ? profession
                                    : null;
                              });
                            },
                            backgroundColor: Colors.white.withOpacity(0.9),
                            selectedColor: Colors.white,
                          ),
                        );
                      }),

                      const SizedBox(width: 8),
                      // Available only filter
                      FilterChip(
                        label: const Text('Available Now'),
                        selected: _showAvailableOnly,
                        onSelected: (selected) {
                          setState(() {
                            _showAvailableOnly = selected;
                          });
                        },
                        backgroundColor: Colors.white.withOpacity(0.9),
                        selectedColor: Colors.green.shade100,
                        avatar: _showAvailableOnly
                            ? const Icon(
                                Icons.check_circle,
                                size: 18,
                                color: Colors.green,
                              )
                            : null,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),

          // Results Count
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text(
                  '${professionals.length} professional${professionals.length != 1 ? 's' : ''} found',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Professionals List
          Expanded(
            child: professionals.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 80,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No professionals found',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(color: Colors.grey[600]),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Try adjusting your filters',
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: professionals.length,
                    itemBuilder: (context, index) {
                      final professional = professionals[index];
                      return ProfessionalCard(
                        professional: professional,
                        onTap: () {
                          context.push(
                            '/professional-detail/${professional.user.id}',
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class ProfessionalCard extends StatelessWidget {
  final Professional professional;
  final VoidCallback onTap;

  const ProfessionalCard({
    super.key,
    required this.professional,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final user = professional.user;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Profile Picture
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Theme.of(
                      context,
                    ).primaryColor.withOpacity(0.1),
                    child: Text(
                      user.name[0].toUpperCase(),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Name and Profession
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              user.professionType!.icon,
                              style: const TextStyle(fontSize: 14),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              user.professionType!.displayName,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Availability Badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: professional.isAvailable
                          ? Colors.green.shade50
                          : Colors.red.shade50,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: professional.isAvailable
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                    child: Text(
                      professional.isAvailable ? 'Available' : 'Busy',
                      style: TextStyle(
                        color: professional.isAvailable
                            ? Colors.green.shade700
                            : Colors.red.shade700,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Rating and Experience
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber[700], size: 20),
                  const SizedBox(width: 4),
                  Text(
                    user.rating?.toStringAsFixed(1) ?? 'N/A',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Icon(Icons.work_outline, color: Colors.grey[600], size: 18),
                  const SizedBox(width: 4),
                  Text(
                    '${user.yearsOfExperience} years exp.',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(width: 16),
                  Icon(Icons.check_circle, color: Colors.grey[600], size: 18),
                  const SizedBox(width: 4),
                  Text(
                    '${professional.completedJobs} jobs',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Bio
              Text(
                professional.bio,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.grey[700]),
              ),
              const SizedBox(height: 12),

              // Rate and Action
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${professional.hourlyRate.toStringAsFixed(0)}/hour',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: onTap,
                    icon: const Icon(Icons.visibility, size: 18),
                    label: const Text('View Profile'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
