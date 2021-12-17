import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currPage=0;

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(411, 732),
      builder: () => MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                pinned: true,
                snap: false,
                centerTitle: false,
                title: Text('Berbaring Library'),
                actions: [],
                bottom: AppBar(
                  title: Container(
                    width: double.infinity,
                    height: 40,
                    color: Colors.white,
                    child: Center(
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
              // Other Sliver Widgets
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    height: 400,
                    child: Center(
                      child: Text(
                        'Tes',
                      ),
                    ),
                  ),
                  Container(
                    height: 1000,
                    color: Colors.grey,
                  ),
                ]),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home), //icon sementara
                label: "Search by Book"
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.hourglass_full),
                label: "Search by NIM"
              ),
            ],
            currentIndex: _currPage,
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            onTap: _changePage,
          )
        ),
      )
    );
  }

  void _changePage(int index){
    setState(() {
      _currPage = index;
    });
  }
}
