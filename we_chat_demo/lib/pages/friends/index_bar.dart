import 'package:flutter/material.dart';

import '../../const.dart';

class IndexBar extends StatefulWidget {
  //定义对外暴露的callback
  final void Function(String str) indexBarCallBack;

  const IndexBar({
    Key key,
    this.indexBarCallBack,
  }) : super(key: key);

  @override
  _IndexBarState createState() => _IndexBarState();
}

int getIndex(BuildContext context, Offset globalPosition) {
  //          print(details.globalPosition);
  RenderBox box = context.findRenderObject();
  //拿到当前的这个offet相对于我这个索引视图的位置
  double y = box.globalToLocal(globalPosition).dy;
  //          print(y);
  var itemHeight = ScreenHeight(context) / 2 / INDEX_WORDS.length;
  int index = y ~/ itemHeight; //～表示取整
//  if(index < 0 || index >= INDEX_WORDS.length) {
//   return null;
//  }
  //设置index的最大最小值
  index =
      index.clamp(0, INDEX_WORDS.length - 1); //最小值0，最大值INDEX_WORDS.length - 1
//  return INDEX_WORDS[index];
  return index;
}


class _IndexBarState extends State<IndexBar> {
  var _selectorIndex = -1;

  Color _bkColor = Color.fromRGBO(1, 1, 1, 0);
  Color _textColor = Colors.black;

  double _indicatorY = 0.0;
  String _indicatorText = 'A';
  bool _indicatorHidden = true;

  @override
  Widget build(BuildContext context) {
    List<Widget> indexWords = [];
    for (int i = 0; i < INDEX_WORDS.length; i++) {
      indexWords.add(Text(
        INDEX_WORDS[i],
        style: TextStyle(fontSize: 12.5, color: _textColor),
      ));
    }

    return Positioned(
      right: 0,
      top: ScreenHeight(context) / 8,
//                bottom: 50,
      height: ScreenHeight(context)/2,
      width: 100,

      child: Row(
        children: <Widget>[
          Container(
            alignment: Alignment(0, _indicatorY),
            width: 80,
            child: _indicatorHidden == true ? null : Stack(
              alignment: Alignment(-0.2, 0),
              children: <Widget>[
                Image(image: AssetImage('images/气泡.png'),width: 50,),
                Text(_indicatorText, style: TextStyle(fontSize: 35, color: Colors.white),)
              ],
            ),
          ),
          GestureDetector(
            child: Container(
                  child: Column(
                    children: indexWords,
                  ),
                  color: _bkColor,
            ),
            onVerticalDragDown: (DragDownDetails details) {
              int index = getIndex(context, details.globalPosition);
              if(index != _selectorIndex) {
                _selectorIndex = index;
                widget.indexBarCallBack(INDEX_WORDS[_selectorIndex]);
              }

              //内部气泡显示
              _indicatorText = INDEX_WORDS[index];
              _indicatorY = 2.2 / INDEX_WORDS.length * index - 1.1;
              _indicatorHidden = false;

              setState(() {
                _bkColor = Color.fromRGBO(1, 1, 1, 0.5);
                _textColor = Colors.white;
              });
            },
            onVerticalDragEnd: (DragEndDetails details) {
              _bkColor = Color.fromRGBO(1, 1, 1, 0);
              _textColor = Colors.black;
              _selectorIndex = -1;
              _indicatorHidden = true;
              setState(() {});
            },
            onVerticalDragUpdate: (DragUpdateDetails details) {
              int index = getIndex(context, details.globalPosition);
              //触发回调
              if(index != _selectorIndex) {
                _selectorIndex = index;
                setState(() {});
                widget.indexBarCallBack(INDEX_WORDS[_selectorIndex]);
              }

              //内部气泡显示
              _indicatorText = INDEX_WORDS[index];
              _indicatorY = 2.2 / INDEX_WORDS.length * index - 1.1;
              _indicatorHidden = false;
              setState(() {});
            },
          )
        ],
      ),
    );
  }
}

const INDEX_WORDS = [
  '🔍',
  '⭐️',
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];
