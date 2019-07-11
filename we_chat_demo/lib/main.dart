import 'package:flutter/material.dart';

import 'package:we_chat_demo/pages/root_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',//这个是针对安卓的
      theme: ThemeData(
        primarySwatch: Colors.grey,
        highlightColor: Color.fromRGBO(1, 0, 0, 0),//去掉高亮颜色
        splashColor: Color.fromRGBO(1, 0, 0, 0),//去掉水波纹

      ),
      home: RootPage(),
    );
  }
}


