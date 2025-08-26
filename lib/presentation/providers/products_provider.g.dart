// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getProductsRecomendedHash() =>
    r'611ed2842ac905b5a54c2199d687ea41a8804005';

/// See also [getProductsRecomended].
@ProviderFor(getProductsRecomended)
final getProductsRecomendedProvider =
    AutoDisposeFutureProvider<List<Product>>.internal(
      getProductsRecomended,
      name: r'getProductsRecomendedProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$getProductsRecomendedHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetProductsRecomendedRef = AutoDisposeFutureProviderRef<List<Product>>;
String _$getProductByIdHash() => r'7562daa0f885661dd84b53f2b73d4208b7a5257f';

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

/// See also [getProductById].
@ProviderFor(getProductById)
const getProductByIdProvider = GetProductByIdFamily();

/// See also [getProductById].
class GetProductByIdFamily extends Family<AsyncValue<Product>> {
  /// See also [getProductById].
  const GetProductByIdFamily();

  /// See also [getProductById].
  GetProductByIdProvider call(int id) {
    return GetProductByIdProvider(id);
  }

  @override
  GetProductByIdProvider getProviderOverride(
    covariant GetProductByIdProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getProductByIdProvider';
}

/// See also [getProductById].
class GetProductByIdProvider extends AutoDisposeFutureProvider<Product> {
  /// See also [getProductById].
  GetProductByIdProvider(int id)
    : this._internal(
        (ref) => getProductById(ref as GetProductByIdRef, id),
        from: getProductByIdProvider,
        name: r'getProductByIdProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$getProductByIdHash,
        dependencies: GetProductByIdFamily._dependencies,
        allTransitiveDependencies:
            GetProductByIdFamily._allTransitiveDependencies,
        id: id,
      );

  GetProductByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Product> Function(GetProductByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetProductByIdProvider._internal(
        (ref) => create(ref as GetProductByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Product> createElement() {
    return _GetProductByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetProductByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetProductByIdRef on AutoDisposeFutureProviderRef<Product> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GetProductByIdProviderElement
    extends AutoDisposeFutureProviderElement<Product>
    with GetProductByIdRef {
  _GetProductByIdProviderElement(super.provider);

  @override
  int get id => (origin as GetProductByIdProvider).id;
}

String _$categoryProductsHash() => r'2d8381801d4974c6ce5e7d0379e715dc2e34a32b';

/// See also [CategoryProducts].
@ProviderFor(CategoryProducts)
final categoryProductsProvider =
    AutoDisposeAsyncNotifierProvider<CategoryProducts, List<Product>>.internal(
      CategoryProducts.new,
      name: r'categoryProductsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$categoryProductsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CategoryProducts = AutoDisposeAsyncNotifier<List<Product>>;
String _$cartHash() => r'59b3e78f786422f57149849ae5be85f640fe9b1f';

/// See also [Cart].
@ProviderFor(Cart)
final cartProvider = NotifierProvider<Cart, List<Product>>.internal(
  Cart.new,
  name: r'cartProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cartHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Cart = Notifier<List<Product>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
