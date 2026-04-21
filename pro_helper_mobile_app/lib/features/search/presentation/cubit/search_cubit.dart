import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/mock_data/mock_professionals.dart';

part 'search_cubit.freezed.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchState.initial());

  void initialize() {
    final professionals = MockProfessionals.getAllProfessionals();
    emit(
      SearchState.loaded(
        professionals: professionals,
        filteredProfessionals: professionals,
        selectedProfession: null,
        showAvailableOnly: false,
        searchQuery: '',
      ),
    );
  }

  void updateSearchQuery(String query) {
    if (state is SearchLoaded) {
      final currentState = state as SearchLoaded;
      emit(
        currentState.copyWith(
          searchQuery: query,
          filteredProfessionals: _applyFilters(
            currentState.professionals,
            currentState.selectedProfession,
            currentState.showAvailableOnly,
            query,
          ),
        ),
      );
    }
  }

  void selectProfession(ProfessionType? profession) {
    if (state is SearchLoaded) {
      final currentState = state as SearchLoaded;
      emit(
        currentState.copyWith(
          selectedProfession: profession,
          filteredProfessionals: _applyFilters(
            currentState.professionals,
            profession,
            currentState.showAvailableOnly,
            currentState.searchQuery,
          ),
        ),
      );
    }
  }

  void toggleAvailableOnly() {
    if (state is SearchLoaded) {
      final currentState = state as SearchLoaded;
      final newValue = !currentState.showAvailableOnly;
      emit(
        currentState.copyWith(
          showAvailableOnly: newValue,
          filteredProfessionals: _applyFilters(
            currentState.professionals,
            currentState.selectedProfession,
            newValue,
            currentState.searchQuery,
          ),
        ),
      );
    }
  }

  void clearFilters() {
    if (state is SearchLoaded) {
      final currentState = state as SearchLoaded;
      emit(
        currentState.copyWith(
          selectedProfession: null,
          showAvailableOnly: false,
          searchQuery: '',
          filteredProfessionals: currentState.professionals,
        ),
      );
    }
  }

  List<Professional> _applyFilters(
    List<Professional> professionals,
    ProfessionType? profession,
    bool showAvailableOnly,
    String searchQuery,
  ) {
    var filtered = List<Professional>.from(professionals);

    // Filter by profession
    if (profession != null) {
      filtered = filtered
          .where((p) => p.user.professionType == profession)
          .toList();
    }

    // Filter by availability
    if (showAvailableOnly) {
      filtered = filtered.where((p) => p.isAvailable).toList();
    }

    // Filter by search query
    if (searchQuery.isNotEmpty) {
      filtered = filtered
          .where(
            (p) =>
                p.user.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
                p.bio.toLowerCase().contains(searchQuery.toLowerCase()),
          )
          .toList();
    }

    // Sort by rating (highest first)
    filtered.sort((a, b) => (b.user.rating ?? 0).compareTo(a.user.rating ?? 0));

    return filtered;
  }
}
