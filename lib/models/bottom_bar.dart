import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget{
  Function onPressed;
  BottomBar({@required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                    onTap: () {
                      setState(() {
                        bottomIcons = BottomIcons.Home;
                      });
                    },
                    child: bottomIcons == BottomIcons.Home
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
                                  EvaIcons.home,
                                  color: Colors.indigo,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Home",
                                  style: TextStyle(
                                      color: Colors.indigo,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        : Icon(EvaIcons.home),
                  ),
   
}