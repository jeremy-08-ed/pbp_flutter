import 'package:pbp_flutter/models/book_container.dart';
import 'package:pbp_flutter/models/borrowed_book.dart';

class BorrowedContainer extends BookContainer<BorrowedBook> {
  BorrowedContainer({status, message, data})
      : super(data: data, status: status, message: message);
}
