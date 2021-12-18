part of 'availablebooks_bloc.dart';

abstract class AvailablebooksEvent extends Equatable {
  const AvailablebooksEvent();

  @override
  List<Object> get props => [];
}

class LoadAvailableBooks extends AvailablebooksEvent {}
