import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  Function onPressed;
  BottomBar({
    @required this.onPressed,
    @required this.bottomIcons,
    @required this.text,
    @required this.icons,
  });
  bool bottomIcons;
  String text;
  IconData icons;
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: widget.bottomIcons == true
          ? Container(
              decoration: BoxDecoration(
                color: Colors.indigo.shade100.withOpacity(0.6),
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 8,
                bottom: 8,
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    widget.icons,
                    color: Colors.indigo,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    widget.text,
                    style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          : Icon(widget.icons),
    );
  }
}
