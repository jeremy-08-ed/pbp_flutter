import 'package:berbaring_library/mappers/entity_mapper.dart';
import 'package:berbaring_library/models/borrowed_book.dart';
import 'package:berbaring_library/models/borrowed_container.dart';

class BorrowedMapper extends EntityMapper<BorrowedContainer> {
  @override
  BorrowedContainer mapFromJson(Map<String, dynamic> json) => BorrowedContainer(
        status: json["status"],
        message: json["message"],
        data: List<BorrowedBook>.from(
            json["data"].map((x) => BorrowedBook.fromJson(x))),
      );

  @override
  Map<String, dynamic> toJson(BorrowedContainer entity) => {
        "status": entity.status,
        "message": entity.message,
        "data": List<dynamic>.from(entity.data.map((x) => x.toJson())),
      };
}
