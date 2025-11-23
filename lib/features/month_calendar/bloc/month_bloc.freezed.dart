// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'month_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MonthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MonthEvent()';
}


}

/// @nodoc
class $MonthEventCopyWith<$Res>  {
$MonthEventCopyWith(MonthEvent _, $Res Function(MonthEvent) __);
}


/// Adds pattern-matching-related methods to [MonthEvent].
extension MonthEventPatterns on MonthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MonthEventGetMonthCalendar value)?  getMonthCalendar,TResult Function( MonthEventGetNextMonthCalendar value)?  gotoNextMonth,TResult Function( MonthEventGetPreviousMonthCalendar value)?  gotoPreviousMonth,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MonthEventGetMonthCalendar() when getMonthCalendar != null:
return getMonthCalendar(_that);case MonthEventGetNextMonthCalendar() when gotoNextMonth != null:
return gotoNextMonth(_that);case MonthEventGetPreviousMonthCalendar() when gotoPreviousMonth != null:
return gotoPreviousMonth(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MonthEventGetMonthCalendar value)  getMonthCalendar,required TResult Function( MonthEventGetNextMonthCalendar value)  gotoNextMonth,required TResult Function( MonthEventGetPreviousMonthCalendar value)  gotoPreviousMonth,}){
final _that = this;
switch (_that) {
case MonthEventGetMonthCalendar():
return getMonthCalendar(_that);case MonthEventGetNextMonthCalendar():
return gotoNextMonth(_that);case MonthEventGetPreviousMonthCalendar():
return gotoPreviousMonth(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MonthEventGetMonthCalendar value)?  getMonthCalendar,TResult? Function( MonthEventGetNextMonthCalendar value)?  gotoNextMonth,TResult? Function( MonthEventGetPreviousMonthCalendar value)?  gotoPreviousMonth,}){
final _that = this;
switch (_that) {
case MonthEventGetMonthCalendar() when getMonthCalendar != null:
return getMonthCalendar(_that);case MonthEventGetNextMonthCalendar() when gotoNextMonth != null:
return gotoNextMonth(_that);case MonthEventGetPreviousMonthCalendar() when gotoPreviousMonth != null:
return gotoPreviousMonth(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getMonthCalendar,TResult Function()?  gotoNextMonth,TResult Function()?  gotoPreviousMonth,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MonthEventGetMonthCalendar() when getMonthCalendar != null:
return getMonthCalendar();case MonthEventGetNextMonthCalendar() when gotoNextMonth != null:
return gotoNextMonth();case MonthEventGetPreviousMonthCalendar() when gotoPreviousMonth != null:
return gotoPreviousMonth();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getMonthCalendar,required TResult Function()  gotoNextMonth,required TResult Function()  gotoPreviousMonth,}) {final _that = this;
switch (_that) {
case MonthEventGetMonthCalendar():
return getMonthCalendar();case MonthEventGetNextMonthCalendar():
return gotoNextMonth();case MonthEventGetPreviousMonthCalendar():
return gotoPreviousMonth();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getMonthCalendar,TResult? Function()?  gotoNextMonth,TResult? Function()?  gotoPreviousMonth,}) {final _that = this;
switch (_that) {
case MonthEventGetMonthCalendar() when getMonthCalendar != null:
return getMonthCalendar();case MonthEventGetNextMonthCalendar() when gotoNextMonth != null:
return gotoNextMonth();case MonthEventGetPreviousMonthCalendar() when gotoPreviousMonth != null:
return gotoPreviousMonth();case _:
  return null;

}
}

}

/// @nodoc


class MonthEventGetMonthCalendar implements MonthEvent {
  const MonthEventGetMonthCalendar();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthEventGetMonthCalendar);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MonthEvent.getMonthCalendar()';
}


}




/// @nodoc


class MonthEventGetNextMonthCalendar implements MonthEvent {
  const MonthEventGetNextMonthCalendar();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthEventGetNextMonthCalendar);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MonthEvent.gotoNextMonth()';
}


}




/// @nodoc


class MonthEventGetPreviousMonthCalendar implements MonthEvent {
  const MonthEventGetPreviousMonthCalendar();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthEventGetPreviousMonthCalendar);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MonthEvent.gotoPreviousMonth()';
}


}




