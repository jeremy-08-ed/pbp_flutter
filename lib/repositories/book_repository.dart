import 'package:http/http.dart' as http;
import 'package:pbp_flutter/mappers/entity_mapper.dart';
import 'package:pbp_flutter/models/available_container.dart';
import 'dart:convert';

class BookRepository {
  final EntityMapper<AvailableContainer> mapper;

  final String baseUrl = 'https://25w.000webhostapp.com';

  BookRepository(this.mapper);

  Future<AvailableContainer> getListBooks() async {
    final apiUrl = Uri.parse(baseUrl + '/api/v1/books');

    final response = await http.get(apiUrl);

    Map<String, dynamic> parsedJson = json.decode(response.body);

    if (response.statusCode == 200) {
      final AvailableContainer bookContainer = mapper.mapFromJson(parsedJson);

      return bookContainer;
    } else {
      throw Exception(parsedJson['message']);
    }
  }
}
