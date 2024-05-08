import 'builder/fixture_builder.dart';
import 'struct/struct.dart';

class SimpleAggregateModuleFixture {
  static final module1Fixture = buildModuleFixture(module1Module);

  static final module1Module = ModuleFixture(
    name: 'module1',
    aggregate: [
      SimpleAggregateFixture.aggregate1Aggregate,
    ],
  );
}

class SimpleAggregateFixture {
  static final aggregate1Aggregate = AggregateFixture(
    name: 'aggregate1',
    package: 'myorg.domain1.package1',
    entity: [
      SimpleEntityFixture.entity1Entity,
    ],
  );
}

class SimpleEntityFixture {
  static final entity1Entity = EntityFixture(
    name: 'entity1',
    mutation: SimpleMutationFixture.mutation,
    projection: SimpleProjectionFixture.projection,
    event: SimpleEventFixture.event,
  );
}

class SimpleMutationFixture {
  static final mutation = MutationFixture(
    dispatchCommand: [
      DispatchCommandFixture(
        name: 'command1',
        command: CommandFixture(),
        error: ErrorFixture(message: 'reason1'),
      ),
    ],
    state: StateFixture(),
  );
}

class SimpleProjectionFixture {
  static final projection = ProjectionFixture(
    viewQuery: [],
    viewState: ViewStateFixture(),
  );
}

class SimpleEventFixture {
  static final event = EventFixture(
    variant: [
      EventVariantFixture(name: 'event1'),
    ],
  );
}
