import 'dart:async';

import 'package:build/build.dart';
// import 'package:build_runner_core/src/package_graph/apply_builders.dart';

///
class SeedBuilder extends Builder {
  ///
  SeedBuilder([this.options = BuilderOptions.empty]);

  @override
  FutureOr<void> build(BuildStep buildStep) {
    throw UnimplementedError();
  }

  ///
  @override
  Map<String, List<String>> get buildExtensions => {
        'flakka_build_descriptor.binpb': [],
      };

  ///
  final BuilderOptions options;
}
