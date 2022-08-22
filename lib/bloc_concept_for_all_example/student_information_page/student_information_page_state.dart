import 'package:flutter/foundation.dart';

import '../../models/User.dart';

@immutable
class StudentInformationPageState {
  final String error;
  final String userName;
  final bool isLoading;
  final bool init;

  const StudentInformationPageState({
    required this.error,
    required this.userName,
    required this.isLoading,
    required this.init,
  });

  static StudentInformationPageState get initialState {
    return const StudentInformationPageState(
        error: '', userName: '', isLoading: false, init: false);
  }

  StudentInformationPageState clone({
    String? error,
    String? userName,
    bool? isLoading,
    bool? init,
  }) {
    return StudentInformationPageState(
      error: error ?? this.error,
      userName: userName ?? this.userName,
      isLoading: isLoading ?? this.isLoading,
      init: init ?? this.init,
    );
  }
}
