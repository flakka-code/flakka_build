import 'dart:async';

import 'package:flakka_build/src/base/build_step/descriptor/build_image_step.dart';
import 'package:flakka_build/src/base/build_step/util.dart';
import 'package:flakka_protobuf_build_types/buf/alpha/image/v1/image.pb.dart';
import 'package:path/path.dart' as p;

///
extension type BuildImageFileStep(BuildImageStep buildStep)
    implements BuildImageStep {
  ///
  Future<ImageFile?> get inputImageFile async {
    final image = await inputImage;
    final inputId = buildStep.inputId;

    if (image == null) {
      return null;
    }

    // Get the relative path from the directory containing 'image.binpb'
    final foundAsset = await findAssetInParentDirs(buildStep, 'image.binpb');
    final baseDir = foundAsset == null ? '' : p.dirname(foundAsset.path);
    final relativePath = p.relative(inputId.path, from: baseDir);

    return image.file
        .where((imageFile) => imageFile.name == relativePath)
        .firstOrNull;
  }
}
