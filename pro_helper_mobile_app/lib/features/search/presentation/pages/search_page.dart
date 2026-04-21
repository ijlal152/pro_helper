import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/mock_data/mock_professionals.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../injection.dart';
import '../cubit/search_cubit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchCubit>()..initialize(),
      child: const _SearchPageContent(),
    );
  }
}

class _SearchPageContent extends StatelessWidget {
  const _SearchPageContent();

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Find Professionals',
          style: AppTypography.headline5(context),
        ),
        elevation: 0,
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is! SearchLoaded) {
            return const Center(child: CircularProgressIndicator());
          }

          // Update text controller when state changes
          if (searchController.text != state.searchQuery) {
            searchController.text = state.searchQuery;
          }

          final professionals = state.filteredProfessionals;

          return Column(
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
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: 'Search by name or service...',
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: state.searchQuery.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () {
                                    searchController.clear();
                                    context
                                        .read<SearchCubit>()
                                        .updateSearchQuery('');
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
                          context.read<SearchCubit>().updateSearchQuery(value);
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
                            label: Text(
                              'All',
                              style: AppTypography.body2(context),
                            ),
                            selected: state.selectedProfession == null,
                            onSelected: (selected) {
                              context.read<SearchCubit>().selectProfession(
                                null,
                              );
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
                                  style: AppTypography.body2(context),
                                ),
                                selected:
                                    state.selectedProfession == profession,
                                onSelected: (selected) {
                                  context.read<SearchCubit>().selectProfession(
                                    selected ? profession : null,
                                  );
                                },
                                backgroundColor: Colors.white.withOpacity(0.9),
                                selectedColor: Colors.white,
                              ),
                            );
                          }),

                          const SizedBox(width: 8),
                          // Available only filter
                          FilterChip(
                            label: Text(
                              'Available Now',
                              style: AppTypography.body2(context),
                            ),
                            selected: state.showAvailableOnly,
                            onSelected: (selected) {
                              context.read<SearchCubit>().toggleAvailableOnly();
                            },
                            backgroundColor: Colors.white.withOpacity(0.9),
                            selectedColor: Colors.green.shade100,
                            avatar: state.showAvailableOnly
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
                      style: AppTypography.headline6(
                        context,
                      ).copyWith(fontWeight: FontWeight.bold),
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
                              style: AppTypography.headline5(
                                context,
                              ).copyWith(color: Colors.grey[600]),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Try adjusting your filters',
                              style: AppTypography.body2(
                                context,
                              ).copyWith(color: Colors.grey[500]),
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
          );
        },
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
                          style: AppTypography.headline6(
                            context,
                          ).copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              user.professionType!.icon,
                              style: AppTypography.body2(context),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              user.professionType!.displayName,
                              style: AppTypography.body2(
                                context,
                              ).copyWith(color: Colors.grey[600]),
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
                      style: AppTypography.caption(context).copyWith(
                        color: professional.isAvailable
                            ? Colors.green.shade700
                            : Colors.red.shade700,
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
                    style: AppTypography.body1(
                      context,
                    ).copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 16),
                  Icon(Icons.work_outline, color: Colors.grey[600], size: 18),
                  const SizedBox(width: 4),
                  Text(
                    '${user.yearsOfExperience} years exp.',
                    style: AppTypography.body2(
                      context,
                    ).copyWith(color: Colors.grey[600]),
                  ),
                  const SizedBox(width: 16),
                  Icon(Icons.check_circle, color: Colors.grey[600], size: 18),
                  const SizedBox(width: 4),
                  Text(
                    '${professional.completedJobs} jobs',
                    style: AppTypography.body2(
                      context,
                    ).copyWith(color: Colors.grey[600]),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Bio
              Text(
                professional.bio,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.body2(
                  context,
                ).copyWith(color: Colors.grey[700]),
              ),
              const SizedBox(height: 12),

              // Rate and Action
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${professional.hourlyRate.toStringAsFixed(0)}/hour',
                    style: AppTypography.headline6(context).copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: onTap,
                    icon: const Icon(Icons.visibility, size: 18),
                    label: Text(
                      'View Profile',
                      style: AppTypography.body2(context),
                    ),
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
