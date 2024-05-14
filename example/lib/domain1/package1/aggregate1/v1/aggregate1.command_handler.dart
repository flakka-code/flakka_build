part of 'aggregate1.dart';


abstract class Aggregate1CommandHandlerBase<Command extends Aggregate1CommandBase,
State extends Aggregate1StateBase> {
  late State _state;

  ///

  @protected
  set state(State state) => _state = state;

  State get state => _state;

  void handle(Command command) {
    switch (command) {
      case Entity1Command():
        return entity1CommandHandler.handle()
      case Entity2Command():
    }
  }
}

///
CommandHandler initialize<
CommandHandler extends Aggregate1CommandHandler<Command, State>,
Command extends Aggregate1CommandBase,
State extends Aggregate1StateBase>(CommandHandler handler,
    State state,) =>
    handler..state = state;
