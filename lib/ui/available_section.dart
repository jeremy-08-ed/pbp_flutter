import 'package:flutter/material.dart';
import 'package:berbaring_library/models/available_book.dart';
import 'package:berbaring_library/ui/book_detail.dart';
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
  void dispose() {
    super.dispose();
    _bookNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: const Color(0xFF409CA6),
          floating: true,
          pinned: true,
          snap: false,
          centerTitle: false,
          title: const Text('Berbaring Library'),
          actions: const [],
          bottom: AppBar(
            backgroundColor: const Color(0xFF409CA6),
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
        childAspectRatio: 162.w / 229.h,
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
                child: Hero(
                  tag: book.isbn,
                  child: Card(
                    child: FadeInImage(
                      fit: BoxFit.cover,
                      placeholder:
                          const AssetImage('lib/images/book_placeholder.png'),
                      image: NetworkImage(
                        "https://25w.000webhostapp.com/uploads/" +
                            book.fileGambar,
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      );
    }
  }
}
