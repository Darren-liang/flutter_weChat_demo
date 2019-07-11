import 'package:flutter/material.dart';

import 'discover_child_page.dart';

class DiscoverCell extends StatefulWidget {
  @override
  _DiscoverCellState createState() => _DiscoverCellState();

  final String title;
  final String subTitle;
  final String imageName;
  final String subImageName;

  //构造函数
//  DiscoverCell(String title, String subTitle, ){
//    this.title = title;
//  }
  //但是这些参数都是可选的，所以咱们按照下面这样写.
  const DiscoverCell({
    //@required必传参数
    Key key,
    @required this.title,
    this.subTitle,
    @required this.imageName,
    this.subImageName
  }) : assert(title != null, 'title不能为空'),
        assert(imageName != null, 'imageName不能为空');
//下断言
}

class _DiscoverCellState extends State<DiscoverCell> {
  Color _currentColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    //cell可以被点击，使用手势
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(10),//边距
        color: _currentColor,
        height: 54,
        //根据学习的布局，这里row colunm stack我们应该选择row
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,//下面两个Container左边的靠左，右边的靠右
          //我们用两个横向布局来做这些子控件
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Image(image: AssetImage(widget.imageName), width: 20,),
                  SizedBox(width: 15,),//两个控件之间间距
                  Text(widget.title),
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Text(widget.subTitle != null ? widget.subTitle : '', style: TextStyle(color: Colors.grey, fontSize: 12),),
//                //不能先创建在判断，浪费性能
                  widget.subImageName != null
                      ? Container(child: Image(image: AssetImage(widget.subImageName),height: 10,), margin: EdgeInsets.only(left: 10, right: 10),)
                      : Container(),
                  Image(image: AssetImage('images/icon_right.png'), width: 15,),
                ],
              ),

            ),
          ],

        ),
      ),
      onTap: (){
        print('cell被点击了,练习点击cell跳转');
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context){
              return DiscoverChildPage(title: widget.title);
            })
        );
        setState(() {
          _currentColor = Colors.white;
        });
      },
      onTapDown: (TapDownDetails details){
        setState(() {
          _currentColor = Color.fromRGBO(230, 230, 230, 1.0);
        });
      },
      onTapCancel: (){
        //取消点击
        setState(() {
          _currentColor = Colors.white;
        });
      },
    );
  }
}

