import 'package:flutter/foundation.dart';

@immutable
abstract class TeacherHomePageEvent {}

class InitEvent extends TeacherHomePageEvent {}

class SubmitUserDataEvent extends TeacherHomePageEvent {
  final String userName;
  SubmitUserDataEvent({required this.userName});
}
