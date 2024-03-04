// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_message_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getMessageListControllerHash() =>
    r'067d864ff6fd1499b11827d295b33cafddd73bcc';

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

abstract class _$GetMessageListController
    extends BuildlessAutoDisposeStreamNotifier<MessageListDto> {
  late final String chatIdData;

  Stream<MessageListDto> build(
    String chatIdData,
  );
}

/// See also [GetMessageListController].
@ProviderFor(GetMessageListController)
const getMessageListControllerProvider = GetMessageListControllerFamily();

/// See also [GetMessageListController].
class GetMessageListControllerFamily
    extends Family<AsyncValue<MessageListDto>> {
  /// See also [GetMessageListController].
  const GetMessageListControllerFamily();

  /// See also [GetMessageListController].
  GetMessageListControllerProvider call(
    String chatIdData,
  ) {
    return GetMessageListControllerProvider(
      chatIdData,
    );
  }

  @override
  GetMessageListControllerProvider getProviderOverride(
    covariant GetMessageListControllerProvider provider,
  ) {
    return call(
      provider.chatIdData,
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
  String? get name => r'getMessageListControllerProvider';
}

/// See also [GetMessageListController].
class GetMessageListControllerProvider
    extends AutoDisposeStreamNotifierProviderImpl<GetMessageListController,
        MessageListDto> {
  /// See also [GetMessageListController].
  GetMessageListControllerProvider(
    String chatIdData,
  ) : this._internal(
          () => GetMessageListController()..chatIdData = chatIdData,
          from: getMessageListControllerProvider,
          name: r'getMessageListControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMessageListControllerHash,
          dependencies: GetMessageListControllerFamily._dependencies,
          allTransitiveDependencies:
              GetMessageListControllerFamily._allTransitiveDependencies,
          chatIdData: chatIdData,
        );

  GetMessageListControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chatIdData,
  }) : super.internal();

  final String chatIdData;

  @override
  Stream<MessageListDto> runNotifierBuild(
    covariant GetMessageListController notifier,
  ) {
    return notifier.build(
      chatIdData,
    );
  }

  @override
  Override overrideWith(GetMessageListController Function() create) {
    return ProviderOverride(
      origin: this,
      override: GetMessageListControllerProvider._internal(
        () => create()..chatIdData = chatIdData,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chatIdData: chatIdData,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<GetMessageListController,
      MessageListDto> createElement() {
    return _GetMessageListControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMessageListControllerProvider &&
        other.chatIdData == chatIdData;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chatIdData.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetMessageListControllerRef
    on AutoDisposeStreamNotifierProviderRef<MessageListDto> {
  /// The parameter `chatIdData` of this provider.
  String get chatIdData;
}

class _GetMessageListControllerProviderElement
    extends AutoDisposeStreamNotifierProviderElement<GetMessageListController,
        MessageListDto> with GetMessageListControllerRef {
  _GetMessageListControllerProviderElement(super.provider);

  @override
  String get chatIdData =>
      (origin as GetMessageListControllerProvider).chatIdData;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
