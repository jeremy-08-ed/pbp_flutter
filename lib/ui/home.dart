import 'package:flutter/material.dart';
import 'package:pbp_flutter/models/available_book.dart';
import 'package:pbp_flutter/ui/available_section.dart';
import 'package:pbp_flutter/ui/borrowed_section.dart';

class Home extends StatefulWidget {
  final List<AvailableBook> books;
  const Home({Key? key, required this.books}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: _currPage,
          children: [
            AvailableSection(books: widget.books),
            const BorrowedSection()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home), //icon sementara
              label: "Search by Book",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.hourglass_full), label: "Search by NIM"),
          ],
          currentIndex: _currPage,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          onTap: _changePage,
        ),
      ),
    );
  }

  void _changePage(int index) {
    setState(
      () {
        _currPage = index;
      },
    );
  }
}
