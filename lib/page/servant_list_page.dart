import 'package:fgocalc_unisersal/page/sample_animatedlist.dart';
import 'package:fgocalc_unisersal/widget/clearable_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ServantListPage extends StatelessWidget {
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: ClearableTexfield(
                controller: _controller,
                hintText: "输入从者名称或昵称搜索"),
            padding: EdgeInsets.all(10.0),
          ),
          Expanded(child: ServantList())
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: "输入从者名称或昵称搜索",
        suffixIcon: IconButton(
          onPressed: () => _controller.clear(),
          icon: Icon(Icons.clear),
        ),
        contentPadding: EdgeInsets.all(10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          // borderSide: BorderSide(
          //   color: Colors.white,
          //   width: 3.0,
          //   style: BorderStyle.solid
          // )
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}

class ServantList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
//        primary: false,
        padding: const EdgeInsets.all(2.0),
        //竖向间距
        mainAxisSpacing: 2.0,
        //横向Item的个数
        crossAxisCount: 5,
        //横向间距
        crossAxisSpacing: 1.0,
        children: _buildGridTile(50));
  }

  List<Widget> _buildGridTile(int number) {
    List<Widget> widgetList = [];
    for (int i = 0; i < number; i++) {
      widgetList.add(_buildAvatar(i));
    }
    return widgetList;
  }

  Widget _buildAvatar(int i) {
    i++;
    // return new Image.asset(
    //     'assets/image$i.webp'
    // );
    return Image.asset('assets/image$i.webp');
  }
}

// class _svtList extends State<ServantListPage>{
//
//   @override
//   Widget build(BuildContext context) {
//     return new GridView.count(
// //        primary: false,
//         padding: const EdgeInsets.all(2.0),
//         mainAxisSpacing: 2.0,//竖向间距
//         crossAxisCount: 4,//横向Item的个数
//         crossAxisSpacing: 2.0,//横向间距
//         children: buildGridTileList(233));
//   }
//
//   List<Widget> buildGridTileList(int number) {
//     List<Widget> widgetList = [];
//     for (int i = 0; i < number; i++) {
//       widgetList.add(getItemWidget(i));
//     }
//     return widgetList;
//   }
//   Widget getItemWidget(int i) {
//     i ++;
//     return new Image.asset(
//         'assets/image$i.webp'
//     );
//   }
// }
