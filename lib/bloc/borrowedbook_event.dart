part of 'borrowedbook_bloc.dart';

abstract class BorrowedbookEvent extends Equatable {
  const BorrowedbookEvent();

  @override
  List<Object> get props => [];
}

class LoadBorrowedBooks extends BorrowedbookEvent {
  final String nim;

  const LoadBorrowedBooks(this.nim);
}

class ClearBorrowedBooks extends BorrowedbookEvent {}
