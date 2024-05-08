import 'dart:async';

import 'package:build/build.dart';

import '../../flakka_build.dart';

// class ModuleBuilder extends Builder {
//   ///
//   ImageBuilder([this.options = BuilderOptions.empty]);
//
//   ///
//   FutureOr<void> buildImageFile(BuildModuleStep buildStep);
//
//   ///
//   List<String> get outputExtensions => ['lib/{{module}}/{{module}}_api.dart'];
//
//   @override
//   FutureOr<void> build(BuildStep buildStep) =>
//       buildImageFile(BuildModuleStep(buildStep));
//
//   @override
//   Map<String, List<String>> get buildExtensions =>
//       {'^proto/{{module}}/module.binpb': outputExtensions};
//
//   ///
//   final BuilderOptions options;
// }

///
class ModuleBuilder extends ImageBuilder {
  ///
  ModuleBuilder(super.options) {
    // final aggregateConfigs =
    //     options.config['aggregates'] as Map<String, Map<String, dynamic>>;
    // List.generate(aggregateConfigs.length, (i) =>
    //     BuilderOptions(Map.from(options.config)
    //       ..['aggregate_builder_id'])
    //     aggregateConfigs.map((key, value)
    // {
    //   return MapEntry(key, value);
    //   // final packageSpace = entry.key;
    //   // return entry;
    // });
    // List.generate(aggregateConfigs.length, (i) => i).map((i) =>
    // BuilderOptions(Map.from(options.config)
    // ..up));
    // _aggregateBuilders =
    //     (options.config['aggregates'] as List<Map<String, dynamic>>?)!
    //         .map(BuilderOptions.new)
    //         .map(AggregateBuilder.new)
    //         .toList();
  }

  late final List<AggregateBuilder> _aggregateBuilders;

  @override
  FutureOr<void> buildImageFile(BuildModuleStep buildStep) {
    // buildStep.inputImageFile
    throw UnimplementedError();
  }

  ///
  @override
  List<String> get outputExtensions => ['lib/module/{{module}}_api.dart'];

  @override
  FutureOr<void> build(BuildStep buildStep) =>
      buildImageFile(BuildModuleStep(buildStep));

  @override
  Map<String, List<String>> get buildExtensions =>
      {'^proto/{{module}}/module.binpb': outputExtensions};
}

///
class AggregateBuilder extends ImageBuilder {
  ///
  AggregateBuilder(super.options);

  @override
  FutureOr<void> buildImageFile(BuildModuleStep buildStep) {
    throw UnimplementedError();
  }

  @override
  // TODO: implement outputExtensions
  List<String> get outputExtensions => throw UnimplementedError();
}

///
class EntityBuilder extends ImageBuilder {
  @override
  FutureOr<void> buildImageFile(BuildModuleStep buildStep) {
    throw UnimplementedError();
  }

  @override
  // TODO: implement outputExtensions
  List<String> get outputExtensions => throw UnimplementedError();
}

///
class EventBuilder extends ImageBuilder {
  @override
  FutureOr<void> buildImageFile(BuildModuleStep buildStep) {
    throw UnimplementedError();
  }

  @override
  // TODO: implement outputExtensions
  List<String> get outputExtensions => throw UnimplementedError();
}
