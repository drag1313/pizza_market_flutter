part of 'my_bloc.dart';

@immutable
abstract class MyEvent {}

class MyInitialEvent extends MyEvent {}

class BasketEvent extends MyEvent {}

class AdminEvent extends MyEvent {}
