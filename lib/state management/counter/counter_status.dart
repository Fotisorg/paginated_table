// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

enum CounterStatus { add, subtract, loading, initial }

class CounterState extends Equatable {
  final int num;
  final CounterStatus counterStatus;
  final String hint;
  const CounterState({
    required this.num,
    required this.counterStatus,
    required this.hint,
  });

  factory CounterState.initial() {
    return const CounterState(
        num: 0, hint: '', counterStatus: CounterStatus.initial);
  }

  @override
  // TODO: implement props
  List<Object> get props => [num, hint, counterStatus];

  CounterState copyWith({
    int? num,
    CounterStatus? counterStatus,
    String? hint,
  }) {
    return CounterState(
      num: num ?? this.num,
      counterStatus: counterStatus ?? this.counterStatus,
      hint: hint ?? this.hint,
    );
  }

  @override
  bool get stringify => true;
}
