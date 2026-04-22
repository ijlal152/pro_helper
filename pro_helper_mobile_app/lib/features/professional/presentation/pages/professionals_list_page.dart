import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/constants.dart';
import '../../domain/entities/professional.dart';
import '../cubit/professionals_list_cubit.dart';

class ProfessionalsListPage extends StatelessWidget {
  final String professionType;

  const ProfessionalsListPage({super.key, required this.professionType});

  ProfessionType? _getProfessionTypeFromString(String professionName) {
    try {
      return ProfessionType.values.firstWhere((e) => e.name == professionName);
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final professionTypeEnum = _getProfessionTypeFromString(professionType);

    return BlocProvider(
      create: (context) =>
          ProfessionalsListCubit()..loadProfessionals(professionType),
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF1A1A1A)),
            onPressed: () => context.pop(),
          ),
          title: Text(
            professionTypeEnum?.displayName ?? 'Professionals',
            style: const TextStyle(
              color: Color(0xFF1A1A1A),
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.filter_list, color: Color(0xFF1A1A1A)),
              onPressed: () {
                // TODO: Show filters
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Filters coming soon!')),
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<ProfessionalsListCubit, ProfessionalsListState>(
          builder: (context, state) {
            if (state is ProfessionalsListLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfessionalsListError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else if (state is ProfessionalsListLoaded) {
              if (state.professionals.isEmpty) {
                return _buildEmptyState();
              }
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.professionals.length,
                itemBuilder: (context, index) {
                  return _buildProfessionalTile(
                    context,
                    state.professionals[index],
                  );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'No professionals found',
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildProfessionalTile(
    BuildContext context,
    Professional professional,
  ) {
    return GestureDetector(
      onTap: () {
        context.push('/professional/${professional.id}');
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Profile Image
            CircleAvatar(
              radius: 35,
              backgroundColor: const Color(0xFF6C47FF),
              backgroundImage: professional.profileImage != null
                  ? NetworkImage(professional.profileImage!)
                  : null,
              child: professional.profileImage == null
                  ? Text(
                      professional.fullName[0].toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 16),

            // Professional Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  Text(
                    professional.fullName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),

                  // Bio/Description (optional)
                  if (professional.bio != null && professional.bio!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        professional.bio!,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                  const SizedBox(height: 8),

                  // Rating and Reviews
                  Row(
                    children: [
                      const Icon(Icons.star, size: 18, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(
                        professional.rating.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '(${professional.totalReviews} reviews)',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                      const Spacer(),

                      // Availability Badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: professional.isAvailable
                              ? Colors.green[50]
                              : Colors.red[50],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.circle,
                              size: 8,
                              color: professional.isAvailable
                                  ? Colors.green
                                  : Colors.red,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              professional.isAvailable ? 'Available' : 'Busy',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: professional.isAvailable
                                    ? Colors.green[700]
                                    : Colors.red[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
