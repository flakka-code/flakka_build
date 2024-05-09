import 'dart:async';
import 'package:build/build.dart';
import 'package:flakka_build/src/base/build_step/util.dart';
import 'package:flakka_protobuf_build_types/buf/alpha/image/v1/image.pb.dart';
import 'package:flakka_protobuf_build_types/flakka/build/element/v1alpha1/element_descriptor.pb.dart';
import 'package:path/path.dart' as p;

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

///
extension type BuildModuleStep(BuildImageStep buildStep)
    implements BuildImageStep {
  ///
  Future<ModuleElement?> get inputModuleElement async {
    const assetName = 'module.binpb';

    final foundAsset = await findAssetInParentDirs(buildStep, assetName);

    return foundAsset != null
        ? ModuleElement.fromBuffer(await buildStep.readAsBytes(foundAsset))
        : null;
  }
}

// ///
// extension type BuildAggregateStep(BuildModuleStep buildStep)
//     implements BuildModuleStep {
//   ///
//   Future<ModuleDescriptorProto> get aggregateDescriptor {
//     throw UnimplementedError();
//   }
// }
//
// ///
// extension type BuildEntityStep(BuildAggregateStep buildStep)
//     implements BuildAggregateStep {
//   ///
//   Future<ModuleDescriptorProto> get entityDescriptor {
//     throw UnimplementedError();
//   }
// }
//
// ///
// extension type BuildEventStep(BuildEntityStep buildStep)
//     implements BuildEntityStep {
//   ///
//   Future<ModuleDescriptorProto> get eventEnvelopeDescriptors {
//     throw UnimplementedError();
//   }
// }
