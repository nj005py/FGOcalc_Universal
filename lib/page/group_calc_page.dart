import 'package:fgocalc_unisersal/entity/group_member.dart';
import 'package:fgocalc_unisersal/widget/check_tag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/all.dart';

// final _myListKey = GlobalKey<AnimatedListState>();
// final memberProvider = Provider<List<GroupMember>>((ref){});
final List<GroupMemberVO> _members = [];
final StateProvider<List<GroupMemberVO>> _memberProvider =
    StateProvider((ref) => []);

class GroupCalcPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    //添加编队成员
    final btnAddMember = SizedBox(
      height: 55.0,
      child: InkWell(
        onTap: () {
          if (_members.length < 3) {
            _members.add(GroupMemberVO());
            context.read(_memberProvider).state = _members;
          }
        },
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Center(
            child: Icon(
              Icons.add,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );

    //编队成员列表
    final lvMembers = ListView.builder(
      shrinkWrap: true,
      itemCount: (watch(_memberProvider).state.length + 1) < 3
          ? watch(_memberProvider).state.length + 1
          : 3,
      itemBuilder: (context, index) {
        int size = _members.length;
        if (size == index) {
          return btnAddMember;
        } else {
          return TileMember(index);
        }
      },
    );

    //overkill
    final rowOverkill = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CheckTag("overkill"),
        CheckTag("overkill"),
        CheckTag("overkill"),
        CheckTag("overkill"),
      ],
    );
    //暴击

    //已选指令卡
    final lvChosenCards = ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Stack(
          alignment: Alignment.bottomRight,
          children: [
            SizedBox(
                width: 58.0,
                height: 58.0,
                child: Image.asset("assets/quick.webp")),
            SizedBox(
              width: 29.0,
              height: 29.0,
              child: Image.asset('assets/image1.webp'),
            ),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        final width = MediaQuery.of(context).size.width;
        final x = (width - (60.0 * 4) - (15.0 * 2)) / 3;
        return Divider(indent: x,);},
    );

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
                      // _myListKey.currentState!.insertItem(0);
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
          // Expanded(child: listView),
          Wrap(children: [lvMembers]),
          //选择卡片
          Padding(
            padding: const EdgeInsets.only(left: 15.0,right: 15.0),
            child: Row(
              children: [
                Flexible(
                    flex: 4,
                    child: SizedBox(
                        width: double.infinity,
                        height: 58.0,
                        child: lvChosenCards)),
                Flexible(
                    flex: 1,
                    child: Image.asset(
                      "assets/extra.webp",
                      width: 58.0,
                      height: 58.0,
                    ))
              ],
            ),
          ),
          //overkill
          SizedBox(width:double.infinity,child: rowOverkill),
          //暴击
          //计算结果展示
        ],
      ),
    );
  }
}

class TileMember extends ConsumerWidget {
  int index = 0;

  TileMember(this.index);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final lvCards = ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return SizedBox(
              width: 58.0,
              height: 58.0,
              child: Image.asset("assets/quick.webp"));
        });

    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  _members.removeAt(index);
                  context.read(_memberProvider).state = _members;
                },
                child: Image.asset(
                  "assets/image1.webp",
                  width: 60.0,
                  height: 60.0,
                ),
              ),
              Expanded(
                child: InkWell(
                  child: Container(
                    padding: EdgeInsets.only(left: 5.0, right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("详细设置"),
                        Image.asset(
                          'assets/ic_more.webp',
                          width: 10.0,
                          height: 24.0,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          //指令卡
          SizedBox(height: 58.0, child: lvCards),
        ],
      ),
    );
  }
}
