abstract class CounterState {
  int? counter;
}

class CounterValueState extends CounterState {
  @override
  final int counter;

  CounterValueState(this.counter);
}
