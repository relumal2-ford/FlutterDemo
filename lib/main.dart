// Flutter code sample for Card
//
// This sample shows creation of a [Card] widget that shows album information
// and two actions.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CustomerConsentScreen.dart';

void main() {
  runApp(MyApp());
}

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home:  Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const CustomerConsentScreen(),
      ),
    );
  }
}
