import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pbp_flutter/models/available_book.dart';

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
    return ScreenUtilInit(
      designSize: const Size(411, 731),
      builder: () => MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
        home: Scaffold(
          body: IndexedStack(
            index: _currPage,
            children: [
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    floating: true,
                    pinned: true,
                    snap: false,
                    centerTitle: false,
                    title: const Text('Berbaring Library'),
                    actions: const [],
                    bottom: AppBar(
                      title: Container(
                        width: double.infinity,
                        height: 40,
                        color: Colors.white,
                        child: const Center(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search by Book',
                              prefixIcon: Icon(Icons.search),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // uncoment ini terus masukin view cardnya
                  SliverPadding(
                    padding: EdgeInsets.fromLTRB(29.w, 18.h, 29.w, 18.h),
                    sliver: buildGridBooks(widget.books),
                  ),
                ],
              ),
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
      ),
    );
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
              (book) => SizedBox(
                //ganti view card disini
                child: Card(
                  child: Image.network(
                    'https://25w.000webhostapp.com/uploads/' + book.fileGambar,
                    fit: BoxFit.cover,
                    // width: 162.w,
                    // height: 229.h,
                  ),
                ),
              ),
            )
            .toList(),
      );
    }
  }

  void _changePage(int index) {
    setState(
      () {
        _currPage = index;
      },
    );
  }
}
