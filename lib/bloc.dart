// import 'dart:async';
// import 'package:flutter/services.dart';

// abstract class Bloc {
//   void dispose();
// }

// class DeepLinkBloc extends Bloc {
//   // Event Channel creation
//   static const stream = const EventChannel('poc.deeplink.flutter.dev/events');

//   // Method channel creation
//   static const platform = const MethodChannel('poc.deeplink.flutter.dev/channel');

//   StreamController<String> _stateController = StreamController();

//   Stream<String> get state => _stateController.stream;

//   Sink<String> get stateSink => _stateController.sink;

//   // Updated DeepLinkBloc constructor
//   DeepLinkBloc() {
//     // Checking application start by deep link
//     startUri().then(_onRedirected);

//     // Checking broadcast stream, if deep link was clicked in opened application
//     stream.receiveBroadcastStream().listen((d) => _onRedirected(d));

//     // Listening for screen navigation from native side via MethodChannel
//     platform.setMethodCallHandler((call) async {
//       if (call.method == "navigateTo") {
//         // Handle navigation based on the screen passed from Kotlin
//         String? screen = call.arguments;
//         _onRedirected(screen);
//       }
//     });
//   }

//   void _onRedirected(String? screen) {
//     // Here can be any URI analysis, checking tokens, etc.
//     if (screen != null) {
//       if (screen == 'one') {
//         stateSink.add('ScreenOne');
//       } else if (screen == 'two') {
//         stateSink.add('ScreenTwo');
//       } else {
//         stateSink.add('Home'); // Fallback to Home if screen is invalid
//       }
//     }
//   }

//   @override
//   void dispose() {
//     _stateController.close();
//   }

//   Future<String?> startUri() async {
//     try {
//       return platform.invokeMethod('initialLink');
//     } on PlatformException catch (e) {
//       return "Failed to Invoke: '${e.message}'.";
//     }
//   }
// }
