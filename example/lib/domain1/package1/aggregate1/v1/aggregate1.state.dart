part of 'aggregate1.dart';

///
final class Aggregate1State {}

sealed class Aggregate1EntityStateBase {}

///
sealed class Entity1State extends Aggregate1EntityStateBase {}

///
final class Entity1State1 extends Entity1State {}

///
final class Entity1State2 extends Entity1State {}

///
sealed class Entity2State extends Aggregate1EntityStateBase {}

///
final class Entity2State1 extends Entity2State {}

///
final class Entity2State2 extends Entity2State {}
