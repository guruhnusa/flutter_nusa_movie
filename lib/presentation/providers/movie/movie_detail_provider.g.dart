// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$movieDetailHash() => r'7482605a6de0cea7a4232f910080337201598c7a';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [movieDetail].
@ProviderFor(movieDetail)
const movieDetailProvider = MovieDetailFamily();

/// See also [movieDetail].
class MovieDetailFamily extends Family<AsyncValue<MovieDetailModel?>> {
  /// See also [movieDetail].
  const MovieDetailFamily();

  /// See also [movieDetail].
  MovieDetailProvider call({
    required MovieModel movieModel,
  }) {
    return MovieDetailProvider(
      movieModel: movieModel,
    );
  }

  @override
  MovieDetailProvider getProviderOverride(
    covariant MovieDetailProvider provider,
  ) {
    return call(
      movieModel: provider.movieModel,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'movieDetailProvider';
}

/// See also [movieDetail].
class MovieDetailProvider extends AutoDisposeFutureProvider<MovieDetailModel?> {
  /// See also [movieDetail].
  MovieDetailProvider({
    required MovieModel movieModel,
  }) : this._internal(
          (ref) => movieDetail(
            ref as MovieDetailRef,
            movieModel: movieModel,
          ),
          from: movieDetailProvider,
          name: r'movieDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$movieDetailHash,
          dependencies: MovieDetailFamily._dependencies,
          allTransitiveDependencies:
              MovieDetailFamily._allTransitiveDependencies,
          movieModel: movieModel,
        );

  MovieDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.movieModel,
  }) : super.internal();

  final MovieModel movieModel;

  @override
  Override overrideWith(
    FutureOr<MovieDetailModel?> Function(MovieDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MovieDetailProvider._internal(
        (ref) => create(ref as MovieDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        movieModel: movieModel,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<MovieDetailModel?> createElement() {
    return _MovieDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MovieDetailProvider && other.movieModel == movieModel;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieModel.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MovieDetailRef on AutoDisposeFutureProviderRef<MovieDetailModel?> {
  /// The parameter `movieModel` of this provider.
  MovieModel get movieModel;
}

class _MovieDetailProviderElement
    extends AutoDisposeFutureProviderElement<MovieDetailModel?>
    with MovieDetailRef {
  _MovieDetailProviderElement(super.provider);

  @override
  MovieModel get movieModel => (origin as MovieDetailProvider).movieModel;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
