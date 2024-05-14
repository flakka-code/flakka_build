import 'package:build/build.dart';
import 'package:build_test/build_test.dart';

// Helper function for running build step tests
Future<void> runBuildStepTest({
  required String package,
  required Map<String, Object> sourceAssets,
  required Future<void> Function(BuildStep buildStep) buildTest,
  String? inputAsset,
}) async {
  final builder = TestBuilder(
    build: (buildStep, _) async {
      await buildTest(buildStep);
    },
  );

  await testBuilder(
    builder,
    sourceAssets,
    isInput: (inputAsset == null ? null : (asset) => asset == inputAsset),
  );
}
