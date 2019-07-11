import 'package:flutter/material.dart';
import 'package:we_chat_demo/pages/discover/discover_cell.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}
//分析页面，右上角有个相机按钮，类似悬浮的，所以用stack来布局
class _MinePageState extends State<MinePage> {

  //抽取出来-封装
  Widget _headWidget (){
    return Container(
      color: Colors.white,
      height: 200,
      child: Container(
        margin: EdgeInsets.only(top: 100),
        padding: EdgeInsets.all(10),//里面子视图的内边距
        child: Container(
          margin: EdgeInsets.only(left: 20),
          padding: EdgeInsets.all(5),
          child: Row(
            children: <Widget>[
              GestureDetector(
                child: Container(
                  //因为decoration只是针对Container的，所以这里的Image设置就没有效果，所以我们要把image写在装饰器里面
//                  child: Image(image: AssetImage('images/Hank.png')),
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(image: AssetImage('images/Hank.png'),
                        fit: BoxFit.cover,//图片填充模式
                    ),

                  ),
                ),
                onTap: (){

                },
              ),//图像
              Expanded(child: Container(
//                width: MediaQuery.of(context).size.width-110,//屏幕宽度减去
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     Container(
                       alignment: Alignment.centerLeft,
                       margin: EdgeInsets.only(left: 10),
                       height: 35,
                       child: Text('梁炜东', style: TextStyle(fontSize: 25, color: Colors.black),),
                     ),//微信昵称
                     Container(
                       height: 35,
                       margin: EdgeInsets.only(left: 10),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: <Widget>[
                           Text('微信号：123456', style: TextStyle(fontSize: 17, color: Color.fromRGBO(50, 50, 50, 1.0)),),
                           Image(image: AssetImage('images/icon_right.png'), height: 15,),
                         ],
                       ),
                     ),//微信账号+图标
                   ],
                 ),
               ),),
              //右边部分
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            color: Color.fromRGBO(223, 223, 223, 1.0),
            //去掉listview默认的头部的间距
            child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView(
                  children: <Widget>[
                    _headWidget(), //头部
                    SizedBox(height: 10),
                    DiscoverCell(title: '支付', imageName: 'images/微信 支付.png',),
                    SizedBox(height: 10),
                    DiscoverCell(title: '收藏', imageName: 'images/微信收藏.png',),
                    Container(child: Row(
                      children: <Widget>[
                        Container(color: Colors.white, width: 50,height: 0.5,),
                        Container(color: Colors.grey, height: 0.5,),
                      ],
                    ),),
                    DiscoverCell(title: '相册', imageName: 'images/微信相册.png',),
                    Container(child: Row(
                      children: <Widget>[
                        Container(color: Colors.white, width: 50,height: 0.5,),
                        Container(color: Colors.grey, height: 0.5,),
                      ],
                    ),),
                    DiscoverCell(title: '卡包', imageName: 'images/微信卡包.png',),
                    Container(child: Row(
                      children: <Widget>[
                        Container(color: Colors.white, width: 50,height: 0.5,),
                        Container(color: Colors.grey, height: 0.5,),
                      ],
                    ),),
                    DiscoverCell(title: '表情', imageName: 'images/微信表情.png',),
                    SizedBox(height: 10),
                    DiscoverCell(title: '设置', imageName: 'images/微信设置.png',),
                  ],
                ),)
          ),//列表
          Container(
            margin: EdgeInsets.only(top: 44, right: 10),
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  child: Image(image: AssetImage('images/相机.png')),
                  onTap: (){
                    print('点击了相机按钮');
                  },
                )
              ],
            ),
          ),//相机
        ],
      ),
    );
  }
}