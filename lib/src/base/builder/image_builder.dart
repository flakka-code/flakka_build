import 'dart:async';
import 'package:build/build.dart';
import 'package:flakka_buf_runner/flakka_buf_runner.dart';
import 'package:flakka_build/flakka_build.dart';
import 'package:glob/glob.dart';
import 'package:path/path.dart' as p;

///
class ImageBuilder extends Builder {
  ///
  ImageBuilder([this.options = BuilderOptions.empty]);

  ///
  FutureOr<void> buildImageFile(BuildModuleStep buildStep) async {
    log.warning(buildStep.allowedOutputs.single);
    final bufYamlAssetIds =
        await buildStep.findAssets(Glob('proto/**/buf.yaml')).toList();
    assert(bufYamlAssetIds.isNotEmpty, '');

    final targetDirectory = p.joinAll(
      bufYamlAssetIds.single.pathSegments
          .skip(bufYamlAssetIds.first.pathSegments.length - 3)
          .take(2),
    );

    final result = await runBufBuild2(buildStep, targetDirectory);

    await buildStep.writeAsBytes(buildStep.allowedOutputs.single, result);
  }

  @override
  FutureOr<void> build(BuildStep buildStep) =>
      buildImageFile(BuildModuleStep(BuildImageStep(buildStep)));

  @override
  Map<String, List<String>> get buildExtensions => {
        'buf.yaml': ['image.binpb'],
      };

  ///
  final BuilderOptions options;
}
