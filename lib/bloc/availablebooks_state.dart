part of 'availablebooks_bloc.dart';

abstract class AvailablebooksState extends Equatable {
  const AvailablebooksState();

  @override
  List<Object> get props => [];
}

class AvailableBooksLoading extends AvailablebooksState {}

class AvailableBooksLoaded extends AvailablebooksState {
  final List<AvailableBook> books;

  const AvailableBooksLoaded(this.books);
}

class AvailableBooksError extends AvailablebooksState {
  final dynamic error;

  const AvailableBooksError(this.error);
}
