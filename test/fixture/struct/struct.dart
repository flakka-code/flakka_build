class ModuleFixture {
  ModuleFixture({
    required this.name,
    required this.aggregate,
  });

  final String name;

  final List<AggregateFixture> aggregate;
}

class AggregateFixture {
  AggregateFixture({
    required this.name,
    required this.package,
    required this.entity,
  });

  final String name;

  final String package;

  final List<EntityFixture> entity;
}

class EntityFixture {
  EntityFixture({
    required this.name,
    required this.mutation,
    required this.projection,
    required this.event,
  });

  final String name;

  final MutationFixture mutation;

  final ProjectionFixture projection;

  final EventFixture event;
}

class MutationFixture {
  MutationFixture({
    required this.dispatchCommand,
    required this.state,
  });

  final List<DispatchCommandFixture> dispatchCommand;

  final StateFixture state;
}

class DispatchCommandFixture {
  DispatchCommandFixture({
    required this.name,
    required this.command,
    required this.error,
  });

  final String name;

  final CommandFixture command;

  final ErrorFixture error;
}

class CommandFixture {}

class ErrorFixture {
  ErrorFixture({
    required this.message,
  });

  final String message;
}

class StateFixture {
  StateFixture();
}

class ProjectionFixture {
  ProjectionFixture({
    required this.viewQuery,
    required this.viewState,
  });

  final List<ViewQueryFixture> viewQuery;

  final ViewStateFixture viewState;
}

class ViewQueryFixture {
  ViewQueryFixture({
    required this.name,
    required this.query,
    required this.result,
  });

  final String name;

  final QueryFixture query;

  final ViewResultFixture result;
}

class QueryFixture {}

class ViewResultFixture {}

class ViewStateFixture {}

class EventFixture {
  EventFixture({
    required this.variant,
  });

  final List<EventVariantFixture> variant;
}

class EventVariantFixture {
  EventVariantFixture({
    required this.name,
  });

  final String name;
}
