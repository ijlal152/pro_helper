import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/mock_data/mock_bookings.dart';

part 'bookings_cubit.freezed.dart';
part 'bookings_state.dart';

class BookingsCubit extends Cubit<BookingsState> {
  BookingsCubit() : super(const BookingsState.initial());

  void initialize() {
    final allBookings = MockBookings.getAllBookings();
    final upcoming = MockBookings.getUpcomingBookings();
    final past = MockBookings.getPastBookings();

    emit(
      BookingsState.loaded(
        allBookings: allBookings,
        upcomingBookings: upcoming,
        pastBookings: past,
        selectedTabIndex: 0,
      ),
    );
  }

  void selectTab(int index) {
    if (state is BookingsLoaded) {
      final currentState = state as BookingsLoaded;
      emit(currentState.copyWith(selectedTabIndex: index));
    }
  }

  void cancelBooking(String bookingId) {
    if (state is BookingsLoaded) {
      final currentState = state as BookingsLoaded;

      // In a real app, this would call a repository method
      // For now, we'll just update the local state
      final updatedBookings = currentState.allBookings.map((booking) {
        if (booking.id == bookingId) {
          return booking.copyWith(status: BookingStatus.cancelled);
        }
        return booking;
      }).toList();

      final upcoming = updatedBookings
          .where(
            (b) =>
                b.scheduledDate.isAfter(DateTime.now()) &&
                b.status != BookingStatus.cancelled &&
                b.status != BookingStatus.completed,
          )
          .toList();

      final past = updatedBookings
          .where(
            (b) =>
                b.scheduledDate.isBefore(DateTime.now()) ||
                b.status == BookingStatus.cancelled ||
                b.status == BookingStatus.completed,
          )
          .toList();

      emit(
        currentState.copyWith(
          allBookings: updatedBookings,
          upcomingBookings: upcoming,
          pastBookings: past,
        ),
      );
    }
  }

  void rateBooking(String bookingId, int rating, String review) {
    if (state is BookingsLoaded) {
      final currentState = state as BookingsLoaded;

      final updatedBookings = currentState.allBookings.map((booking) {
        if (booking.id == bookingId) {
          return booking.copyWith(
            rating: rating.toDouble(),
            review: review.isNotEmpty ? review : null,
          );
        }
        return booking;
      }).toList();

      final upcoming = updatedBookings
          .where(
            (b) =>
                b.scheduledDate.isAfter(DateTime.now()) &&
                b.status != BookingStatus.cancelled &&
                b.status != BookingStatus.completed,
          )
          .toList();

      final past = updatedBookings
          .where(
            (b) =>
                b.scheduledDate.isBefore(DateTime.now()) ||
                b.status == BookingStatus.cancelled ||
                b.status == BookingStatus.completed,
          )
          .toList();

      emit(
        currentState.copyWith(
          allBookings: updatedBookings,
          upcomingBookings: upcoming,
          pastBookings: past,
        ),
      );
    }
  }
}
