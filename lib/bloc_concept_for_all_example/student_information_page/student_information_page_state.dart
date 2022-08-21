import 'package:flutter/foundation.dart';

import '../../models/User.dart';

@immutable
class StudentInformationPageState {
  final String error;
  final String userName;
  final bool isLoading;

  const StudentInformationPageState({
    required this.error,
    required this.userName,
    required this.isLoading,
  });

  static StudentInformationPageState get initialState {
    return const StudentInformationPageState(
        error: '', userName: '', isLoading: false);
  }

  StudentInformationPageState clone({
    String? error,
    String? userName,
    bool? isLoading,
  }) {
    return StudentInformationPageState(
      error: error ?? this.error,
      userName: userName ?? this.userName,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
