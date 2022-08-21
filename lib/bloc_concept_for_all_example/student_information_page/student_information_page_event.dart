import 'package:flutter/foundation.dart';

@immutable
abstract class StudentInformationPageEvent {}

class GetUserDataEvent extends StudentInformationPageEvent {}

class SubmitUserDataEvent extends StudentInformationPageEvent {
  final String name;
  SubmitUserDataEvent({required this.name});
}
