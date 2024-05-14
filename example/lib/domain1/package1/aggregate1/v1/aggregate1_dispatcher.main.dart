part of 'aggregate1_dispatcher.dart';

class Aggregate1Dispatcher {
  late Aggregate1State _state;

  ///

  @protected
  set state(Aggregate1State state) => _state = state;

  Aggregate1State get state => _state;

  void handle<Entity extends Aggregate1EntityBase<
      Command>, Command extends Aggregate1CommandBase>(Command command) {
    switch (command) {
      case Entity1Command():
        return entity1CommandHandler.handle()
      case Entity2Command():
    }
  }
}
