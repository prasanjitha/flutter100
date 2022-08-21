import 'package:flutter/foundation.dart';
import 'package:flutter100/models/User.dart';

@immutable
class StudentPageState {
  final String error;
  final List<User> users;
  final bool isLoading;

  const StudentPageState({
    required this.error,
    required this.users,
    required this.isLoading,
  });

  static StudentPageState get initialState {
    return const StudentPageState(error: '', users: [], isLoading: false);
  }

  StudentPageState clone({
    String? error,
    List<User>? users,
    bool? isLoading,
  }) {
    return StudentPageState(
      error: error ?? this.error,
      users: users ?? this.users,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
