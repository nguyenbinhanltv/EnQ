import 'package:EnQ/const/size_config.dart';
import 'package:EnQ/services/auth_service.dart';
import 'package:EnQ/utils/app_route.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
    );
  }
}
