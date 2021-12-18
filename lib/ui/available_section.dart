import 'package:flutter/material.dart';
import 'package:pbp_flutter/models/available_book.dart';
import 'package:pbp_flutter/ui/book_detail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvailableSection extends StatefulWidget {
  final List<AvailableBook> books;

  const AvailableSection({Key? key, required this.books}) : super(key: key);

  @override
  _AvailableSectionState createState() => _AvailableSectionState();
}

class _AvailableSectionState extends State<AvailableSection> {
  final TextEditingController _bookNameController = TextEditingController();

  final List<AvailableBook> _searchResult = [];
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          pinned: true,
          snap: false,
          centerTitle: false,
          title: const Center(
            child: Text('Berbaring Library'),
          ),
          actions: const [],
          bottom: AppBar(
            title: Container(
              width: double.infinity,
              height: 40,
              color: Colors.white,
              child: Center(
                child: TextField(
                  controller: _bookNameController,
                  onChanged: _searchOperation,
                  decoration: const InputDecoration(
                    hintText: 'Search by Book Name',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(29.w, 18.h, 29.w, 18.h),
          sliver:
              (_searchResult.isNotEmpty && _bookNameController.text.isNotEmpty)
                  ? buildGridBooks(_searchResult)
                  : buildGridBooks(widget.books),
        ),
      ],
    );
  }

  Future<void> _searchOperation(String searchText) async {
    if (_searchResult.isNotEmpty) {
      setState(() {
        _searchResult.clear();
      });
    }

    for (int i = 0; i < widget.books.length; i++) {
      AvailableBook data = widget.books[i];
      if (data.judul.toLowerCase().contains(searchText.toLowerCase())) {
        setState(() {
          _searchResult.add(data);
        });
      }
    }
  }

  Widget buildGridBooks(List<AvailableBook> books) {
    if (books.isEmpty) {
      return const Center(child: Text("No books available"));
    } else {
      return SliverGrid.count(
        crossAxisSpacing: 29.w,
        mainAxisSpacing: 18.h,
        crossAxisCount: 2,
        children: books
            .map(
              (book) => GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookDetail(book: book),
                  ),
                ),
                child: Card(
                  child: Image.network(
                    'https://25w.000webhostapp.com/uploads/' + book.fileGambar,
                    // height: 229.h,
                    // width: 162.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
            .toList(),
      );
    }
  }
}
