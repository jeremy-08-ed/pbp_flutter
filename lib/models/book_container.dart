class BookContainer<T> {
  BookContainer({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final String message;
  final List<T> data;

  // factory BookContainer.fromJson(Map<String, dynamic> json) => BookContainer(
  //       status: json["status"],
  //       message: json["message"],
  //       data: List<AvailableBook>.from(
  //           json["data"].map((x) => AvailableBook.fromJson(x))),
  //     );

  // Map<String, dynamic> toJson() => {
  //       "status": status,
  //       "message": message,
  //       "data": List<dynamic>.from(data.map((x) => x.toJson())),
  //     };
}
