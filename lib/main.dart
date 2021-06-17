import 'package:fgocalc_unisersal/page/servant_filter_page.dart';
import 'package:fgocalc_unisersal/page/servant_list_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'FGOcalc',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.indigo,
      ),
      home: new MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  final List<Tab> tabs = <Tab>[
    Tab(text: "搜索",),
    Tab(text: "筛选",),
    Tab(text: "设置",),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: tabs,
            indicatorColor: Colors.orangeAccent,
          ),
        ),
        body: TabBarView(children: [
          ServantListPage(),
          ServantFilterPage.origin("2", x:2),
          ServantFilterPage("3")
        ]),
      ),
    );
  }
}

