import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: Center(
        child: Text('Welcome to the Home Screen'),
      ),
    );
  }
}

class ScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen One')),
      body: Center(
        child: Text('You are on Screen One'),
      ),
    );
  }
}

class ScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen Two')),
      body: Center(
        child: Text('You are on Screen Two'),
      ),
    );
  }
}
