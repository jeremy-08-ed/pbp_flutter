import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pbp_flutter/mappers/available_mapper.dart';
import 'package:pbp_flutter/models/available_book.dart';
import 'package:pbp_flutter/models/available_container.dart';
import 'package:pbp_flutter/repositories/book_repository.dart';

part 'availablebooks_event.dart';
part 'availablebooks_state.dart';

class AvailablebooksBloc
    extends Bloc<AvailablebooksEvent, AvailablebooksState> {
  BookRepository bookRepository = BookRepository(AvailableMapper());

  AvailablebooksBloc() : super(LoadingAvailableBooks()) {
    on<AvailablebooksEvent>(
      (event, emit) async {
        if (event is LoadAvailableBooks) {
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
