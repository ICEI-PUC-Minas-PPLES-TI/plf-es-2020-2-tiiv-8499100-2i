import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final Widget title;
  final Color backgroundColor;
  final EdgeInsets margin;
  final Function onPressed;
  final double height;

  CustomButtonWidget({
    @required this.title,
    @required this.backgroundColor,
    @required this.onPressed,
    @required this.height,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      margin: this.margin,
      child: FlatButton(
        onPressed: onPressed,
        color: this.backgroundColor,
        child: this.title,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
