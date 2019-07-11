import 'package:flutter/material.dart';

import '../../const.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  Widget _itemForRowCell(BuildContext context, int index){
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            height: 58,
            width: 58,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/Hank.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
          ),//图像
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 77.5,
                  width: ScreenWidth(context) - 78,
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 40,
//                              color: Colors.orange,
                              child: Text('Flutter学习', style: TextStyle(fontSize: 17, color: Colors.black),),
                              alignment: Alignment.bottomLeft,
                            ),
                            Container(
                              height: 37.5,
//                              color: Colors.red,
                              child: Text('Flutter跨平台，形成渲染闭环，性能好', style: TextStyle(fontSize: 13, color: Color.fromRGBO(128, 128, 128, 1)),),
                              alignment: Alignment.center,
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ),
                      Expanded(child: Container(
//                        color: Colors.yellow,
                      )),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Text('星期四', style: TextStyle(fontSize: 12, color: WeChatThemeColor),),
                      ),
                    ],
                  ),
                ),//上面部分
                Container(
                  color: WeChatThemeColor,
                  height: 0.5,
                  width: ScreenWidth(context) - 78,
                ),//线
              ],
            ),
          ),//其他部分
        ],
      ),
      height: 78,
      color: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('微信'),
        backgroundColor: WeChatThemeColor,
      ),
      body: ListView.builder(
          itemCount: 100000,
          itemBuilder: _itemForRowCell,
      ),
      backgroundColor: WeChatThemeColor,
    );
  }
}
