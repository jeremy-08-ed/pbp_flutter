import 'package:flutter/material.dart';
import 'package:berbaring_library/models/available_book.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetail extends StatelessWidget {
  final AvailableBook book;

  const BookDetail({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF409CA6),
          title: const Text(
            "Book detail",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          leading: const BackButton(),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: book.isbn,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 260.h,
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        book.judul,
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Table(
                      columnWidths: const {
                        0: FixedColumnWidth(80),
                        1: FixedColumnWidth(10),
                      },
                      children: [
                        TableRow(
                          children: _descriptionText("Author", book.pengarang),
                        ),
                        TableRow(
                          children: _descriptionText("ISBN", book.isbn),
                        ),
                        TableRow(
                          children: _descriptionText("Kategori", book.nama),
                        ),
                        TableRow(
                          children: _descriptionText("Penerbit", book.penerbit),
                        ),
                        TableRow(
                          children: _descriptionText("Stok", book.stok),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _descriptionText(String label, String value) {
    return [
      Container(
        margin: const EdgeInsets.only(bottom: 5),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      Text(
        ":",
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w300,
        ),
      ),
      Text(
        value,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w300,
        ),
      ),
    ];
  }
}
