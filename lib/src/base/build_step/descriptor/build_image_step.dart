import 'dart:async';
import 'package:build/build.dart';
import 'package:flakka_build/src/base/build_step/util.dart';
import 'package:flakka_protobuf_build_types/buf/alpha/image/v1/image.pb.dart';

///
extension type BuildImageStep(BuildStep buildStep) implements BuildStep {
  ///
  Future<Image?> get inputImage async {
    const assetName = 'image.binpb';

    final foundAsset = await findAssetInParentDirs(buildStep, assetName);

    return foundAsset != null
        ? Image.fromBuffer(await buildStep.readAsBytes(foundAsset))
        : null;
  }
}
