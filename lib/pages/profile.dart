import 'package:EnQ/components/statistical_card.dart';
import 'package:EnQ/const/size_config.dart';
import 'package:EnQ/const/style.dart';
import 'package:EnQ/models/user.dart';
import 'package:EnQ/services/auth_service.dart';
import 'package:EnQ/utils/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:EnQ/services/user_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Profile extends StatefulWidget {
  final String uid;
  Profile({Key key, @required this.uid}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // Future<User> user;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthService auth = new AuthService();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Profile',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/images/arrow_back.svg',
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset('assets/images/settings.svg'),
            ),
          ],
        ),
        body: StreamBuilder(
          stream: UserService().userStream(widget.uid),
          builder: (BuildContext context, stream) {
            if (stream.hasData) {
              return Stack(
                children: [
                  Container(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.2,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          width: 1.0,
                          color: Colors.grey,
                          style: BorderStyle.solid,
                        ),
                        bottom: BorderSide(
                          width: 1.0,
                          color: Colors.grey,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(stream.data.userName, style: ScriptStyle),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    'assets/images/crown_1.svg',
                                    width: 24.0,
                                  ),
                                )
                              ],
                            ),
                            Text(stream.data.email, style: TabsStyle),
                          ],
                        ),
                        Container(
                          width: DefaultPaddin * 4.0,
                          height: DefaultPaddin * 4.0,
                          child: CircleAvatar(
                            backgroundImage:
                                //AssetImage(recentUser.photoUrl),
                                NetworkImage(stream.data.photoUrl),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.3,
                    margin: EdgeInsets.only(top: DefaultPaddin * 7.75),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: DefaultPaddin, bottom: DefaultPaddin * 0.6),
                          child: Text('Statistical', style: ScriptStyle),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            StatisticalCard(
                                'assets/images/thunder.svg', 'Score', '216953'),
                            StatisticalCard(
                                'assets/images/fire.svg', 'Day', '30'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //color: Colors.red,
                  Container(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.5,
                    margin: EdgeInsets.only(top: DefaultPaddin * 14.5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: DefaultPaddin, bottom: DefaultPaddin * 0.6),
                          child: Text('Friends', style: ScriptStyle),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: User.friends.length,
                            itemBuilder: (BuildContext context, int index) =>
                                FriendsCard(user: User.friends[index]),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          alignment: Alignment.center,
                          child: MaterialButton(
                            onPressed: () => auth.handleSignOut().whenComplete(
                                  () => Navigator.of(context)
                                      .popAndPushNamed(AppRouting.login),
                                ),
                            color: Colors.grey[100],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'Sign Out',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return SpinKitWave(
                color: Colors.purple[50],
              );
            }
          },
        ),
      ),
    );
  }
}

class FriendsCard extends StatelessWidget {
  final User user;
  const FriendsCard({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return user != null
        ? Center(
            child: Card(
              margin: EdgeInsets.only(top: DefaultPaddin * 0.8),
              elevation: 5.0,
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: SizeConfig.screenWidth * 0.9,
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(this.user.photoUrl),
                        ),
                      ),
                      Spacer(flex: 1),
                      Text(this.user.userName),
                      Spacer(flex: 1),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(this.user.point.toString()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : SizedBox(
            height: 15.0,
          );
  }
}
