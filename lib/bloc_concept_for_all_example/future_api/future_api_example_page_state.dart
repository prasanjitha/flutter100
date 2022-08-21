import 'package:flutter/foundation.dart';

@immutable
class FutureApiExamplePageState {
  final String error;
  final String email;
  final bool isLoading;

  const FutureApiExamplePageState({
    required this.error,
    required this.email,
    required this.isLoading,
  });

  static FutureApiExamplePageState get initialState {
    return const FutureApiExamplePageState(
        error: '', email: '', isLoading: false);
  }

  FutureApiExamplePageState clone({
    String? error,
    String? email,
    bool? isLoading,
  }) {
    return FutureApiExamplePageState(
      error: error ?? this.error,
      email: email ?? this.email,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
