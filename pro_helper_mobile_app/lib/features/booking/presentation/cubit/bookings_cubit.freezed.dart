// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BookingsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
      List<Booking> allBookings,
      List<Booking> upcomingBookings,
      List<Booking> pastBookings,
      int selectedTabIndex,
    )
    loaded,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
      List<Booking> allBookings,
      List<Booking> upcomingBookings,
      List<Booking> pastBookings,
      int selectedTabIndex,
    )?
    loaded,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
      List<Booking> allBookings,
      List<Booking> upcomingBookings,
      List<Booking> pastBookings,
      int selectedTabIndex,
    )?
    loaded,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BookingsInitial value) initial,
    required TResult Function(BookingsLoaded value) loaded,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BookingsInitial value)? initial,
    TResult? Function(BookingsLoaded value)? loaded,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookingsInitial value)? initial,
    TResult Function(BookingsLoaded value)? loaded,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingsStateCopyWith<$Res> {
  factory $BookingsStateCopyWith(
    BookingsState value,
    $Res Function(BookingsState) then,
  ) = _$BookingsStateCopyWithImpl<$Res, BookingsState>;
}

/// @nodoc
class _$BookingsStateCopyWithImpl<$Res, $Val extends BookingsState>
    implements $BookingsStateCopyWith<$Res> {
  _$BookingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookingsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$BookingsInitialImplCopyWith<$Res> {
  factory _$$BookingsInitialImplCopyWith(
    _$BookingsInitialImpl value,
    $Res Function(_$BookingsInitialImpl) then,
  ) = __$$BookingsInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BookingsInitialImplCopyWithImpl<$Res>
    extends _$BookingsStateCopyWithImpl<$Res, _$BookingsInitialImpl>
    implements _$$BookingsInitialImplCopyWith<$Res> {
  __$$BookingsInitialImplCopyWithImpl(
    _$BookingsInitialImpl _value,
    $Res Function(_$BookingsInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookingsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$BookingsInitialImpl implements BookingsInitial {
  const _$BookingsInitialImpl();

  @override
  String toString() {
    return 'BookingsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BookingsInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
      List<Booking> allBookings,
      List<Booking> upcomingBookings,
      List<Booking> pastBookings,
      int selectedTabIndex,
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
      List<Booking> allBookings,
      List<Booking> upcomingBookings,
      List<Booking> pastBookings,
      int selectedTabIndex,
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
      List<Booking> allBookings,
      List<Booking> upcomingBookings,
      List<Booking> pastBookings,
      int selectedTabIndex,
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
    required TResult Function(BookingsInitial value) initial,
    required TResult Function(BookingsLoaded value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BookingsInitial value)? initial,
    TResult? Function(BookingsLoaded value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookingsInitial value)? initial,
    TResult Function(BookingsLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class BookingsInitial implements BookingsState {
  const factory BookingsInitial() = _$BookingsInitialImpl;
}

/// @nodoc
abstract class _$$BookingsLoadedImplCopyWith<$Res> {
  factory _$$BookingsLoadedImplCopyWith(
    _$BookingsLoadedImpl value,
    $Res Function(_$BookingsLoadedImpl) then,
  ) = __$$BookingsLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    List<Booking> allBookings,
    List<Booking> upcomingBookings,
    List<Booking> pastBookings,
    int selectedTabIndex,
  });
}

/// @nodoc
class __$$BookingsLoadedImplCopyWithImpl<$Res>
    extends _$BookingsStateCopyWithImpl<$Res, _$BookingsLoadedImpl>
    implements _$$BookingsLoadedImplCopyWith<$Res> {
  __$$BookingsLoadedImplCopyWithImpl(
    _$BookingsLoadedImpl _value,
    $Res Function(_$BookingsLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allBookings = null,
    Object? upcomingBookings = null,
    Object? pastBookings = null,
    Object? selectedTabIndex = null,
  }) {
    return _then(
      _$BookingsLoadedImpl(
        allBookings: null == allBookings
            ? _value._allBookings
            : allBookings // ignore: cast_nullable_to_non_nullable
                  as List<Booking>,
        upcomingBookings: null == upcomingBookings
            ? _value._upcomingBookings
            : upcomingBookings // ignore: cast_nullable_to_non_nullable
                  as List<Booking>,
        pastBookings: null == pastBookings
            ? _value._pastBookings
            : pastBookings // ignore: cast_nullable_to_non_nullable
                  as List<Booking>,
        selectedTabIndex: null == selectedTabIndex
            ? _value.selectedTabIndex
            : selectedTabIndex // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$BookingsLoadedImpl implements BookingsLoaded {
  const _$BookingsLoadedImpl({
    required final List<Booking> allBookings,
    required final List<Booking> upcomingBookings,
    required final List<Booking> pastBookings,
    required this.selectedTabIndex,
  }) : _allBookings = allBookings,
       _upcomingBookings = upcomingBookings,
       _pastBookings = pastBookings;

  final List<Booking> _allBookings;
  @override
  List<Booking> get allBookings {
    if (_allBookings is EqualUnmodifiableListView) return _allBookings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allBookings);
  }

  final List<Booking> _upcomingBookings;
  @override
  List<Booking> get upcomingBookings {
    if (_upcomingBookings is EqualUnmodifiableListView)
      return _upcomingBookings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_upcomingBookings);
  }

  final List<Booking> _pastBookings;
  @override
  List<Booking> get pastBookings {
    if (_pastBookings is EqualUnmodifiableListView) return _pastBookings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pastBookings);
  }

  @override
  final int selectedTabIndex;

  @override
  String toString() {
    return 'BookingsState.loaded(allBookings: $allBookings, upcomingBookings: $upcomingBookings, pastBookings: $pastBookings, selectedTabIndex: $selectedTabIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingsLoadedImpl &&
            const DeepCollectionEquality().equals(
              other._allBookings,
              _allBookings,
            ) &&
            const DeepCollectionEquality().equals(
              other._upcomingBookings,
              _upcomingBookings,
            ) &&
            const DeepCollectionEquality().equals(
              other._pastBookings,
              _pastBookings,
            ) &&
            (identical(other.selectedTabIndex, selectedTabIndex) ||
                other.selectedTabIndex == selectedTabIndex));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_allBookings),
    const DeepCollectionEquality().hash(_upcomingBookings),
    const DeepCollectionEquality().hash(_pastBookings),
    selectedTabIndex,
  );

  /// Create a copy of BookingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingsLoadedImplCopyWith<_$BookingsLoadedImpl> get copyWith =>
      __$$BookingsLoadedImplCopyWithImpl<_$BookingsLoadedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
      List<Booking> allBookings,
      List<Booking> upcomingBookings,
      List<Booking> pastBookings,
      int selectedTabIndex,
    )
    loaded,
  }) {
    return loaded(
      allBookings,
      upcomingBookings,
      pastBookings,
      selectedTabIndex,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
      List<Booking> allBookings,
      List<Booking> upcomingBookings,
      List<Booking> pastBookings,
      int selectedTabIndex,
    )?
    loaded,
  }) {
    return loaded?.call(
      allBookings,
      upcomingBookings,
      pastBookings,
      selectedTabIndex,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
      List<Booking> allBookings,
      List<Booking> upcomingBookings,
      List<Booking> pastBookings,
      int selectedTabIndex,
    )?
    loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(
        allBookings,
        upcomingBookings,
        pastBookings,
        selectedTabIndex,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BookingsInitial value) initial,
    required TResult Function(BookingsLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BookingsInitial value)? initial,
    TResult? Function(BookingsLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookingsInitial value)? initial,
    TResult Function(BookingsLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class BookingsLoaded implements BookingsState {
  const factory BookingsLoaded({
    required final List<Booking> allBookings,
    required final List<Booking> upcomingBookings,
    required final List<Booking> pastBookings,
    required final int selectedTabIndex,
  }) = _$BookingsLoadedImpl;

  List<Booking> get allBookings;
  List<Booking> get upcomingBookings;
  List<Booking> get pastBookings;
  int get selectedTabIndex;

  /// Create a copy of BookingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingsLoadedImplCopyWith<_$BookingsLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
