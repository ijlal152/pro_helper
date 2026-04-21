import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/mock_data/mock_bookings.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../injection.dart';
import '../cubit/bookings_cubit.dart';

class BookingsPage extends StatelessWidget {
  const BookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<BookingsCubit>()..initialize(),
      child: const _BookingsPageContent(),
    );
  }
}

class _BookingsPageContent extends StatelessWidget {
  const _BookingsPageContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingsCubit, BookingsState>(
      builder: (context, state) {
        final cubit = context.read<BookingsCubit>();
        final upcomingBookings = MockBookings.getUpcomingBookings();
        final pastBookings = MockBookings.getPastBookings();

        return DefaultTabController(
          length: 2,
          initialIndex: (state as BookingsLoaded).selectedTabIndex,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'My Bookings',
                style: AppTypography.headingLarge(context),
              ),
              bottom: TabBar(
                onTap: (index) => cubit.selectTab(index),
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Upcoming',
                          style: AppTypography.bodyMedium(context),
                        ),
                        if (upcomingBookings.isNotEmpty)
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              '${upcomingBookings.length}',
                              style: AppTypography.bodySmall(
                                context,
                              ).copyWith(color: Colors.white),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Past',
                      style: AppTypography.bodyMedium(context),
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                // Upcoming Bookings Tab
                upcomingBookings.isEmpty
                    ? _buildEmptyState(
                        context: context,
                        icon: Icons.calendar_today,
                        title: 'No Upcoming Bookings',
                        subtitle: 'Find professionals and book their services',
                        actionLabel: 'Browse Professionals',
                        onAction: () => context.push('/search'),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: upcomingBookings.length,
                        itemBuilder: (context, index) {
                          return BookingCard(
                            booking: upcomingBookings[index],
                            isUpcoming: true,
                          );
                        },
                      ),

                // Past Bookings Tab
                pastBookings.isEmpty
                    ? _buildEmptyState(
                        context: context,
                        icon: Icons.history,
                        title: 'No Past Bookings',
                        subtitle: 'Your completed bookings will appear here',
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: pastBookings.length,
                        itemBuilder: (context, index) {
                          return BookingCard(
                            booking: pastBookings[index],
                            isUpcoming: false,
                          );
                        },
                      ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmptyState({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 100, color: Colors.grey[300]),
            const SizedBox(height: 24),
            Text(title, style: AppTypography.headingMedium(context)),
            const SizedBox(height: 8),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: AppTypography.bodyMedium(
                context,
              ).copyWith(color: Colors.grey[600]),
            ),
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: onAction,
                icon: const Icon(Icons.search),
                label: Text(actionLabel),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class BookingCard extends StatelessWidget {
  final Booking booking;
  final bool isUpcoming;

  const BookingCard({
    super.key,
    required this.booking,
    required this.isUpcoming,
  });

  Color _getStatusColor() {
    switch (booking.status) {
      case BookingStatus.pending:
        return Colors.orange;
      case BookingStatus.confirmed:
        return Colors.green;
      case BookingStatus.inProgress:
        return Colors.blue;
      case BookingStatus.completed:
        return Colors.grey;
      case BookingStatus.cancelled:
        return Colors.red;
    }
  }

  IconData _getStatusIcon() {
    switch (booking.status) {
      case BookingStatus.pending:
        return Icons.schedule;
      case BookingStatus.confirmed:
        return Icons.check_circle;
      case BookingStatus.inProgress:
        return Icons.build;
      case BookingStatus.completed:
        return Icons.done_all;
      case BookingStatus.cancelled:
        return Icons.cancel;
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BookingsCubit>();
    final dateFormat = DateFormat('MMM dd, yyyy');
    final timeFormat = DateFormat('h:mm a');

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          booking.profession.icon,
                          style: AppTypography.headingMedium(context),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              booking.professionalName,
                              style: AppTypography.bodyLarge(
                                context,
                              ).copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              booking.profession.displayName,
                              style: AppTypography.bodySmall(
                                context,
                              ).copyWith(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor().withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: _getStatusColor()),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _getStatusIcon(),
                        size: 16,
                        color: _getStatusColor(),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        booking.status.displayName,
                        style: AppTypography.bodySmall(context).copyWith(
                          fontWeight: FontWeight.bold,
                          color: _getStatusColor(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Service Description
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.description, size: 18, color: Colors.grey[700]),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      booking.serviceDescription,
                      style: AppTypography.bodyMedium(context),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Date and Time
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 8),
                Text(
                  dateFormat.format(booking.scheduledDate),
                  style: AppTypography.bodyMedium(context),
                ),
                const SizedBox(width: 16),
                Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 8),
                Text(
                  timeFormat.format(booking.scheduledDate),
                  style: AppTypography.bodyMedium(context),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Duration and Cost
            Row(
              children: [
                Icon(Icons.schedule, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 8),
                Text(
                  '${booking.estimatedDuration} hours',
                  style: AppTypography.bodyMedium(context),
                ),
                const SizedBox(width: 16),
                Icon(Icons.attach_money, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  '\$${booking.totalCost.toStringAsFixed(2)}',
                  style: AppTypography.bodyLarge(context).copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),

            // Rating (for completed bookings)
            if (booking.status == BookingStatus.completed &&
                booking.rating != null) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.amber[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.amber[200]!),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Your Rating: ',
                          style: AppTypography.bodyMedium(
                            context,
                          ).copyWith(fontWeight: FontWeight.bold),
                        ),
                        ...List.generate(5, (index) {
                          return Icon(
                            index < booking.rating!.toInt()
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.amber[700],
                            size: 18,
                          );
                        }),
                      ],
                    ),
                    if (booking.review != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        booking.review!,
                        style: AppTypography.bodySmall(context).copyWith(
                          color: Colors.grey[700],
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],

            // Actions
            if (isUpcoming) ...[
              const SizedBox(height: 16),
              Row(
                children: [
                  if (booking.status == BookingStatus.pending ||
                      booking.status == BookingStatus.confirmed)
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          _showCancelDialog(context, cubit);
                        },
                        icon: const Icon(Icons.cancel_outlined, size: 18),
                        label: const Text('Cancel'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.red,
                          side: const BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        context.push(
                          '/professional-detail/${booking.professionalId}',
                        );
                      },
                      icon: const Icon(Icons.person, size: 18),
                      label: const Text('View Pro'),
                    ),
                  ),
                ],
              ),
            ] else if (booking.status == BookingStatus.completed &&
                booking.rating == null) ...[
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    _showRatingDialog(context, cubit);
                  },
                  icon: const Icon(Icons.star_rate, size: 18),
                  label: const Text('Rate Service'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _showCancelDialog(BuildContext context, BookingsCubit cubit) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(
          'Cancel Booking',
          style: AppTypography.headingMedium(context),
        ),
        content: Text(
          'Are you sure you want to cancel this booking? '
          'This action cannot be undone.',
          style: AppTypography.bodyMedium(context),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('No, Keep It'),
          ),
          ElevatedButton(
            onPressed: () {
              cubit.cancelBooking(booking.id);
              Navigator.of(dialogContext).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Booking cancelled successfully'),
                  backgroundColor: Colors.orange,
                ),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Yes, Cancel'),
          ),
        ],
      ),
    );
  }

  void _showRatingDialog(BuildContext context, BookingsCubit cubit) {
    int selectedRating = 5;
    final reviewController = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            title: Text(
              'Rate Your Experience',
              style: AppTypography.headingMedium(context),
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'How was your experience with ${booking.professionalName}?',
                    style: AppTypography.bodyMedium(context),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return IconButton(
                        onPressed: () {
                          setDialogState(() {
                            selectedRating = index + 1;
                          });
                        },
                        icon: Icon(
                          index < selectedRating
                              ? Icons.star
                              : Icons.star_border,
                          size: 36,
                          color: Colors.amber[700],
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: reviewController,
                    decoration: const InputDecoration(
                      labelText: 'Write a review (optional)',
                      hintText: 'Share your experience...',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  cubit.rateBooking(
                    booking.id,
                    selectedRating,
                    reviewController.text.trim(),
                  );
                  Navigator.of(dialogContext).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Thank you for your rating!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                child: const Text('Submit Rating'),
              ),
            ],
          );
        },
      ),
    );
  }
}
