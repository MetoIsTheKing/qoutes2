import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {

  // the default state to start with
  CounterCubit() : super(CounterInitialState());

  int counter = 0;
  void incrementCounter() {
    emit(CounterInitialState());
    counter++;
    emit(CounterIsIncreasingState());
  }
}
