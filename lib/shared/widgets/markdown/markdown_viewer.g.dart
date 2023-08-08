// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'markdown_viewer.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loadStringAssetHash() => r'f7c26e5e64d52398977fb66c6c60cc789bc62de0';

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

typedef LoadStringAssetRef = AutoDisposeFutureProviderRef<String>;

/// See also [loadStringAsset].
@ProviderFor(loadStringAsset)
const loadStringAssetProvider = LoadStringAssetFamily();

/// See also [loadStringAsset].
class LoadStringAssetFamily extends Family<AsyncValue<String>> {
  /// See also [loadStringAsset].
  const LoadStringAssetFamily();

  /// See also [loadStringAsset].
  LoadStringAssetProvider call(
    String path,
  ) {
    return LoadStringAssetProvider(
      path,
    );
  }

  @override
  LoadStringAssetProvider getProviderOverride(
    covariant LoadStringAssetProvider provider,
  ) {
    return call(
      provider.path,
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
  String? get name => r'loadStringAssetProvider';
}

/// See also [loadStringAsset].
class LoadStringAssetProvider extends AutoDisposeFutureProvider<String> {
  /// See also [loadStringAsset].
  LoadStringAssetProvider(
    this.path,
  ) : super.internal(
          (ref) => loadStringAsset(
            ref,
            path,
          ),
          from: loadStringAssetProvider,
          name: r'loadStringAssetProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loadStringAssetHash,
          dependencies: LoadStringAssetFamily._dependencies,
          allTransitiveDependencies:
              LoadStringAssetFamily._allTransitiveDependencies,
        );

  final String path;

  @override
  bool operator ==(Object other) {
    return other is LoadStringAssetProvider && other.path == path;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, path.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
