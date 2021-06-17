import 'package:flutter/material.dart';

class ClearableTexfield extends StatefulWidget {
  ClearableTexfield({
    Key? key,
    required this.controller,
    this.hintText = 'Enter text'
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;

  @override
  State<StatefulWidget> createState() {
    return _ClearableTextfieldState();
  }
}

class _ClearableTextfieldState extends State<ClearableTexfield> {
  bool _showClearButton = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        _showClearButton = widget.controller.text.length > 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: _getClearButton(),
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

  Widget? _getClearButton() {
    if (!_showClearButton) {
      return null;
    }

    return IconButton(
      onPressed: () => widget.controller.clear(),
      icon: Icon(Icons.clear),
    );
  }
}