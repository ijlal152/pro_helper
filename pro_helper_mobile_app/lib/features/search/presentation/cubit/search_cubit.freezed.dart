// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SearchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
      List<Professional> professionals,
      List<Professional> filteredProfessionals,
      ProfessionType? selectedProfession,
      bool showAvailableOnly,
      String searchQuery,
    )
    loaded,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
      List<Professional> professionals,
      List<Professional> filteredProfessionals,
      ProfessionType? selectedProfession,
      bool showAvailableOnly,
      String searchQuery,
    )?
    loaded,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
      List<Professional> professionals,
      List<Professional> filteredProfessionals,
      ProfessionType? selectedProfession,
      bool showAvailableOnly,
      String searchQuery,
    )?
    loaded,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchInitial value) initial,
    required TResult Function(SearchLoaded value) loaded,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchInitial value)? initial,
    TResult? Function(SearchLoaded value)? loaded,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchInitial value)? initial,
    TResult Function(SearchLoaded value)? loaded,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
    SearchState value,
    $Res Function(SearchState) then,
  ) = _$SearchStateCopyWithImpl<$Res, SearchState>;
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SearchInitialImplCopyWith<$Res> {
  factory _$$SearchInitialImplCopyWith(
    _$SearchInitialImpl value,
    $Res Function(_$SearchInitialImpl) then,
  ) = __$$SearchInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchInitialImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchInitialImpl>
    implements _$$SearchInitialImplCopyWith<$Res> {
  __$$SearchInitialImplCopyWithImpl(
    _$SearchInitialImpl _value,
    $Res Function(_$SearchInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SearchInitialImpl implements SearchInitial {
  const _$SearchInitialImpl();

  @override
  String toString() {
    return 'SearchState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SearchInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
      List<Professional> professionals,
      List<Professional> filteredProfessionals,
      ProfessionType? selectedProfession,
      bool showAvailableOnly,
      String searchQuery,
    )
    loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
      List<Professional> professionals,
      List<Professional> filteredProfessionals,
      ProfessionType? selectedProfession,
      bool showAvailableOnly,
      String searchQuery,
    )?
    loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
      List<Professional> professionals,
      List<Professional> filteredProfessionals,
      ProfessionType? selectedProfession,
      bool showAvailableOnly,
      String searchQuery,
    )?
    loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchInitial value) initial,
    required TResult Function(SearchLoaded value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchInitial value)? initial,
    TResult? Function(SearchLoaded value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchInitial value)? initial,
    TResult Function(SearchLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class SearchInitial implements SearchState {
  const factory SearchInitial() = _$SearchInitialImpl;
}

/// @nodoc
abstract class _$$SearchLoadedImplCopyWith<$Res> {
  factory _$$SearchLoadedImplCopyWith(
    _$SearchLoadedImpl value,
    $Res Function(_$SearchLoadedImpl) then,
  ) = __$$SearchLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    List<Professional> professionals,
    List<Professional> filteredProfessionals,
    ProfessionType? selectedProfession,
    bool showAvailableOnly,
    String searchQuery,
  });
}

/// @nodoc
class __$$SearchLoadedImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchLoadedImpl>
    implements _$$SearchLoadedImplCopyWith<$Res> {
  __$$SearchLoadedImplCopyWithImpl(
    _$SearchLoadedImpl _value,
    $Res Function(_$SearchLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? professionals = null,
    Object? filteredProfessionals = null,
    Object? selectedProfession = freezed,
    Object? showAvailableOnly = null,
    Object? searchQuery = null,
  }) {
    return _then(
      _$SearchLoadedImpl(
        professionals: null == professionals
            ? _value._professionals
            : professionals // ignore: cast_nullable_to_non_nullable
                  as List<Professional>,
        filteredProfessionals: null == filteredProfessionals
            ? _value._filteredProfessionals
            : filteredProfessionals // ignore: cast_nullable_to_non_nullable
                  as List<Professional>,
        selectedProfession: freezed == selectedProfession
            ? _value.selectedProfession
            : selectedProfession // ignore: cast_nullable_to_non_nullable
                  as ProfessionType?,
        showAvailableOnly: null == showAvailableOnly
            ? _value.showAvailableOnly
            : showAvailableOnly // ignore: cast_nullable_to_non_nullable
                  as bool,
        searchQuery: null == searchQuery
            ? _value.searchQuery
            : searchQuery // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SearchLoadedImpl implements SearchLoaded {
  const _$SearchLoadedImpl({
    required final List<Professional> professionals,
    required final List<Professional> filteredProfessionals,
    required this.selectedProfession,
    required this.showAvailableOnly,
    required this.searchQuery,
  }) : _professionals = professionals,
       _filteredProfessionals = filteredProfessionals;

  final List<Professional> _professionals;
  @override
  List<Professional> get professionals {
    if (_professionals is EqualUnmodifiableListView) return _professionals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_professionals);
  }

  final List<Professional> _filteredProfessionals;
  @override
  List<Professional> get filteredProfessionals {
    if (_filteredProfessionals is EqualUnmodifiableListView)
      return _filteredProfessionals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredProfessionals);
  }

  @override
  final ProfessionType? selectedProfession;
  @override
  final bool showAvailableOnly;
  @override
  final String searchQuery;

  @override
  String toString() {
    return 'SearchState.loaded(professionals: $professionals, filteredProfessionals: $filteredProfessionals, selectedProfession: $selectedProfession, showAvailableOnly: $showAvailableOnly, searchQuery: $searchQuery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchLoadedImpl &&
            const DeepCollectionEquality().equals(
              other._professionals,
              _professionals,
            ) &&
            const DeepCollectionEquality().equals(
              other._filteredProfessionals,
              _filteredProfessionals,
            ) &&
            (identical(other.selectedProfession, selectedProfession) ||
                other.selectedProfession == selectedProfession) &&
            (identical(other.showAvailableOnly, showAvailableOnly) ||
                other.showAvailableOnly == showAvailableOnly) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_professionals),
    const DeepCollectionEquality().hash(_filteredProfessionals),
    selectedProfession,
    showAvailableOnly,
    searchQuery,
  );

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchLoadedImplCopyWith<_$SearchLoadedImpl> get copyWith =>
      __$$SearchLoadedImplCopyWithImpl<_$SearchLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
      List<Professional> professionals,
      List<Professional> filteredProfessionals,
      ProfessionType? selectedProfession,
      bool showAvailableOnly,
      String searchQuery,
    )
    loaded,
  }) {
    return loaded(
      professionals,
      filteredProfessionals,
      selectedProfession,
      showAvailableOnly,
      searchQuery,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
      List<Professional> professionals,
      List<Professional> filteredProfessionals,
      ProfessionType? selectedProfession,
      bool showAvailableOnly,
      String searchQuery,
    )?
    loaded,
  }) {
    return loaded?.call(
      professionals,
      filteredProfessionals,
      selectedProfession,
      showAvailableOnly,
      searchQuery,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
      List<Professional> professionals,
      List<Professional> filteredProfessionals,
      ProfessionType? selectedProfession,
      bool showAvailableOnly,
      String searchQuery,
    )?
    loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(
        professionals,
        filteredProfessionals,
        selectedProfession,
        showAvailableOnly,
        searchQuery,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchInitial value) initial,
    required TResult Function(SearchLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchInitial value)? initial,
    TResult? Function(SearchLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchInitial value)? initial,
    TResult Function(SearchLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class SearchLoaded implements SearchState {
  const factory SearchLoaded({
    required final List<Professional> professionals,
    required final List<Professional> filteredProfessionals,
    required final ProfessionType? selectedProfession,
    required final bool showAvailableOnly,
    required final String searchQuery,
  }) = _$SearchLoadedImpl;

  List<Professional> get professionals;
  List<Professional> get filteredProfessionals;
  ProfessionType? get selectedProfession;
  bool get showAvailableOnly;
  String get searchQuery;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchLoadedImplCopyWith<_$SearchLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
