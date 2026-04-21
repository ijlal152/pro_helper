part of 'search_cubit.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = SearchInitial;

  const factory SearchState.loaded({
    required List<Professional> professionals,
    required List<Professional> filteredProfessionals,
    required ProfessionType? selectedProfession,
    required bool showAvailableOnly,
    required String searchQuery,
  }) = SearchLoaded;
}
