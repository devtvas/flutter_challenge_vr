// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  Color? color;
  Function() onTap;
  IconData? iconData;
  Color? iconColor;

  IconButtonWidget({
    Key? key,
    this.color,
    required this.onTap,
    this.iconData,
    this.iconColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black),
            color: color ?? Theme.of(context).primaryColor),
        child: Icon(
          iconData,
          color: iconColor ?? Colors.black,
        ),
      ),
    );
  }
}
