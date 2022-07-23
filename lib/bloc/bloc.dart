import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_with_bloc/bloc/event.dart';
import 'package:work_with_bloc/bloc/state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterValueState(0)) {
    on<CounterEvent>(mapEventToState);
  }

  @override
  void mapEventToState(CounterEvent event, Emitter<CounterState> emit) async {
    if (event is IncrementEvent) {
      emit(CounterValueState(state.counter! + 1));
    }
  }
}
