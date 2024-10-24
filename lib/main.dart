import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';
// import 'bloc.dart';
import 'deep_link_cubit.dart';
import 'poc.dart';
import 'screen_one.dart';
import 'screen_two.dart';

void main() => runApp(PocApp());

class PocApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // DeepLinkBloc _bloc = DeepLinkBloc();
    return BlocProvider(
     create: (context) => AppLinkCubit(), // Provide the AppLinkCubit
      child: MaterialApp(
        title: 'Flutter and Deep Links PoC',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            bodySmall: TextStyle(
              fontWeight: FontWeight.w300,
              color: Colors.blue,
              fontSize: 25.0,
            ),
          ),
        ),
        home: PocWidget(),
        routes: {
          '/one': (context) => ScreenOne(),
          '/two': (context) => ScreenTwo(),
        },
      ),
    );
  }
}
