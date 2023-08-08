// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginUIState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get obscureText => throw _privateConstructorUsedError;
  bool get shouldError => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginUIStateCopyWith<LoginUIState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginUIStateCopyWith<$Res> {
  factory $LoginUIStateCopyWith(
          LoginUIState value, $Res Function(LoginUIState) then) =
      _$LoginUIStateCopyWithImpl<$Res, LoginUIState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool obscureText,
      bool shouldError,
      String? errorMessage});
}

/// @nodoc
class _$LoginUIStateCopyWithImpl<$Res, $Val extends LoginUIState>
    implements $LoginUIStateCopyWith<$Res> {
  _$LoginUIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? obscureText = null,
    Object? shouldError = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      obscureText: null == obscureText
          ? _value.obscureText
          : obscureText // ignore: cast_nullable_to_non_nullable
              as bool,
      shouldError: null == shouldError
          ? _value.shouldError
          : shouldError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginUIStateCopyWith<$Res>
    implements $LoginUIStateCopyWith<$Res> {
  factory _$$_LoginUIStateCopyWith(
          _$_LoginUIState value, $Res Function(_$_LoginUIState) then) =
      __$$_LoginUIStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool obscureText,
      bool shouldError,
      String? errorMessage});
}

/// @nodoc
class __$$_LoginUIStateCopyWithImpl<$Res>
    extends _$LoginUIStateCopyWithImpl<$Res, _$_LoginUIState>
    implements _$$_LoginUIStateCopyWith<$Res> {
  __$$_LoginUIStateCopyWithImpl(
      _$_LoginUIState _value, $Res Function(_$_LoginUIState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? obscureText = null,
    Object? shouldError = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_LoginUIState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      obscureText: null == obscureText
          ? _value.obscureText
          : obscureText // ignore: cast_nullable_to_non_nullable
              as bool,
      shouldError: null == shouldError
          ? _value.shouldError
          : shouldError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_LoginUIState implements _LoginUIState {
  const _$_LoginUIState(
      {this.isLoading = false,
      this.obscureText = true,
      this.shouldError = false,
      this.errorMessage});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool obscureText;
  @override
  @JsonKey()
  final bool shouldError;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'LoginUIState(isLoading: $isLoading, obscureText: $obscureText, shouldError: $shouldError, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginUIState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.obscureText, obscureText) ||
                other.obscureText == obscureText) &&
            (identical(other.shouldError, shouldError) ||
                other.shouldError == shouldError) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, obscureText, shouldError, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginUIStateCopyWith<_$_LoginUIState> get copyWith =>
      __$$_LoginUIStateCopyWithImpl<_$_LoginUIState>(this, _$identity);
}

abstract class _LoginUIState implements LoginUIState {
  const factory _LoginUIState(
      {final bool isLoading,
      final bool obscureText,
      final bool shouldError,
      final String? errorMessage}) = _$_LoginUIState;

  @override
  bool get isLoading;
  @override
  bool get obscureText;
  @override
  bool get shouldError;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_LoginUIStateCopyWith<_$_LoginUIState> get copyWith =>
      throw _privateConstructorUsedError;
}