/// @nodoc
mixin _$MonthState {

 MonthData get data; bool get isListenerState;
/// Create a copy of MonthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonthStateCopyWith<MonthState> get copyWith => _$MonthStateCopyWithImpl<MonthState>(this as MonthState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthState&&(identical(other.data, data) || other.data == data)&&(identical(other.isListenerState, isListenerState) || other.isListenerState == isListenerState));
}


@override
int get hashCode => Object.hash(runtimeType,data,isListenerState);

@override
String toString() {
  return 'MonthState(data: $data, isListenerState: $isListenerState)';
}


}

/// @nodoc
abstract mixin class $MonthStateCopyWith<$Res>  {
  factory $MonthStateCopyWith(MonthState value, $Res Function(MonthState) _then) = _$MonthStateCopyWithImpl;
@useResult
$Res call({
 MonthData data, bool isListenerState
});


$MonthDataCopyWith<$Res> get data;

}
/// @nodoc
class _$MonthStateCopyWithImpl<$Res>
    implements $MonthStateCopyWith<$Res> {
  _$MonthStateCopyWithImpl(this._self, this._then);

  final MonthState _self;
  final $Res Function(MonthState) _then;

/// Create a copy of MonthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? isListenerState = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MonthData,isListenerState: null == isListenerState ? _self.isListenerState : isListenerState // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of MonthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MonthDataCopyWith<$Res> get data {
  
  return $MonthDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [MonthState].
extension MonthStatePatterns on MonthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MonthStateInitial value)?  initial,TResult Function( MonthStateLoading value)?  loading,TResult Function( MonthStateLoadFailure value)?  loadFailure,TResult Function( MonthStateLoadSuccess value)?  loadSuccess,TResult Function( MonthStateDisplayAlert value)?  displayAlert,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MonthStateInitial() when initial != null:
return initial(_that);case MonthStateLoading() when loading != null:
return loading(_that);case MonthStateLoadFailure() when loadFailure != null:
return loadFailure(_that);case MonthStateLoadSuccess() when loadSuccess != null:
return loadSuccess(_that);case MonthStateDisplayAlert() when displayAlert != null:
return displayAlert(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MonthStateInitial value)  initial,required TResult Function( MonthStateLoading value)  loading,required TResult Function( MonthStateLoadFailure value)  loadFailure,required TResult Function( MonthStateLoadSuccess value)  loadSuccess,required TResult Function( MonthStateDisplayAlert value)  displayAlert,}){
final _that = this;
switch (_that) {
case MonthStateInitial():
return initial(_that);case MonthStateLoading():
return loading(_that);case MonthStateLoadFailure():
return loadFailure(_that);case MonthStateLoadSuccess():
return loadSuccess(_that);case MonthStateDisplayAlert():
return displayAlert(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MonthStateInitial value)?  initial,TResult? Function( MonthStateLoading value)?  loading,TResult? Function( MonthStateLoadFailure value)?  loadFailure,TResult? Function( MonthStateLoadSuccess value)?  loadSuccess,TResult? Function( MonthStateDisplayAlert value)?  displayAlert,}){
final _that = this;
switch (_that) {
case MonthStateInitial() when initial != null:
return initial(_that);case MonthStateLoading() when loading != null:
return loading(_that);case MonthStateLoadFailure() when loadFailure != null:
return loadFailure(_that);case MonthStateLoadSuccess() when loadSuccess != null:
return loadSuccess(_that);case MonthStateDisplayAlert() when displayAlert != null:
return displayAlert(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( MonthData data,  bool isListenerState)?  initial,TResult Function( MonthData data,  bool isListenerState)?  loading,TResult Function( Failure failure,  MonthEvent retryEvent,  MonthData data,  bool isListenerState)?  loadFailure,TResult Function( MonthData data,  bool isListenerState)?  loadSuccess,TResult Function( String title,  String message,  MonthData data,  bool shouldPopOut,  bool isListenerState)?  displayAlert,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MonthStateInitial() when initial != null:
return initial(_that.data,_that.isListenerState);case MonthStateLoading() when loading != null:
return loading(_that.data,_that.isListenerState);case MonthStateLoadFailure() when loadFailure != null:
return loadFailure(_that.failure,_that.retryEvent,_that.data,_that.isListenerState);case MonthStateLoadSuccess() when loadSuccess != null:
return loadSuccess(_that.data,_that.isListenerState);case MonthStateDisplayAlert() when displayAlert != null:
return displayAlert(_that.title,_that.message,_that.data,_that.shouldPopOut,_that.isListenerState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( MonthData data,  bool isListenerState)  initial,required TResult Function( MonthData data,  bool isListenerState)  loading,required TResult Function( Failure failure,  MonthEvent retryEvent,  MonthData data,  bool isListenerState)  loadFailure,required TResult Function( MonthData data,  bool isListenerState)  loadSuccess,required TResult Function( String title,  String message,  MonthData data,  bool shouldPopOut,  bool isListenerState)  displayAlert,}) {final _that = this;
switch (_that) {
case MonthStateInitial():
return initial(_that.data,_that.isListenerState);case MonthStateLoading():
return loading(_that.data,_that.isListenerState);case MonthStateLoadFailure():
return loadFailure(_that.failure,_that.retryEvent,_that.data,_that.isListenerState);case MonthStateLoadSuccess():
return loadSuccess(_that.data,_that.isListenerState);case MonthStateDisplayAlert():
return displayAlert(_that.title,_that.message,_that.data,_that.shouldPopOut,_that.isListenerState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( MonthData data,  bool isListenerState)?  initial,TResult? Function( MonthData data,  bool isListenerState)?  loading,TResult? Function( Failure failure,  MonthEvent retryEvent,  MonthData data,  bool isListenerState)?  loadFailure,TResult? Function( MonthData data,  bool isListenerState)?  loadSuccess,TResult? Function( String title,  String message,  MonthData data,  bool shouldPopOut,  bool isListenerState)?  displayAlert,}) {final _that = this;
switch (_that) {
case MonthStateInitial() when initial != null:
return initial(_that.data,_that.isListenerState);case MonthStateLoading() when loading != null:
return loading(_that.data,_that.isListenerState);case MonthStateLoadFailure() when loadFailure != null:
return loadFailure(_that.failure,_that.retryEvent,_that.data,_that.isListenerState);case MonthStateLoadSuccess() when loadSuccess != null:
return loadSuccess(_that.data,_that.isListenerState);case MonthStateDisplayAlert() when displayAlert != null:
return displayAlert(_that.title,_that.message,_that.data,_that.shouldPopOut,_that.isListenerState);case _:
  return null;

}
}

}

/// @nodoc


class MonthStateInitial implements MonthState {
  const MonthStateInitial({required this.data, this.isListenerState = false});
  

@override final  MonthData data;
@override@JsonKey() final  bool isListenerState;

/// Create a copy of MonthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonthStateInitialCopyWith<MonthStateInitial> get copyWith => _$MonthStateInitialCopyWithImpl<MonthStateInitial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthStateInitial&&(identical(other.data, data) || other.data == data)&&(identical(other.isListenerState, isListenerState) || other.isListenerState == isListenerState));
}


@override
int get hashCode => Object.hash(runtimeType,data,isListenerState);

@override
String toString() {
  return 'MonthState.initial(data: $data, isListenerState: $isListenerState)';
}


}

/// @nodoc
abstract mixin class $MonthStateInitialCopyWith<$Res> implements $MonthStateCopyWith<$Res> {
  factory $MonthStateInitialCopyWith(MonthStateInitial value, $Res Function(MonthStateInitial) _then) = _$MonthStateInitialCopyWithImpl;
@override @useResult
$Res call({
 MonthData data, bool isListenerState
});


@override $MonthDataCopyWith<$Res> get data;

}
/// @nodoc
class _$MonthStateInitialCopyWithImpl<$Res>
    implements $MonthStateInitialCopyWith<$Res> {
  _$MonthStateInitialCopyWithImpl(this._self, this._then);

  final MonthStateInitial _self;
  final $Res Function(MonthStateInitial) _then;

/// Create a copy of MonthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? isListenerState = null,}) {
  return _then(MonthStateInitial(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MonthData,isListenerState: null == isListenerState ? _self.isListenerState : isListenerState // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of MonthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MonthDataCopyWith<$Res> get data {
  
  return $MonthDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

/// @nodoc


class MonthStateLoading implements MonthState {
  const MonthStateLoading({required this.data, this.isListenerState = false});
  

@override final  MonthData data;
@override@JsonKey() final  bool isListenerState;

/// Create a copy of MonthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonthStateLoadingCopyWith<MonthStateLoading> get copyWith => _$MonthStateLoadingCopyWithImpl<MonthStateLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthStateLoading&&(identical(other.data, data) || other.data == data)&&(identical(other.isListenerState, isListenerState) || other.isListenerState == isListenerState));
}


@override
int get hashCode => Object.hash(runtimeType,data,isListenerState);

@override
String toString() {
  return 'MonthState.loading(data: $data, isListenerState: $isListenerState)';
}


}

/// @nodoc
abstract mixin class $MonthStateLoadingCopyWith<$Res> implements $MonthStateCopyWith<$Res> {
  factory $MonthStateLoadingCopyWith(MonthStateLoading value, $Res Function(MonthStateLoading) _then) = _$MonthStateLoadingCopyWithImpl;
@override @useResult
$Res call({
 MonthData data, bool isListenerState
});


@override $MonthDataCopyWith<$Res> get data;

}
/// @nodoc
class _$MonthStateLoadingCopyWithImpl<$Res>
    implements $MonthStateLoadingCopyWith<$Res> {
  _$MonthStateLoadingCopyWithImpl(this._self, this._then);

  final MonthStateLoading _self;
  final $Res Function(MonthStateLoading) _then;

/// Create a copy of MonthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? isListenerState = null,}) {
  return _then(MonthStateLoading(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MonthData,isListenerState: null == isListenerState ? _self.isListenerState : isListenerState // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of MonthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MonthDataCopyWith<$Res> get data {
  
  return $MonthDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

/// @nodoc


class MonthStateLoadFailure implements MonthState {
  const MonthStateLoadFailure({required this.failure, required this.retryEvent, required this.data, this.isListenerState = false});
  

 final  Failure failure;
 final  MonthEvent retryEvent;
@override final  MonthData data;
@override@JsonKey() final  bool isListenerState;

/// Create a copy of MonthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonthStateLoadFailureCopyWith<MonthStateLoadFailure> get copyWith => _$MonthStateLoadFailureCopyWithImpl<MonthStateLoadFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthStateLoadFailure&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.retryEvent, retryEvent) || other.retryEvent == retryEvent)&&(identical(other.data, data) || other.data == data)&&(identical(other.isListenerState, isListenerState) || other.isListenerState == isListenerState));
}


@override
int get hashCode => Object.hash(runtimeType,failure,retryEvent,data,isListenerState);

@override
String toString() {
  return 'MonthState.loadFailure(failure: $failure, retryEvent: $retryEvent, data: $data, isListenerState: $isListenerState)';
}


}

/// @nodoc
abstract mixin class $MonthStateLoadFailureCopyWith<$Res> implements $MonthStateCopyWith<$Res> {
  factory $MonthStateLoadFailureCopyWith(MonthStateLoadFailure value, $Res Function(MonthStateLoadFailure) _then) = _$MonthStateLoadFailureCopyWithImpl;
@override @useResult
$Res call({
 Failure failure, MonthEvent retryEvent, MonthData data, bool isListenerState
});


$MonthEventCopyWith<$Res> get retryEvent;@override $MonthDataCopyWith<$Res> get data;

}
/// @nodoc
class _$MonthStateLoadFailureCopyWithImpl<$Res>
    implements $MonthStateLoadFailureCopyWith<$Res> {
  _$MonthStateLoadFailureCopyWithImpl(this._self, this._then);

  final MonthStateLoadFailure _self;
  final $Res Function(MonthStateLoadFailure) _then;

/// Create a copy of MonthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? failure = null,Object? retryEvent = null,Object? data = null,Object? isListenerState = null,}) {
  return _then(MonthStateLoadFailure(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,retryEvent: null == retryEvent ? _self.retryEvent : retryEvent // ignore: cast_nullable_to_non_nullable
as MonthEvent,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MonthData,isListenerState: null == isListenerState ? _self.isListenerState : isListenerState // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of MonthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MonthEventCopyWith<$Res> get retryEvent {
  
  return $MonthEventCopyWith<$Res>(_self.retryEvent, (value) {
    return _then(_self.copyWith(retryEvent: value));
  });
}/// Create a copy of MonthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MonthDataCopyWith<$Res> get data {
  
  return $MonthDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

/// @nodoc


class MonthStateLoadSuccess implements MonthState {
  const MonthStateLoadSuccess({required this.data, this.isListenerState = false});
  

@override final  MonthData data;
@override@JsonKey() final  bool isListenerState;

/// Create a copy of MonthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonthStateLoadSuccessCopyWith<MonthStateLoadSuccess> get copyWith => _$MonthStateLoadSuccessCopyWithImpl<MonthStateLoadSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthStateLoadSuccess&&(identical(other.data, data) || other.data == data)&&(identical(other.isListenerState, isListenerState) || other.isListenerState == isListenerState));
}


@override
int get hashCode => Object.hash(runtimeType,data,isListenerState);

@override
String toString() {
  return 'MonthState.loadSuccess(data: $data, isListenerState: $isListenerState)';
}


}

/// @nodoc
abstract mixin class $MonthStateLoadSuccessCopyWith<$Res> implements $MonthStateCopyWith<$Res> {
  factory $MonthStateLoadSuccessCopyWith(MonthStateLoadSuccess value, $Res Function(MonthStateLoadSuccess) _then) = _$MonthStateLoadSuccessCopyWithImpl;
@override @useResult
$Res call({
 MonthData data, bool isListenerState
});


@override $MonthDataCopyWith<$Res> get data;

}
/// @nodoc
class _$MonthStateLoadSuccessCopyWithImpl<$Res>
    implements $MonthStateLoadSuccessCopyWith<$Res> {
  _$MonthStateLoadSuccessCopyWithImpl(this._self, this._then);

  final MonthStateLoadSuccess _self;
  final $Res Function(MonthStateLoadSuccess) _then;

/// Create a copy of MonthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? isListenerState = null,}) {
  return _then(MonthStateLoadSuccess(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MonthData,isListenerState: null == isListenerState ? _self.isListenerState : isListenerState // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of MonthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MonthDataCopyWith<$Res> get data {
  
  return $MonthDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

/// @nodoc


class MonthStateDisplayAlert implements MonthState {
  const MonthStateDisplayAlert({required this.title, required this.message, required this.data, this.shouldPopOut = false, this.isListenerState = true});
  

 final  String title;
 final  String message;
@override final  MonthData data;
@JsonKey() final  bool shouldPopOut;
@override@JsonKey() final  bool isListenerState;

/// Create a copy of MonthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonthStateDisplayAlertCopyWith<MonthStateDisplayAlert> get copyWith => _$MonthStateDisplayAlertCopyWithImpl<MonthStateDisplayAlert>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthStateDisplayAlert&&(identical(other.title, title) || other.title == title)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&(identical(other.shouldPopOut, shouldPopOut) || other.shouldPopOut == shouldPopOut)&&(identical(other.isListenerState, isListenerState) || other.isListenerState == isListenerState));
}


@override
int get hashCode => Object.hash(runtimeType,title,message,data,shouldPopOut,isListenerState);

@override
String toString() {
  return 'MonthState.displayAlert(title: $title, message: $message, data: $data, shouldPopOut: $shouldPopOut, isListenerState: $isListenerState)';
}


}

/// @nodoc
abstract mixin class $MonthStateDisplayAlertCopyWith<$Res> implements $MonthStateCopyWith<$Res> {
  factory $MonthStateDisplayAlertCopyWith(MonthStateDisplayAlert value, $Res Function(MonthStateDisplayAlert) _then) = _$MonthStateDisplayAlertCopyWithImpl;
@override @useResult
$Res call({
 String title, String message, MonthData data, bool shouldPopOut, bool isListenerState
});


@override $MonthDataCopyWith<$Res> get data;

}
/// @nodoc
class _$MonthStateDisplayAlertCopyWithImpl<$Res>
    implements $MonthStateDisplayAlertCopyWith<$Res> {
  _$MonthStateDisplayAlertCopyWithImpl(this._self, this._then);

  final MonthStateDisplayAlert _self;
  final $Res Function(MonthStateDisplayAlert) _then;

/// Create a copy of MonthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? message = null,Object? data = null,Object? shouldPopOut = null,Object? isListenerState = null,}) {
  return _then(MonthStateDisplayAlert(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MonthData,shouldPopOut: null == shouldPopOut ? _self.shouldPopOut : shouldPopOut // ignore: cast_nullable_to_non_nullable
as bool,isListenerState: null == isListenerState ? _self.isListenerState : isListenerState // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of MonthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MonthDataCopyWith<$Res> get data {
  
  return $MonthDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
