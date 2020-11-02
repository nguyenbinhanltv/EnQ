import 'package:EnQ/const/size_config.dart';
import 'package:EnQ/const/style.dart';
import 'package:EnQ/pages/profile.dart';
import 'package:EnQ/services/auth_service.dart';
import 'package:EnQ/utils/app_route.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:EnQ/services/user_service.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        case 3:
          Navigator.of(context).pushNamed(AppRouting.profile);
          break;
        default:
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserService().getUsers().then((value) => print(value.body));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    AuthService auth = new AuthService();
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Hello, Akita",
                          style: TitleStyle,
                        ),
                        CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage('assets/images/baby_lion.jpg'),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: DefaultPaddin * 1.6),
                              child: Text(
                                "Popular",
                                style: TextStyle(
                                    fontSize: 22.5, fontFamily: FontName),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 200,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              popularCard(
                                  'assets/images/undraw_book_lover_mkck.png'),
                              popularCard(
                                  'assets/images/undraw_book_reading_kx9s.png'),
                              popularCard(
                                  'assets/images/undraw_Reading_book_re_kqpk.png'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.barChartOutline),
            title: Text('Leader'),
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.listOutline),
            title: Text('Quiz'),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.history),
          //   title: Text('History'),
          // ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.personOutline),
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

  Widget popularCard(image) {
    return AspectRatio(
      aspectRatio: 3 / 2.0,
      child: Container(
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
        ),
      ),
    );
  }
}
