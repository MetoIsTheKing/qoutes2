part of 'counter_cubit.dart';

// @immutable
abstract class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object?> get props => [];
}

class CounterInitialState extends CounterState {}
class CounterIsIncreasingState extends CounterState {}

