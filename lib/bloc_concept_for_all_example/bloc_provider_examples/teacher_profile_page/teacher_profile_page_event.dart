import 'package:flutter/foundation.dart';

@immutable
abstract class TeacherProfilePageEvent {}

class InitEvent extends TeacherProfilePageEvent {}

class CallOwnEvent extends TeacherProfilePageEvent {}
