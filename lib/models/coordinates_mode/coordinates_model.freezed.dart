// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coordinates_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CoordinatesModel _$CoordinatesModelFromJson(Map<String, dynamic> json) {
  return _CoordinatesModel.fromJson(json);
}

/// @nodoc
mixin _$CoordinatesModel {
  int get x => throw _privateConstructorUsedError;
  int get y => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoordinatesModelCopyWith<CoordinatesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoordinatesModelCopyWith<$Res> {
  factory $CoordinatesModelCopyWith(
          CoordinatesModel value, $Res Function(CoordinatesModel) then) =
      _$CoordinatesModelCopyWithImpl<$Res, CoordinatesModel>;
  @useResult
  $Res call({int x, int y});
}

/// @nodoc
class _$CoordinatesModelCopyWithImpl<$Res, $Val extends CoordinatesModel>
    implements $CoordinatesModelCopyWith<$Res> {
  _$CoordinatesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
  }) {
    return _then(_value.copyWith(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoordinatesModelImplCopyWith<$Res>
    implements $CoordinatesModelCopyWith<$Res> {
  factory _$$CoordinatesModelImplCopyWith(_$CoordinatesModelImpl value,
          $Res Function(_$CoordinatesModelImpl) then) =
      __$$CoordinatesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int x, int y});
}

/// @nodoc
class __$$CoordinatesModelImplCopyWithImpl<$Res>
    extends _$CoordinatesModelCopyWithImpl<$Res, _$CoordinatesModelImpl>
    implements _$$CoordinatesModelImplCopyWith<$Res> {
  __$$CoordinatesModelImplCopyWithImpl(_$CoordinatesModelImpl _value,
      $Res Function(_$CoordinatesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
  }) {
    return _then(_$CoordinatesModelImpl(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoordinatesModelImpl implements _CoordinatesModel {
  const _$CoordinatesModelImpl({required this.x, required this.y});

  factory _$CoordinatesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoordinatesModelImplFromJson(json);

  @override
  final int x;
  @override
  final int y;

  @override
  String toString() {
    return 'CoordinatesModel(x: $x, y: $y)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoordinatesModelImpl &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, x, y);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoordinatesModelImplCopyWith<_$CoordinatesModelImpl> get copyWith =>
      __$$CoordinatesModelImplCopyWithImpl<_$CoordinatesModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoordinatesModelImplToJson(
      this,
    );
  }
}

abstract class _CoordinatesModel implements CoordinatesModel {
  const factory _CoordinatesModel(
      {required final int x, required final int y}) = _$CoordinatesModelImpl;

  factory _CoordinatesModel.fromJson(Map<String, dynamic> json) =
      _$CoordinatesModelImpl.fromJson;

  @override
  int get x;
  @override
  int get y;
  @override
  @JsonKey(ignore: true)
  _$$CoordinatesModelImplCopyWith<_$CoordinatesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
