import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pbp_flutter/bloc/borrowedbook_bloc.dart';
import 'package:pbp_flutter/models/borrowed_book.dart';
import 'package:intl/intl.dart';

class BorrowedSection extends StatefulWidget {
  const BorrowedSection({Key? key}) : super(key: key);

  @override
  _BorrowedSectionState createState() => _BorrowedSectionState();
}

class _BorrowedSectionState extends State<BorrowedSection> {
  late BorrowedbookBloc borrowedbookBloc;

  @override
  void initState() {
    super.initState();

    borrowedbookBloc = BlocProvider.of<BorrowedbookBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return buildBorrowedSection();
  }

  Widget buildBorrowedSection() {
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
                  onChanged: (value) => {
                    if (value.isEmpty)
                      {
                        borrowedbookBloc.add(ClearBorrowedBooks()),
                      }
                  },
                  onSubmitted: (value) => {
                    if (value.isNotEmpty)
                      {
                        borrowedbookBloc.add(LoadBorrowedBooks(value)),
                      }
                  },
                  decoration: const InputDecoration(
                    hintText: 'Search by NIM',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(29.w, 18.h, 29.w, 18.h),
          sliver: SliverFillRemaining(
            child: BlocConsumer<BorrowedbookBloc, BorrowedbookState>(
              listener: (context, state) {
                if (state is BorrowedbookError) {
                  final snackBar = SnackBar(content: Text(state.error));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              builder: (context, state) {
                if (state is BorrowedbookLoaded) {
                  if (state.books.isNotEmpty) {
                    return ListView(
                      children:
                          state.books.map((e) => BookItem(book: e)).toList(),
                    );
                  } else {
                    return const Center(
                      child: Text("Tidak ada data"),
                    );
                  }
                } else if (state is BorrowedbookLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return const Center(
                    child: Text("Masukan NIM"),
                  );
                }
              },
            ),
          ),
        )
      ],
    );
  }
}

class BookItem extends StatelessWidget {
  final BorrowedBook book;
  const BookItem({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 229.h,
          width: 162.w,
          child: Card(
            child: FadeInImage(
              fit: BoxFit.cover,
              placeholder: const AssetImage('lib/images/book_placeholder.png'),
              image: NetworkImage(
                "https://25w.000webhostapp.com/uploads/" + book.fileGambar,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 14.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Judul'),
                Text(book.judul),
                const Text('Author'),
                Text(book.pengarang),
                const Text('Tanggal Pinjam'),
                Text(DateFormat('dd-MM-yyyy').format(book.tglPinjam)),
                Text((book.tglKembali.isNotEmpty) ? 'Tanggal Kembali' : ''),
                Text(book.tglKembali),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
