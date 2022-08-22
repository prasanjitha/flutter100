import 'package:flutter/foundation.dart';

@immutable
class UserInputPageState {
  final String error;
  final String name;

  const UserInputPageState({
    required this.error,
    required this.name,
  });

  static UserInputPageState get initialState {
    return const UserInputPageState(error: '', name: '');
  }

  UserInputPageState clone({
    String? error,
    String? name,
  }) {
    return UserInputPageState(
      error: error ?? this.error,
      name: name ?? this.name,
    );
  }
}
