// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, duplicate_ignore
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'actor_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ActorModel _$ActorModelFromJson(Map<String, dynamic> json) {
  return _ActorModel.fromJson(json);
}

/// @nodoc
mixin _$ActorModel {
  String get name =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'profile_path')
  String? get profilePath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActorModelCopyWith<ActorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActorModelCopyWith<$Res> {
  factory $ActorModelCopyWith(
          ActorModel value, $Res Function(ActorModel) then) =
      _$ActorModelCopyWithImpl<$Res, ActorModel>;
  @useResult
  $Res call({String name, @JsonKey(name: 'profile_path') String? profilePath});
}

/// @nodoc
class _$ActorModelCopyWithImpl<$Res, $Val extends ActorModel>
    implements $ActorModelCopyWith<$Res> {
  _$ActorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? profilePath = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActorModelImplCopyWith<$Res>
    implements $ActorModelCopyWith<$Res> {
  factory _$$ActorModelImplCopyWith(
          _$ActorModelImpl value, $Res Function(_$ActorModelImpl) then) =
      __$$ActorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, @JsonKey(name: 'profile_path') String? profilePath});
}

/// @nodoc
class __$$ActorModelImplCopyWithImpl<$Res>
    extends _$ActorModelCopyWithImpl<$Res, _$ActorModelImpl>
    implements _$$ActorModelImplCopyWith<$Res> {
  __$$ActorModelImplCopyWithImpl(
      _$ActorModelImpl _value, $Res Function(_$ActorModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? profilePath = freezed,
  }) {
    return _then(_$ActorModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActorModelImpl implements _ActorModel {
  _$ActorModelImpl(
      {required this.name, @JsonKey(name: 'profile_path') this.profilePath});

  factory _$ActorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActorModelImplFromJson(json);

  @override
  final String name;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'profile_path')
  final String? profilePath;

  @override
  String toString() {
    return 'ActorModel(name: $name, profilePath: $profilePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActorModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profilePath, profilePath) ||
                other.profilePath == profilePath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, profilePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActorModelImplCopyWith<_$ActorModelImpl> get copyWith =>
      __$$ActorModelImplCopyWithImpl<_$ActorModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActorModelImplToJson(
      this,
    );
  }
}

abstract class _ActorModel implements ActorModel {
  factory _ActorModel(
          {required final String name,
          @JsonKey(name: 'profile_path') final String? profilePath}) =
      _$ActorModelImpl;

  factory _ActorModel.fromJson(Map<String, dynamic> json) =
      _$ActorModelImpl.fromJson;

  @override
  String get name;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'profile_path')
  String? get profilePath;
  @override
  @JsonKey(ignore: true)
  _$$ActorModelImplCopyWith<_$ActorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
