import 'package:flutter/material.dart';

class AppBarBackButton extends StatelessWidget {
  
  final Color color;

  AppBarBackButton({this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
        Icons.arrow_back,
        size: 25,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
      color: color,
    );
  }

}