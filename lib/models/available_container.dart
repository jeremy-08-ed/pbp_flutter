import 'package:berbaring_library/models/available_book.dart';
import 'package:berbaring_library/models/book_container.dart';

class AvailableContainer extends BookContainer<AvailableBook> {
  AvailableContainer({status, message, data})
      : super(data: data, status: status, message: message);
}
