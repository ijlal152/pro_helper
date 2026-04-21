part of 'bookings_cubit.dart';

@freezed
class BookingsState with _$BookingsState {
  const factory BookingsState.initial() = BookingsInitial;

  const factory BookingsState.loaded({
    required List<Booking> allBookings,
    required List<Booking> upcomingBookings,
    required List<Booking> pastBookings,
    required int selectedTabIndex,
  }) = BookingsLoaded;
}
