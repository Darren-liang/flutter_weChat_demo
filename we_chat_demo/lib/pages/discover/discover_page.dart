import 'package:flutter/material.dart';

import 'discover_cell.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {

    Color _themeColor = Color.fromRGBO(223, 223, 223, 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _themeColor,
        title: new Text('发现', style: TextStyle(color: Colors.black),),
        elevation: 0.0,//阴影线去掉
      ),
      body: ListView(
        children: <Widget>[
          DiscoverCell(imageName : 'images/朋友圈.png', title: '朋友圈',),
          SizedBox(height: 10,),
          DiscoverCell(imageName : 'images/扫一扫2.png', title: '扫一扫',),
          Row(
            children: <Widget>[
              Container(color: Colors.white, height: 0.5, width: 50,),
              Container(color: Colors.grey, height: 0.5,),
            ],
          ),//线，左边白色 右边灰色
          DiscoverCell(imageName : 'images/摇一摇.png', title: '摇一摇',),
          SizedBox(height: 10,),
          DiscoverCell(imageName : 'images/看一看icon.png', title: '看一看',),
          Row(
            children: <Widget>[
              Container(color: Colors.white, height: 0.5, width: 50,),
              Container(color: Colors.grey, height: 0.5,),
            ],
          ),//线，左边白色 右边灰色
          DiscoverCell(imageName : 'images/搜一搜.png', title: '搜一搜',),
          Row(
            children: <Widget>[
              Container(color: Colors.white, height: 0.5, width: 50,),
              Container(color: Colors.grey, height: 0.5,),
            ],
          ),//线，左边白色 右边灰色
          DiscoverCell(imageName : 'images/购物.png', title: '购物', subTitle: '618限时特惠',subImageName: 'images/badge.png',),
        ],
      ),
      backgroundColor: _themeColor,
    );
  }
}
