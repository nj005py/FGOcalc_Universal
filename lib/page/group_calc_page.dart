import 'package:fgocalc_unisersal/entity/GroupMember.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';


final _myListKey = GlobalKey<AnimatedListState>();
final memberProvider = Provider<List<GroupMember>>((ref){});
class GroupCalcPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //按钮
          Container(
            color: Theme.of(context).primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {
                      _myListKey.currentState!.insertItem(0);
                    },
                    style: ButtonStyle(),
                    child: Text('计算', style: TextStyle(color: Colors.white)),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TextButton(
                      onPressed: () {},
                      child:
                          Text('清理结果', style: TextStyle(color: Colors.white))),
                ),
              ],
            ),
          ),
          //设置敌方
          Material(
            color: Colors.white,
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 40.0,
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "设置敌方",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                    Image.asset(
                      'assets/ic_more.webp',
                      width: 10.0,
                      height: 24.0,
                    )
                  ],
                ),
              ),
            ),
          ),
          Divider(
            height: 1,
          ),
          //添加编队成员
          ListView.builder(itemBuilder: (context, index) => ,)
          //overkill
          //暴击
          //计算结果提示
          //计算结果展示
        ],
      ),
    );
  }
}
