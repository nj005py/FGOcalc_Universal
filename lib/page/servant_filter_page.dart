import 'package:flutter/material.dart';

class ServantFilterPage extends StatelessWidget{
  String text;
  num x = 0;
  ServantFilterPage(this.text);


  ServantFilterPage.origin(this.text, {num x = 0}){
    this.x = x;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child:Text("$text")
    );
  }


}