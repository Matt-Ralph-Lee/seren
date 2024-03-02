// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_memory_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getMemoryDetailControllerHash() =>
    r'81a4e3d4c576795dacbd896c265a60338ab2f3ba';

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

abstract class _$GetMemoryDetailController
    extends BuildlessAutoDisposeAsyncNotifier<MemoryDetailDto> {
  late final String targetMemoryId;

  FutureOr<MemoryDetailDto> build(
    String targetMemoryId,
  );
}

/// See also [GetMemoryDetailController].
@ProviderFor(GetMemoryDetailController)
const getMemoryDetailControllerProvider = GetMemoryDetailControllerFamily();

/// See also [GetMemoryDetailController].
class GetMemoryDetailControllerFamily
    extends Family<AsyncValue<MemoryDetailDto>> {
  /// See also [GetMemoryDetailController].
  const GetMemoryDetailControllerFamily();

  /// See also [GetMemoryDetailController].
  GetMemoryDetailControllerProvider call(
    String targetMemoryId,
  ) {
    return GetMemoryDetailControllerProvider(
      targetMemoryId,
    );
  }

  @override
  GetMemoryDetailControllerProvider getProviderOverride(
    covariant GetMemoryDetailControllerProvider provider,
  ) {
    return call(
      provider.targetMemoryId,
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
  String? get name => r'getMemoryDetailControllerProvider';
}

/// See also [GetMemoryDetailController].
class GetMemoryDetailControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<GetMemoryDetailController,
        MemoryDetailDto> {
  /// See also [GetMemoryDetailController].
  GetMemoryDetailControllerProvider(
    String targetMemoryId,
  ) : this._internal(
          () => GetMemoryDetailController()..targetMemoryId = targetMemoryId,
          from: getMemoryDetailControllerProvider,
          name: r'getMemoryDetailControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMemoryDetailControllerHash,
          dependencies: GetMemoryDetailControllerFamily._dependencies,
          allTransitiveDependencies:
              GetMemoryDetailControllerFamily._allTransitiveDependencies,
          targetMemoryId: targetMemoryId,
        );

  GetMemoryDetailControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.targetMemoryId,
  }) : super.internal();

  final String targetMemoryId;

  @override
  FutureOr<MemoryDetailDto> runNotifierBuild(
    covariant GetMemoryDetailController notifier,
  ) {
    return notifier.build(
      targetMemoryId,
    );
  }

  @override
  Override overrideWith(GetMemoryDetailController Function() create) {
    return ProviderOverride(
      origin: this,
      override: GetMemoryDetailControllerProvider._internal(
        () => create()..targetMemoryId = targetMemoryId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        targetMemoryId: targetMemoryId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<GetMemoryDetailController,
      MemoryDetailDto> createElement() {
    return _GetMemoryDetailControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMemoryDetailControllerProvider &&
        other.targetMemoryId == targetMemoryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, targetMemoryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetMemoryDetailControllerRef
    on AutoDisposeAsyncNotifierProviderRef<MemoryDetailDto> {
  /// The parameter `targetMemoryId` of this provider.
  String get targetMemoryId;
}

class _GetMemoryDetailControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<GetMemoryDetailController,
        MemoryDetailDto> with GetMemoryDetailControllerRef {
  _GetMemoryDetailControllerProviderElement(super.provider);

  @override
  String get targetMemoryId =>
      (origin as GetMemoryDetailControllerProvider).targetMemoryId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
