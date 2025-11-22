// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'month_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MonthData {

 CellInfoMapper get month; DateTime get selectedPeriod;
/// Create a copy of MonthData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonthDataCopyWith<MonthData> get copyWith => _$MonthDataCopyWithImpl<MonthData>(this as MonthData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthData&&const DeepCollectionEquality().equals(other.month, month)&&(identical(other.selectedPeriod, selectedPeriod) || other.selectedPeriod == selectedPeriod));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(month),selectedPeriod);

@override
String toString() {
  return 'MonthData(month: $month, selectedPeriod: $selectedPeriod)';
}


}

/// @nodoc
abstract mixin class $MonthDataCopyWith<$Res>  {
  factory $MonthDataCopyWith(MonthData value, $Res Function(MonthData) _then) = _$MonthDataCopyWithImpl;
@useResult
$Res call({
 CellInfoMapper month, DateTime selectedPeriod
});




}
/// @nodoc
class _$MonthDataCopyWithImpl<$Res>
    implements $MonthDataCopyWith<$Res> {
  _$MonthDataCopyWithImpl(this._self, this._then);

  final MonthData _self;
  final $Res Function(MonthData) _then;

/// Create a copy of MonthData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? month = null,Object? selectedPeriod = null,}) {
  return _then(_self.copyWith(
month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as CellInfoMapper,selectedPeriod: null == selectedPeriod ? _self.selectedPeriod : selectedPeriod // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [MonthData].
extension MonthDataPatterns on MonthData {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MonthData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MonthData() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MonthData value)  $default,){
final _that = this;
switch (_that) {
case _MonthData():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MonthData value)?  $default,){
final _that = this;
switch (_that) {
case _MonthData() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CellInfoMapper month,  DateTime selectedPeriod)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MonthData() when $default != null:
return $default(_that.month,_that.selectedPeriod);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CellInfoMapper month,  DateTime selectedPeriod)  $default,) {final _that = this;
switch (_that) {
case _MonthData():
return $default(_that.month,_that.selectedPeriod);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CellInfoMapper month,  DateTime selectedPeriod)?  $default,) {final _that = this;
switch (_that) {
case _MonthData() when $default != null:
return $default(_that.month,_that.selectedPeriod);case _:
  return null;

}
}

}

/// @nodoc


class _MonthData implements MonthData {
   _MonthData({final  CellInfoMapper month = const {}, required this.selectedPeriod}): _month = month;
  

 final  CellInfoMapper _month;
@override@JsonKey() CellInfoMapper get month {
  if (_month is EqualUnmodifiableMapView) return _month;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_month);
}

@override final  DateTime selectedPeriod;

/// Create a copy of MonthData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MonthDataCopyWith<_MonthData> get copyWith => __$MonthDataCopyWithImpl<_MonthData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MonthData&&const DeepCollectionEquality().equals(other._month, _month)&&(identical(other.selectedPeriod, selectedPeriod) || other.selectedPeriod == selectedPeriod));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_month),selectedPeriod);

@override
String toString() {
  return 'MonthData(month: $month, selectedPeriod: $selectedPeriod)';
}


}

/// @nodoc
abstract mixin class _$MonthDataCopyWith<$Res> implements $MonthDataCopyWith<$Res> {
  factory _$MonthDataCopyWith(_MonthData value, $Res Function(_MonthData) _then) = __$MonthDataCopyWithImpl;
@override @useResult
$Res call({
 CellInfoMapper month, DateTime selectedPeriod
});




}
/// @nodoc
class __$MonthDataCopyWithImpl<$Res>
    implements _$MonthDataCopyWith<$Res> {
  __$MonthDataCopyWithImpl(this._self, this._then);

  final _MonthData _self;
  final $Res Function(_MonthData) _then;

/// Create a copy of MonthData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? month = null,Object? selectedPeriod = null,}) {
  return _then(_MonthData(
month: null == month ? _self._month : month // ignore: cast_nullable_to_non_nullable
as CellInfoMapper,selectedPeriod: null == selectedPeriod ? _self.selectedPeriod : selectedPeriod // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
