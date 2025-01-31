part of 'game_bloc.dart';

abstract class GameEvent {}

class TileTappedEvent extends GameEvent {
  final int index;

  TileTappedEvent({required this.index});
}

class ResetGameEvent extends GameEvent {}
