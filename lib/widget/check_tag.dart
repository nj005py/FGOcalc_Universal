import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckTag extends StatefulWidget{
  bool _value = true;
  String title = "item";

  CheckTag(this.title);

  @override
  _CheckTagState createState() => _CheckTagState();
}

class _CheckTagState extends State<CheckTag>{

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(shape: BoxShape.rectangle, color: widget._value ? Theme.of(context).accentColor : Colors.grey),
        child: Text('${widget.title}'),
      ),
    );
  }

}