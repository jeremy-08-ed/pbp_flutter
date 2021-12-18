import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbp_flutter/bloc/availablebooks_bloc.dart';
import 'package:pbp_flutter/ui/home.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  late AvailablebooksBloc availablebooksBloc;

  @override
  void initState() {
    super.initState();

    availablebooksBloc = BlocProvider.of<AvailablebooksBloc>(context);

    availablebooksBloc.add(LoadAvailableBooks());

    // StartSplashScreen();
  }

  //deprecated bruh stop slowing user by 3s
  // StartSplashScreen() async {
  //   var duration = const Duration(milliseconds: 3000);
  //   return Timer(duration, () {
  //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
  //       return const Home();
  //     }));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height;
    return BlocListener<AvailablebooksBloc, AvailablebooksState>(
      listener: (context, state) {
        if (state is AvailableBooksLoaded) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
            return Home(
              books: [...state.books],
            );
          }));
        } else if (state is AvailableBooksError) {
          final snackBar = SnackBar(content: Text(state.error));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF409CA6),
        body: Container(
          height: screenheight,
          width: screenwidth,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/images/Splashscreen.png'),
            ),
          ),
        ),
      ),
    );
  }
}
