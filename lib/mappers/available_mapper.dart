import 'package:berbaring_library/mappers/entity_mapper.dart';
import 'package:berbaring_library/models/available_book.dart';
import 'package:berbaring_library/models/available_container.dart';

class AvailableMapper extends EntityMapper<AvailableContainer> {
  @override
  AvailableContainer mapFromJson(Map<String, dynamic> json) =>
      AvailableContainer(
        status: json["status"],
        message: json["message"],
        data: List<AvailableBook>.from(
            json["data"].map((x) => AvailableBook.fromJson(x))),
      );

  @override
  Map<String, dynamic> toJson(AvailableContainer entity) => {
        "status": entity.status,
        "message": entity.message,
        "data": List<dynamic>.from(entity.data.map((x) => x.toJson())),
      };
}
