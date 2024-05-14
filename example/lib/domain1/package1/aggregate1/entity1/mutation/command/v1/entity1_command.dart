part of '../../../../v1/aggregate1_command.dart';

///
sealed class Entity1Command extends Aggregate1CommandBase {
  factory Entity1Command.command1() => Entity1Command1();
}
