import 'dart:async';

import 'package:build/build.dart';
// import 'package:build_runner/build_runner.dart';
// import 'package:build_runner_core/build_runner_core.dart';
// import 'package:build_runner_core/src/package_graph/apply_builders.dart';
import 'package:flakka_protobuf_build_types/buf/alpha/image/v1/image.pb.dart';
import 'package:glob/glob.dart';

///
final imageDescriptorResource =
    Resource<ImageDescriptorResource>(ImageDescriptorResource.new);

///
class ImageDescriptorResource {
  ///
  Future<Image> read(AssetReader reader) async {
    reader.findAssets(Glob('flakka_build_descriptor.binpb'));
    throw UnimplementedError();
  }
}

///
class ImageBuilder extends Builder {
  ///
  ImageBuilder([this.options = BuilderOptions.empty]);

  @override
  FutureOr<void> build(BuildStep buildStep) {
    throw UnimplementedError();
  }

  ///
  @override
  Map<String, List<String>> get buildExtensions => {
        'flakka_build.proto': ['flakka_build_descriptor.binpb'],
      };

  ///
  final BuilderOptions options;
}

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
