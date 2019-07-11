import 'package:flutter/material.dart';
import 'package:we_chat_demo/pages/discover/discover_child_page.dart';

import '../../const.dart';
import 'friends_data.dart';
import 'index_bar.dart';

class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  //声明一个ScrollController
  ScrollController _scrollController;

  //现在数据不是太少了，我们想数据更多，我们学习一个链式语法糖
  final List<Friends> _listDatas = [];

  //把A,B,C..所处的位置计算并存起来
  final Map _groupOffsetMap = {
    //五角星 和 搜索不动，所以是0.0
    INDEX_WORDS[0]: 0.0,
    INDEX_WORDS[1]: 0.0,
  };

  @override
  //initState是当前这个State的构造方法
  void initState() {
    super.initState();
    //这就是个语法糖，..表示强制返回调用对象本身，所以这里我们把原来的数据弄了两遍进来
    _listDatas..addAll(datas)..addAll(datas);

    //对数据源进行一次排序
    _listDatas.sort((Friends a, Friends b) {
      return a.indexLetter.compareTo(b.indexLetter);
    });

    //创建字母对应offset 的map
    var _groupOffset = 54.0 * 4; //初始化
    for (int i = 0; i < _listDatas.length; i++) {
      if (i < 1) {
        //一定是头部
        _groupOffsetMap.addAll({_listDatas[i].indexLetter: _groupOffset});
        _groupOffset += 84;
      } else if (_listDatas[i] == _listDatas[i - 1]) {
        _groupOffset += 54;
      } else {
        _groupOffsetMap.addAll({_listDatas[i].indexLetter: _groupOffset});
        _groupOffset += 84;
      }
    }

    //初始化ScrollController
    _scrollController = ScrollController();
  }

  final List<Friends> _headerData = [
    Friends(
      imageUrl: 'images/新的朋友.png',
      name: '新的朋友',
    ),
    Friends(
      imageUrl: 'images/群聊.png',
      name: '群聊',
    ),
    Friends(
      imageUrl: 'images/标签.png',
      name: '标签',
    ),
    Friends(
      imageUrl: 'images/公众号.png',
      name: '公众号',
    ),
  ];

  Widget _itemForRow(BuildContext context, int index) {
    if (index < _headerData.length) {
      return _FriendsCell(
        imageAssets: _headerData[index].imageUrl,
        name: _headerData[index].name,
      );
    } else {
      //如果当前的和上一个cell的indexletter一样的话，就不显示头,不传groupTitle
      if (index > _headerData.length &&
          _listDatas[index - _headerData.length].indexLetter ==
              _listDatas[index - _headerData.length - 1].indexLetter) {
        return _FriendsCell(
          imageUrl: _listDatas[index - _headerData.length].imageUrl,
          name: _listDatas[index - _headerData.length].name,
        );
      } else {
        return _FriendsCell(
          imageUrl: _listDatas[index - _headerData.length].imageUrl,
          name: _listDatas[index - _headerData.length].name,
          groupTitle: _listDatas[index - _headerData.length].indexLetter,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text('通讯录'),
          backgroundColor: WeChatThemeColor,
          actions: <Widget>[
            //可以放多个
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(right: 10),
                child: Image(
                  image: AssetImage('images/icon_friends_add.png'),
                  width: 25,
                ),
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return DiscoverChildPage(
                    title: '添加朋友',
                  );
                }));
              },
            ),
//          GestureDetector(
//            child: Container(
//              margin: EdgeInsets.only(right: 10),
//              child: Image(image: AssetImage('images/icon_friends_add.png'), width: 25,),
//            ),
//            onTap: (){
//              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
//                return DiscoverChildPage(title: '添加朋友22',);
//              }));
//            },
//          ),
          ],
        ),
        body: Container(
          //这样使用ListView cell会重用（使用builder）
          child: Stack(
            children: <Widget>[
              ListView.builder(
                //ListView有一个属性，这个属性controller是用来控制这个ListView的，类似我们的代理
                controller: _scrollController,
                itemCount: _listDatas.length + _headerData.length,
                itemBuilder: _itemForRow,
              ),
              //Stack Positioned定义他里面的子部件的位置(Stack布局下)。悬浮控件
              //这个索引条功能很多，所以抽取出来
              //里面选中了，外部要知道，需要callback，类似block，所以此处需要一个匿名函数
              IndexBar(
                //回调函数
                indexBarCallBack: (String str) {
                  //当回调回来的时候，我们来通过这个_scrollController来控制ListView的滚动
                  if(_groupOffsetMap[str] != null){
                    double dy = _groupOffsetMap[str];
                    _scrollController.animateTo(
                        dy,
                        duration: Duration(milliseconds: 10),
                        curve: Curves.easeIn);
                  }
                },
              ),
            ],
          ),
          color: WeChatThemeColor,
        ));
  }
}

//定义一个内部类
class _FriendsCell extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String groupTitle;
  final String imageAssets;

  const _FriendsCell({
    Key key,
    this.imageUrl,
    this.name,
    this.groupTitle,
    this.imageAssets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: groupTitle != null
                ? Text(
                    groupTitle,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  )
                : null,
            height: groupTitle != null ? 30 : 0,
            width: ScreenWidth(context) - 10,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 10),
            color: WeChatThemeColor,
          ),
          GestureDetector(
            child: Container(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 34,
                    width: 34,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageAssets != null
                            ? AssetImage(imageAssets)
                            : NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Container(
//                  padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Text(
                            name,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          alignment: Alignment.centerLeft,
                          width: ScreenWidth(context) - 54,
                          height: 53.5,
                        ),
                        Container(
                          height: 0.5,
                          color: Color.fromRGBO(236, 236, 236, 1),
                          width: ScreenWidth(context) - 54,
                        )
                      ],
                    ),
                  )
                ],
              ),
              height: 54,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return DiscoverChildPage(title: name);
              }));
            },
          ),
        ],
      ),
      color: Color.fromRGBO(1, 1, 1, 0),
    );
  }
}
