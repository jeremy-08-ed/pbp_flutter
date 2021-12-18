part of 'borrowedbook_bloc.dart';

abstract class BorrowedbookState extends Equatable {
  const BorrowedbookState();

  @override
  List<Object> get props => [];
}

class BorrowedbookInitial extends BorrowedbookState {}

class BorrowedbookLoading extends BorrowedbookState {}

class BorrowedbookLoaded extends BorrowedbookState {
  final List<BorrowedBook> books;

  const BorrowedbookLoaded(this.books);
}

class BorrowedbookError extends BorrowedbookState {
  final dynamic error;

  const BorrowedbookError(this.error);
}
