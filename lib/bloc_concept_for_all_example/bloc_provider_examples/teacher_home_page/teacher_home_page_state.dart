import 'package:flutter/foundation.dart';

@immutable
class TeacherHomePageState {
  final String error;

  const TeacherHomePageState({
    required this.error,
  });

  static TeacherHomePageState get initialState {
    return const TeacherHomePageState(error: '');
  }

  TeacherHomePageState clone({
    String? error,
  }) {
    return TeacherHomePageState(
      error: error ?? this.error,
    );
  }
}
