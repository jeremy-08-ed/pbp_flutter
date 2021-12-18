import 'package:http/http.dart' as http;
import 'package:pbp_flutter/mappers/entity_mapper.dart';
import 'package:pbp_flutter/models/available_container.dart';
import 'dart:convert';

import 'package:pbp_flutter/models/borrowed_container.dart';

class BookRepository {
  final EntityMapper<AvailableContainer> availableMapper;

  final EntityMapper<BorrowedContainer> borrowedMapper;

  final String baseUrl = 'https://25w.000webhostapp.com';

  BookRepository(this.availableMapper, this.borrowedMapper);

  Future<AvailableContainer> getListBooks() async {
    final apiUrl = Uri.parse(baseUrl + '/api/v1/books');

    final response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      Map<String, dynamic> parsedJson = json.decode(response.body);

      final AvailableContainer bookContainer =
          availableMapper.mapFromJson(parsedJson);

      return bookContainer;
    } else {
      if (response.statusCode == 500) {
        throw Exception("Internal Server Error");
      } else {
        throw Exception("Failed to fetch available books");
      }
    }
  }

  Future<BorrowedContainer> getBorrowedBooks(String nim) async {
    final apiUrl = Uri.parse(baseUrl + '/api/v1/borrowed-books');

    final response = await http.post(
      apiUrl,
      body: {'nim': nim},
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> parsedJson = json.decode(response.body);

      final BorrowedContainer borrowedContainer =
          borrowedMapper.mapFromJson(parsedJson);

      return borrowedContainer;
    } else {
      if (response.statusCode == 500) {
        throw Exception("Internal Server Error");
      } else if (response.statusCode == 400) {
        Map<String, dynamic> parsedJson = json.decode(response.body);

        throw Exception(parsedJson['message']);
      } else {
        throw Exception("Failed to get borrowed books");
      }
    }
  }
}
