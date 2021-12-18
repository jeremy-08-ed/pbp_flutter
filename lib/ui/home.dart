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
        theme: ThemeData(primarySwatch: Colors.blue),
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
                    title: Center(
                      child: const Text('Berbaring Library'),
                    ),
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
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    floating: true,
                    pinned: true,
                    snap: false,
                    centerTitle: false,
                    title: Center(
                      child: const Text('Berbaring Library'),
                    ),
                    actions: const [],
                    bottom: AppBar(
                      title: Container(
                        width: double.infinity,
                        height: 40,
                        color: Colors.white,
                        child: const Center(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search by NIM',
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
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Row(
                            children: [
                              SizedBox(

                                height: 229,
                                width: 162,
                                child: Card(
                                  child: Image.asset(
                                    'lib/images/mantappu.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 14),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Judul'),
                                      Text(
                                          'Mantappu Jiwa (ini testing panjangnya)'),
                                      Text('Author'),
                                      Text('Jessica Jane'),
                                      Text('Tanggal Pinjam'),
                                      Text('01-01-2001'),
                                      Text('Tanggal Kembali'),
                                      Text('01-01-2021'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Row 2
                          Row(
                            children: [
                              SizedBox(
                                height: 229,
                                width: 162,
                                child: Card(
                                  child: Image.asset(
                                    'lib/images/nkcthi.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                // padding:
                                //     const EdgeInsets.fromLTRB(14, 0, 0, 0),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 14),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Judul'),
                                      Text(
                                          'Nanti Kita Cerita Tentang Hari Ini'),
                                      Text('Author'),
                                      Text('Raditya Dika'),
                                      Text('Tanggal Pinjam'),
                                      Text('01-01-2001'),
                                      Text('Tanggal Kembali'),
                                      Text('01-01-2021'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
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

  // Widget Search By Books
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
                // height: 20,
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

  // Widget Search By NIM
  // Widget gridBooksNIM(){
  //   return ;
  // }

  void _changePage(int index) {
    setState(
      () {
        _currPage = index;
      },
    );
  }
}
