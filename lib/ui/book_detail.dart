import 'package:flutter/material.dart';

class BookDetail extends StatelessWidget {
  const BookDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: Scaffold(
        appBar: AppBar(
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
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                child: const FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: AssetImage('lib/images/book_placeholder.png'),
                  image: NetworkImage(
                      "https://ichef.bbci.co.uk/news/976/cpsprodpb/E773/production/_107715295_harrypotterfirstedition-foundbyhansons.jpg"),
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
                      child: const Text(
                        "Book Title",
                        style: TextStyle(
                          fontSize: 27,
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
                          children: _descriptionText("Author", "Author value"),
                        ),
                        TableRow(
                          children: _descriptionText("ISBN", "ISBN value"),
                        ),
                        TableRow(
                          children:
                              _descriptionText("Kategori", "Kategori value"),
                        ),
                        TableRow(
                          children:
                              _descriptionText("Penerbit", "Penerbit value"),
                        ),
                        TableRow(
                          children: _descriptionText("Stok", "Stok value"),
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
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
      ),
      const Text(
        ":",
        style: TextStyle(
          fontSize: 17,
        ),
      ),
      Text(
        value,
        style: const TextStyle(
          fontSize: 17,
        ),
      ),
    ];
  }
}
