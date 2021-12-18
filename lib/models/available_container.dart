import 'package:pbp_flutter/models/available_book.dart';
import 'package:pbp_flutter/models/book_container.dart';

class AvailableContainer extends BookContainer<AvailableBook> {
  AvailableContainer({status, message, data})
      : super(data: data, status: status, message: message);
}
