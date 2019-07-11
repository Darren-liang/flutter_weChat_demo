import 'package:flutter/material.dart';

class DiscoverChildPage extends StatefulWidget {
  //对外暴露的属性
  final String title;

  const DiscoverChildPage({Key key, this.title}) : super(key: key);

  @override
  _DiscoverChildPageState createState() => _DiscoverChildPageState();
}

class _DiscoverChildPageState extends State<DiscoverChildPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),//通过'widget.'拿到属性值
      ),
      body: Center(
        child: Text(widget.title),
      ),
    );
  }
}
