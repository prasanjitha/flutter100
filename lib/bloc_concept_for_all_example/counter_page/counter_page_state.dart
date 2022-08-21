import 'package:flutter/foundation.dart';

@immutable
class CounterPageState {
  final String error;
  final int number;

  const CounterPageState({
    required this.error,
    required this.number,
  });

  static CounterPageState get initialState {
    return const CounterPageState(error: '', number: 0);
  }

  CounterPageState clone({
    String? error,
    int? number,
  }) {
    return CounterPageState(
      error: error ?? this.error,
      number: number ?? this.number,
    );
  }
}
