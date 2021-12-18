import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pbp_flutter/bloc/borrowedbook_bloc.dart';
import 'package:pbp_flutter/ui/splashscreen.dart';

import 'bloc/availablebooks_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AvailablebooksBloc>(
          create: (BuildContext context) =>
              AvailablebooksBloc()..add(LoadAvailableBooks()),
        ),
        BlocProvider(
          create: (BuildContext context) => BorrowedbookBloc(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(411, 732),
        builder: () => MaterialApp(
          theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
          title: 'BerbaringLibrary',
          debugShowCheckedModeBanner: false,
          home: const SplashScreenPage(),
        ),
      ),
    );
  }
}
