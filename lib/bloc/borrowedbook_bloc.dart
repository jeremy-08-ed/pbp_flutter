import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:berbaring_library/mappers/available_mapper.dart';
import 'package:berbaring_library/mappers/borrowed_mapper.dart';
import 'package:berbaring_library/models/borrowed_book.dart';
import 'package:berbaring_library/models/borrowed_container.dart';
import 'package:berbaring_library/repositories/book_repository.dart';

part 'borrowedbook_event.dart';
part 'borrowedbook_state.dart';

class BorrowedbookBloc extends Bloc<BorrowedbookEvent, BorrowedbookState> {
  BookRepository bookRepository =
      BookRepository(AvailableMapper(), BorrowedMapper());

  BorrowedbookBloc() : super(BorrowedbookInitial()) {
    on<BorrowedbookEvent>((event, emit) async {
      if (event is LoadBorrowedBooks) {
        emit(BorrowedbookLoading());

        try {
          final BorrowedContainer container =
              await bookRepository.getBorrowedBooks(event.nim);

          if (container.status == false) {
            emit(BorrowedbookError(container.message));
          } else {
            emit(BorrowedbookLoaded(container.data));
          }
        } catch (e) {
          emit(BorrowedbookError(e.toString()));
        }
      } else if (event is ClearBorrowedBooks) {
        emit(BorrowedbookInitial());
      }
    });
  }
}
