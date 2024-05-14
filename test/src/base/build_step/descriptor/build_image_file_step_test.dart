import 'package:build/build.dart';
import 'package:flakka_build/flakka_build.dart';
import 'package:flakka_protobuf_build_types/buf/alpha/image/v1/image.pb.dart';
import 'package:test/test.dart';

import '../test_util.dart';

void main() {
  const package = 'my_package';

  group('BuildImageFileStep Tests', () {
    test('should find corresponding ImageFile by relative path', () async {
      final sourceAssets = {
        '$package|proto/module1/image.binpb': Image(
          file: [
            ImageFile(
              name: 'domain1/aggregate1/v1/aggregate1_aggregate.proto',
            ),
          ],
        ).writeToBuffer(),
        '$package|proto/module1/domain1/aggregate1/v1/aggregate1_aggregate.proto':
            'syntax = "proto3";', // The relative path to be checked
      };

      await runBuildStepTest(
        package: package,
        sourceAssets: sourceAssets,
        inputAsset:
            '$package|proto/module1/domain1/aggregate1/v1/aggregate1_aggregate.proto',
        buildTest: (BuildStep buildStep) async {
          final buildImageStep = BuildImageStep(buildStep);
          final buildImageFileStep = BuildImageFileStep(buildImageStep);

          // Check the moduleDescriptor for the corresponding ImageFile
          final imageFile = await buildImageFileStep.inputImageFile;

          expect(
            imageFile,
            isNotNull,
            reason: 'Expected to find ImageFile with matching relative path.',
          );

          expect(
            imageFile!.name,
            'domain1/aggregate1/v1/aggregate1_aggregate.proto',
            reason: 'ImageFile name should match expected relative path.',
          );
        },
      );
    });

    test('should return null if no matching ImageFile', () async {

      final sourceAssets = {
        '$package|proto/module1/image.binpb': Image(
          file: [
            ImageFile(name: 'some/other/path.proto'),
          ],
        ).writeToBuffer(),
        '$package|proto/module1/domain1/aggregate1/v1/aggregate1_aggregate.proto':
            'syntax = "proto3";',
      };

      await runBuildStepTest(
        package: package,
        sourceAssets: sourceAssets,
        buildTest: (BuildStep buildStep) async {
          final buildImageStep = BuildImageStep(buildStep);
          final buildImageFileStep = BuildImageFileStep(buildImageStep);

          final imageFile = await buildImageFileStep.inputImageFile;

          expect(
            imageFile,
            isNull,
            reason: 'Expected no matching ImageFile when relative path '
                'does not match.',
          );
        },
      );
    });
  });
}
