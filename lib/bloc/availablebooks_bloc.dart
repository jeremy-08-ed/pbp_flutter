import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:berbaring_library/mappers/available_mapper.dart';
import 'package:berbaring_library/mappers/borrowed_mapper.dart';
import 'package:berbaring_library/models/available_book.dart';
import 'package:berbaring_library/models/available_container.dart';
import 'package:berbaring_library/repositories/book_repository.dart';

part 'availablebooks_event.dart';
part 'availablebooks_state.dart';

class AvailablebooksBloc
    extends Bloc<AvailablebooksEvent, AvailablebooksState> {
  BookRepository bookRepository =
      BookRepository(AvailableMapper(), BorrowedMapper());

  AvailablebooksBloc() : super(AvailableBooksLoading()) {
    on<AvailablebooksEvent>(
      (event, emit) async {
        if (event is LoadAvailableBooks) {
          emit(AvailableBooksLoading());

          try {
            final AvailableContainer container =
                await bookRepository.getListBooks();

            if (container.status == false) {
              emit(AvailableBooksError(container.message));
            } else {
              emit(AvailableBooksLoaded(container.data));
            }
          } catch (e) {
            emit(AvailableBooksError(e.toString()));
          }
        }
      },
    );
  }
}
