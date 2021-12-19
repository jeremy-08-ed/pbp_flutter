import 'package:berbaring_library/models/book_container.dart';
import 'package:berbaring_library/models/borrowed_book.dart';

class BorrowedContainer extends BookContainer<BorrowedBook> {
  BorrowedContainer({status, message, data})
      : super(data: data, status: status, message: message);
}
