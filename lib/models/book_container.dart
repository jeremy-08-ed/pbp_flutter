abstract class BookContainer<T> {
  BookContainer({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final String message;
  final List<T> data;
}
