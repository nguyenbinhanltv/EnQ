import 'package:EnQ/const/size_config.dart';
import 'package:EnQ/pages/profile.dart';
import 'package:EnQ/services/auth_service.dart';
import 'package:EnQ/utils/app_route.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (_selectedIndex) {
        case 1:
          Navigator.of(context).pushNamed(AppRouting.leaderBoard);
          break;
        case 2:
          Navigator.of(context).pushNamed(AppRouting.quiz);
          break;
        case 4:
          Navigator.of(context).pushNamed(AppRouting.profile);
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    AuthService auth = new AuthService();

    return Scaffold(
      body: Center(
        child: Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          color: Colors.amber,
          child: FlatButton(
              onPressed: () => auth.handleSignOut().whenComplete(() =>
                  Navigator.of(context).popAndPushNamed(AppRouting.login)),
              child: Text('Sign Out')),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.equalizer),
            title: Text('Leader'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            title: Text('Quiz'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text('History'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.black,
        selectedFontSize: 12,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
