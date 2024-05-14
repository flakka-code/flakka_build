import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:flakka_build/flakka_build.dart';
import 'package:flakka_protobuf_build_types/buf/alpha/image/v1/image.pb.dart';
import 'package:test/test.dart';

// Test helper function
Future<void> runBuildStepTest({
  required String package,
  required Map<String, Object> sourceAssets,
  required Future<void> Function(BuildStep buildStep) buildTest,
}) async {
  // Create the TestBuilder with the provided test handler
  final builder = TestBuilder(
    build: (buildStep, _) async {
      await buildTest(buildStep);
    },
  );

  await testBuilder(builder, sourceAssets);
}

void main() {
  const package = 'my_package';

  group('BuildImageStep Tests', () {
    test('should find image.binpb in parent directory', () async {
      final sourceAssets = {
        '$package|proto/module1/image.binpb':
            Image(file: [ImageFile(name: 'module1.proto')]).writeToBuffer(),
      };

      await runBuildStepTest(
        package: package,
        sourceAssets: sourceAssets,
        buildTest: (BuildStep buildStep) async {
          final buildImageStep = BuildImageStep(buildStep);
          final image = await buildImageStep.inputImage;

          expect(image, isNotNull, reason: 'Image should be found.');
        },
      );
    });

    test('should return null if image.binpb is not found', () async {
      final sourceAssets = {
        '$package|proto/module1/domain1/aggregate1/v1/aggregate1_aggregate.proto':
            'syntax = "proto3";',
      };

      await runBuildStepTest(
        package: package,
        sourceAssets: sourceAssets,
        buildTest: (BuildStep buildStep) async {
          final buildImageStep = BuildImageStep(buildStep);
          final image = await buildImageStep.inputImage;

          expect(image, isNull, reason: 'Image should not be found.');
        },
      );
    });
  });
}
