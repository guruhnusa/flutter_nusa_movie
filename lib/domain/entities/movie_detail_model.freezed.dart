// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MovieDetailModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get overview => throw _privateConstructorUsedError;
  String? get posterPath => throw _privateConstructorUsedError;
  String? get backdropPath => throw _privateConstructorUsedError;
  int get runtime => throw _privateConstructorUsedError;
  double get voteAverage => throw _privateConstructorUsedError;
  List<String> get genres => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovieDetailModelCopyWith<MovieDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieDetailModelCopyWith<$Res> {
  factory $MovieDetailModelCopyWith(
          MovieDetailModel value, $Res Function(MovieDetailModel) then) =
      _$MovieDetailModelCopyWithImpl<$Res, MovieDetailModel>;
  @useResult
  $Res call(
      {int id,
      String title,
      String overview,
      String? posterPath,
      String? backdropPath,
      int runtime,
      double voteAverage,
      List<String> genres});
}

/// @nodoc
class _$MovieDetailModelCopyWithImpl<$Res, $Val extends MovieDetailModel>
    implements $MovieDetailModelCopyWith<$Res> {
  _$MovieDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? overview = null,
    Object? posterPath = freezed,
    Object? backdropPath = freezed,
    Object? runtime = null,
    Object? voteAverage = null,
    Object? genres = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      runtime: null == runtime
          ? _value.runtime
          : runtime // ignore: cast_nullable_to_non_nullable
              as int,
      voteAverage: null == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieDetailModelImplCopyWith<$Res>
    implements $MovieDetailModelCopyWith<$Res> {
  factory _$$MovieDetailModelImplCopyWith(_$MovieDetailModelImpl value,
          $Res Function(_$MovieDetailModelImpl) then) =
      __$$MovieDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String overview,
      String? posterPath,
      String? backdropPath,
      int runtime,
      double voteAverage,
      List<String> genres});
}

/// @nodoc
class __$$MovieDetailModelImplCopyWithImpl<$Res>
    extends _$MovieDetailModelCopyWithImpl<$Res, _$MovieDetailModelImpl>
    implements _$$MovieDetailModelImplCopyWith<$Res> {
  __$$MovieDetailModelImplCopyWithImpl(_$MovieDetailModelImpl _value,
      $Res Function(_$MovieDetailModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? overview = null,
    Object? posterPath = freezed,
    Object? backdropPath = freezed,
    Object? runtime = null,
    Object? voteAverage = null,
    Object? genres = null,
  }) {
    return _then(_$MovieDetailModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      runtime: null == runtime
          ? _value.runtime
          : runtime // ignore: cast_nullable_to_non_nullable
              as int,
      voteAverage: null == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
      genres: null == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$MovieDetailModelImpl implements _MovieDetailModel {
  _$MovieDetailModelImpl(
      {required this.id,
      required this.title,
      required this.overview,
      this.posterPath,
      this.backdropPath,
      required this.runtime,
      required this.voteAverage,
      required final List<String> genres})
      : _genres = genres;

  @override
  final int id;
  @override
  final String title;
  @override
  final String overview;
  @override
  final String? posterPath;
  @override
  final String? backdropPath;
  @override
  final int runtime;
  @override
  final double voteAverage;
  final List<String> _genres;
  @override
  List<String> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  @override
  String toString() {
    return 'MovieDetailModel(id: $id, title: $title, overview: $overview, posterPath: $posterPath, backdropPath: $backdropPath, runtime: $runtime, voteAverage: $voteAverage, genres: $genres)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieDetailModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath) &&
            (identical(other.runtime, runtime) || other.runtime == runtime) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            const DeepCollectionEquality().equals(other._genres, _genres));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      overview,
      posterPath,
      backdropPath,
      runtime,
      voteAverage,
      const DeepCollectionEquality().hash(_genres));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieDetailModelImplCopyWith<_$MovieDetailModelImpl> get copyWith =>
      __$$MovieDetailModelImplCopyWithImpl<_$MovieDetailModelImpl>(
          this, _$identity);
}

abstract class _MovieDetailModel implements MovieDetailModel {
  factory _MovieDetailModel(
      {required final int id,
      required final String title,
      required final String overview,
      final String? posterPath,
      final String? backdropPath,
      required final int runtime,
      required final double voteAverage,
      required final List<String> genres}) = _$MovieDetailModelImpl;

  @override
  int get id;
  @override
  String get title;
  @override
  String get overview;
  @override
  String? get posterPath;
  @override
  String? get backdropPath;
  @override
  int get runtime;
  @override
  double get voteAverage;
  @override
  List<String> get genres;
  @override
  @JsonKey(ignore: true)
  _$$MovieDetailModelImplCopyWith<_$MovieDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
