import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:flakka_build/flakka_build.dart';
import 'package:flakka_protobuf_build_types/flakka/build/element/v1alpha1/element_descriptor.pb.dart';
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

  group('BuildModuleStep Tests', () {
    test('should find module.binpb in parent directory', () async {
      final sourceAssets = {
        '$package|proto/module1/module.binpb': ModuleElement().writeToBuffer(),
      };

      await runBuildStepTest(
        package: package,
        sourceAssets: sourceAssets,
        buildTest: (BuildStep buildStep) async {
          final buildModuleStep = BuildModuleStep(BuildImageStep(buildStep));
          final moduleDescriptor = await buildModuleStep.inputModuleElement;

          expect(
            moduleDescriptor,
            isNotNull,
            reason: 'Module descriptor should be found.',
          );
        },
      );
    });

    test('should return null if module.binpb is not found', () async {
      final sourceAssets = {
        '$package|proto/module1/domain1/aggregate1/v1/aggregate1_aggregate.proto':
            'syntax = "proto3";',
      };

      await runBuildStepTest(
        package: package,
        sourceAssets: sourceAssets,
        buildTest: (BuildStep buildStep) async {
          final buildModuleStep = BuildModuleStep(BuildImageStep(buildStep));
          final moduleDescriptor = await buildModuleStep.inputModuleElement;

          expect(
            moduleDescriptor,
            isNull,
            reason: 'Module descriptor should not be found.',
          );
        },
      );
    });
  });
}
