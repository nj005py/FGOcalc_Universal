import 'package:flutter/material.dart';

class SvtList extends StatefulWidget{
  @override
  _svtList createState() => new _svtList();
}

class _svtList extends State<SvtList>{

  @override
  Widget build(BuildContext context) {
    return new GridView.count(
//        primary: false,
        padding: const EdgeInsets.all(2.0),
        mainAxisSpacing: 2.0,//竖向间距
        crossAxisCount: 4,//横向Item的个数
        crossAxisSpacing: 2.0,//横向间距
        children: buildGridTileList(233));
  }

  List<Widget> buildGridTileList(int number) {
    List<Widget> widgetList = new List();
    for (int i = 0; i < number; i++) {
      widgetList.add(getItemWidget(i));
    }
    return widgetList;
  }
  Widget getItemWidget(int i) {
    i ++;
    return new Image.asset(
        'assets/image$i.webp'
    );
  }
}