import 'package:flutter/material.dart';

import 'package:we_chat_demo/pages/chat/chat_page.dart';
import 'package:we_chat_demo/pages/discover/discover_page.dart';
import 'package:we_chat_demo/pages/friends/friends_page.dart';
import 'package:we_chat_demo/pages/mine/mine_page.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _currentIndex = 0;

//  List<Widget> pages = [
//    Scaffold(
//      appBar: AppBar(
//        title: new Text('微信'),
//      ),
//      body: Center(
//        child: Text(
//          '我是微信啊！兄弟',
//          style: TextStyle(fontSize: 26, color: Colors.blue),
//        ),
//      ),
//      backgroundColor: Colors.yellow,
//    ),
//    Scaffold(
//      appBar: AppBar(
//        title: new Text('通讯录'),
//      ),
//      body: Text(
//        '我是通讯录啊！兄弟',
//        style: TextStyle(fontSize: 26, color: Colors.blue),
//      ),
//      backgroundColor: Colors.red,
//    ),
//    Scaffold(
//      appBar: AppBar(
//        title: new Text('发现'),
//      ),
//      body: Text(
//        '我是发现啊！兄弟',
//        style: TextStyle(fontSize: 26, color: Colors.blue),
//      ),
//      backgroundColor: Colors.pink,
//    ),
//    Scaffold(
//      appBar: AppBar(
//        title: new Text('我的'),
//      ),
//      body: Text(
//        '我是我的啊！兄弟',
//        style: TextStyle(fontSize: 26, color: Colors.blue),
//      ),
//      backgroundColor: Colors.cyanAccent,
//    ),
//  ];
  //咱们为了封装，所以每个页面都定义了一个文件。所以上面改为如下：

  List<Widget> pages = [ChatPage(), FriendsPage(), DiscoverPage(), MinePage()];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              //这里我们就不用icon了用image
              //怎么加载本工程图片
              //正常图片 不设置宽高的话，图片会显示自己本身大小
              icon: Image(image: AssetImage('images/tabbar_chat.png'), height: 20, width: 20,),
              //高亮图片
              activeIcon: Image(image: AssetImage('images/tabbar_chat_hl.png'), height: 20, width: 20,),
              title: Text('微信'),
            ),
            BottomNavigationBarItem(
              //正常图片 不设置宽高的话，图片会显示自己本身大小
              icon: Image(image: AssetImage('images/tabbar_friends.png'), height: 20, width: 20,),
              //高亮图片
              activeIcon: Image(image: AssetImage('images/tabbar_friends_hl.png'), height: 20, width: 20,),
              title: Text('通讯录'),
            ),
            BottomNavigationBarItem(
              //正常图片 不设置宽高的话，图片会显示自己本身大小
              icon: Image(image: AssetImage('images/tabbar_discover.png'), height: 20, width: 20,),
              //高亮图片
              activeIcon: Image(image: AssetImage('images/tabbar_discover_hl.png'), height: 20, width: 20,),
              title: Text('发现'),
            ),
            BottomNavigationBarItem(
              //正常图片 不设置宽高的话，图片会显示自己本身大小
              icon: Image(image: AssetImage('images/tabbar_mine.png'), height: 20, width: 20,),
              //高亮图片
              activeIcon: Image(image: AssetImage('images/tabbar_mine_hl.png'), height: 20, width: 20,),
              title: Text('我'),
            ),
          ],
          type: BottomNavigationBarType.fixed,
          //风格类型
          fixedColor: Colors.green,
          //选中颜色
          currentIndex: _currentIndex,
          //第几个选中 高亮
          onTap: (int index) {
            _currentIndex = index;
            setState(() {});
          },
          selectedFontSize: 12.0,//固定一下选中之后文字的大小，默认选中变大
        ),
      ),
    );
  }
}
