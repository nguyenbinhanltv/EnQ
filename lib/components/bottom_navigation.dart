import 'package:EnQ/const/style.dart';
import 'package:flutter/material.dart';

class Item {
  final IconData icon;
  final String title;
  Item({this.icon, this.title});
}

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigation createState() => _BottomNavigation();
}

class _BottomNavigation extends State<BottomNavigation> {
  List<Item> items = [
    Item(icon: Icons.home, title: "Home"),
    Item(icon: Icons.equalizer, title: 'Leader'),
    Item(icon: Icons.view_list, title: 'Quiz'),
    Item(icon: Icons.history, title: 'History'),
    Item(icon: Icons.account_circle, title: 'Profile'),
  ];
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;

    return Padding(
      padding: const EdgeInsets.only(top: DefaultPaddin * 20),
      child: SizedBox(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) => buildButton(index),
        ),
      ),
    );
  }

  Widget buildButton(int index) {
    return FlatButton(
      onPressed: () {},
      child: Column(
        children: [
          Icon(items[index].icon),
          Text(items[index].title),
        ],
      ),
    );
  }
}
