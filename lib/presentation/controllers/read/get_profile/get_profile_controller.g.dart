// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_profile_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getProfileControllerHash() =>
    r'7ec92becae738df8b21e04ff33e317916c715171';

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

abstract class _$GetProfileController
    extends BuildlessAutoDisposeAsyncNotifier<ProfileDto> {
  late final String targetUid;

  FutureOr<ProfileDto> build(
    String targetUid,
  );
}

/// See also [GetProfileController].
@ProviderFor(GetProfileController)
const getProfileControllerProvider = GetProfileControllerFamily();

/// See also [GetProfileController].
class GetProfileControllerFamily extends Family<AsyncValue<ProfileDto>> {
  /// See also [GetProfileController].
  const GetProfileControllerFamily();

  /// See also [GetProfileController].
  GetProfileControllerProvider call(
    String targetUid,
  ) {
    return GetProfileControllerProvider(
      targetUid,
    );
  }

  @override
  GetProfileControllerProvider getProviderOverride(
    covariant GetProfileControllerProvider provider,
  ) {
    return call(
      provider.targetUid,
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
  String? get name => r'getProfileControllerProvider';
}

/// See also [GetProfileController].
class GetProfileControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    GetProfileController, ProfileDto> {
  /// See also [GetProfileController].
  GetProfileControllerProvider(
    String targetUid,
  ) : this._internal(
          () => GetProfileController()..targetUid = targetUid,
          from: getProfileControllerProvider,
          name: r'getProfileControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getProfileControllerHash,
          dependencies: GetProfileControllerFamily._dependencies,
          allTransitiveDependencies:
              GetProfileControllerFamily._allTransitiveDependencies,
          targetUid: targetUid,
        );

  GetProfileControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.targetUid,
  }) : super.internal();

  final String targetUid;

  @override
  FutureOr<ProfileDto> runNotifierBuild(
    covariant GetProfileController notifier,
  ) {
    return notifier.build(
      targetUid,
    );
  }

  @override
  Override overrideWith(GetProfileController Function() create) {
    return ProviderOverride(
      origin: this,
      override: GetProfileControllerProvider._internal(
        () => create()..targetUid = targetUid,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        targetUid: targetUid,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<GetProfileController, ProfileDto>
      createElement() {
    return _GetProfileControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetProfileControllerProvider &&
        other.targetUid == targetUid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, targetUid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetProfileControllerRef
    on AutoDisposeAsyncNotifierProviderRef<ProfileDto> {
  /// The parameter `targetUid` of this provider.
  String get targetUid;
}

class _GetProfileControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<GetProfileController,
        ProfileDto> with GetProfileControllerRef {
  _GetProfileControllerProviderElement(super.provider);

  @override
  String get targetUid => (origin as GetProfileControllerProvider).targetUid;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
