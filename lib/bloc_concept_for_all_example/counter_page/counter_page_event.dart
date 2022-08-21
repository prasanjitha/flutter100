import 'package:flutter/foundation.dart';

@immutable
abstract class CounterPageEvent {}

class IncrementEvent extends CounterPageEvent {}

class DecrementEvent extends CounterPageEvent {}

class ResetEvent extends CounterPageEvent {}
