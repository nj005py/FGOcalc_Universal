import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckTag extends StatefulWidget{
  bool value = true;
  String title = "item";
  final ValueChanged<bool?>? onChanged;

  CheckTag({required this.value,required this.title, this.onChanged});

  @override
  _CheckTagState createState() => _CheckTagState();
}

class _CheckTagState extends State<CheckTag>{
  @override
  void initState() {
    super.initState();
  }

  void _handleTap(){
    setState(() {
      widget.onChanged!(!widget.value);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: GestureDetector(
        onTap: _handleTap,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(shape: BoxShape.rectangle, color: widget.value ? Theme.of(context).accentColor : Colors.transparent),
          child: Text('${widget.title}'),
        ),
      ),
    );
  }


}