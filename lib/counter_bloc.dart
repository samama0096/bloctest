import 'package:bloc/bloc.dart';
import 'package:bloctest/counter_state.dart';

class Counter_Bloc extends Cubit<CounterState> {
  Counter_Bloc() : super(CounterState(counterState: 0));

  void inc() => emit(CounterState(counterState: state.counterState + 1));
  void dec() => emit(CounterState(counterState: state.counterState - 1));
}
