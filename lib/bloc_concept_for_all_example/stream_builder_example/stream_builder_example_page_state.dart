import 'package:flutter/foundation.dart';

@immutable
class StreamBuilderExamplePageState {
  final String error;
  final int number;
  final bool isLoading;

  const StreamBuilderExamplePageState({
    required this.error,
    required this.isLoading,
    required this.number,
  });

  static StreamBuilderExamplePageState get initialState {
    return const StreamBuilderExamplePageState(
        error: '', isLoading: false, number: 0);
  }

  StreamBuilderExamplePageState clone({
    String? error,
    int? number,
    bool? isLoading,
  }) {
    return StreamBuilderExamplePageState(
      error: error ?? this.error,
      number: number ?? this.number,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
