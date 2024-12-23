import 'package:flutter/material.dart';
import 'package:paginated_data_table_example/state%20management/counter/counter_status.dart';

class CounterProvider extends ChangeNotifier {
  CounterState _counterState = CounterState.initial();
  CounterState get counterState => _counterState;

  void add() async {
    _counterState = _counterState.copyWith(
        counterStatus: CounterStatus.loading, hint: 'Adding...');
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 500));
    _counterState = _counterState.copyWith(
        num: _counterState.num + 1, counterStatus: CounterStatus.add, hint: '');
    notifyListeners();
  }

  void subtract() async {
    _counterState = _counterState.copyWith(
        counterStatus: CounterStatus.loading, hint: 'Substracting...');
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 500));
    _counterState = _counterState.copyWith(
        num: _counterState.num - 1,
        counterStatus: CounterStatus.subtract,
        hint: '');

    notifyListeners();
  }
}
