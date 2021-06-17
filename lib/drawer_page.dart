import 'package:flutter/material.dart';

class DrawerBuilder {
  static Widget drawerBuilder() {
    return new ListView(padding: const EdgeInsets.only(), children: <Widget>[
      _drawerHeader(),
      new AboutListTile(
        icon: new CircleAvatar(child: new Text("关于")),
        child: new Text("关于"),
        applicationName: "Test",
        applicationVersion: "1.0",
        applicationLegalese: "applicationLegalese",
        aboutBoxChildren: <Widget>[
          new Text("BoxChildren"),
          new Text("xxxxxx")
        ],
      ),

      new ClipRect(
        child: new ListTile(
          leading: new CircleAvatar(child: new Text("反馈")),
          title: new Text('反馈'),
          onTap: () => {},
        ),
      ),

      new ListTile(
        leading: new CircleAvatar(child: new Text("分享")),
        title: new Text('分享'),
        subtitle: new Text("分享"),
        onTap: () => {},
      ),

    ]);
  }

  static Widget _drawerHeader() {
    return Center(
      child: new UserAccountsDrawerHeader(
//      margin: EdgeInsets.zero,
        accountName: new Text(
          "FGOcalc Flutter",
        ),
        accountEmail: Text("ddd@hotmail.com"),
        currentAccountPicture: new CircleAvatar(
          backgroundImage: new AssetImage("assets/logo_guda.png"),
        ),
      ),
    );
  }
}
