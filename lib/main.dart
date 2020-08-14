import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:highlight_stories/main/common.dart';

import 'main/stories.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Common.setHandler();
    return MaterialApp(
        title: 'Highlight Stories',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Stories());
  }
}
