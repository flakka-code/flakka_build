part of 'aggregate1.dart';

///
sealed class Aggregate1EntityBase<Command extends Aggregate1CommandBase> {}

///
final class Entity1 extends Aggregate1EntityBase {}

///
final class Entity2 extends Aggregate1EntityBase {}
