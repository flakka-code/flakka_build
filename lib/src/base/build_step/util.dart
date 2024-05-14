import 'dart:async';
import 'package:build/build.dart';
import 'package:path/path.dart' as p;

/// Helper function to find an asset in parent directories
Future<AssetId?> findAssetInParentDirs(
  BuildStep buildStep,
  String assetName,
) async {
  final inputId = buildStep.inputId;
  var currentSearchDir = p.dirname(inputId.path);

  while (currentSearchDir.isNotEmpty) {
    final potentialAssetId = AssetId(
      inputId.package,
      p.join(currentSearchDir, assetName),
    );

    if (await buildStep.canRead(potentialAssetId)) {
      return potentialAssetId; // Asset found
    }

    final parentDir = p.dirname(currentSearchDir);

    if (parentDir == currentSearchDir) {
      break; // Reached root directory
    }

    currentSearchDir = parentDir;
  }

  return null; // Asset not found
}
