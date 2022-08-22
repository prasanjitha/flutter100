import 'package:flutter/foundation.dart';

@immutable
class SubjectDetailsPageState {
  final String error;
  final String subjectName;
  final bool isLoading;

  const SubjectDetailsPageState({
    required this.error,
    required this.subjectName,
    required this.isLoading,
  });

  static SubjectDetailsPageState get initialState {
    return const SubjectDetailsPageState(
        error: '', subjectName: '', isLoading: false);
  }

  SubjectDetailsPageState clone({
    String? error,
    String? subjectName,
    bool? isLoading,
  }) {
    return SubjectDetailsPageState(
      error: error ?? this.error,
      subjectName: subjectName ?? this.subjectName,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
