// import 'package:EnQ/const/style.dart';
// import 'package:flutter/material.dart';

// class Item {
//   final IconData icon;
//   final String title;
//   Item({this.icon, this.title});
// }

// class BottomNavigation extends StatefulWidget {
//   Function(int) indexCallBack;
//   BottomNavigation({this.indexCallBack});

//   @override
//   _BottomNavigation createState() => _BottomNavigation();
// }

// class _BottomNavigation extends State<BottomNavigation> {
//   List<Item> items = [
//     Item(icon: Icons.home, title: 'Home'),
//     Item(icon: Icons.equalizer, title: 'Leader'),
//     Item(icon: Icons.view_list, title: 'Quiz'),
//     Item(icon: Icons.history, title: 'History'),
//     Item(icon: Icons.account_circle, title: 'Profile'),
//   ];
//   int _selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: items.length,
//         itemBuilder: (context, index) => buildButton(index),
//       ),
//     );
//   }

//   Widget buildButton(int index) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           _selectedIndex = index;
//           widget.indexCallBack(_selectedIndex);
//         });
//       },
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: DefaultPaddin / 1.2),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Icon(
//               items[index].icon,
//               color: _selectedIndex == index ? Colors.yellow : Colors.black,
//             ),
//             Text(
//               items[index].title,
//               style: TextStyle(
//                 color: _selectedIndex == index ? Colors.yellow : Colors.black,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
