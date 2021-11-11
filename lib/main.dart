import 'package:fgocalc_unisersal/page/group_calc_page.dart';
import 'package:fgocalc_unisersal/page/servant_filter_page.dart';
import 'package:fgocalc_unisersal/page/servant_list_page.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(ProviderScope(child:MyApp()));

class MyApp extends ConsumerWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return new MaterialApp(
      title: 'FGOcalc',
      theme: new ThemeData(
        accentColor: HexColor('#C2D5F2'),
        primarySwatch: Colors.blue,
        primaryColor: HexColor('#2B579A'),
        dividerColor: Colors.grey[400],
      ),
      home: new MainPage(),
    );
  }
}

class MainPage extends ConsumerWidget {
  final List<Tab> tabs = <Tab>[
    Tab(text: "编队",),
    Tab(text: "设置",),
  ];


  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            tabs: tabs,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey[500],
            indicatorColor: Colors.orangeAccent,
          ),
        ),
        body: TabBarView(children: [
          GroupCalcPage(),
          ServantFilterPage("3")
        ]),
      ),
    );
  }

}

