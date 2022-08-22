import 'package:flutter/foundation.dart';

@immutable
class TeacherProfilePageState {
  final String error;

  const TeacherProfilePageState({
    required this.error,
  });

  static TeacherProfilePageState get initialState {
    return const TeacherProfilePageState(error: '');
  }

  TeacherProfilePageState clone({
    String? error,
  }) {
    return TeacherProfilePageState(
      error: error ?? this.error,
    );
  }
}
