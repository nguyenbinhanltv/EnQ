import 'package:EnQ/components/categories_card.dart';
import 'package:EnQ/const/style.dart';
import 'package:EnQ/models/category.dart';
import 'package:EnQ/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:EnQ/pages/home.dart';

class Categories extends StatefulWidget {
  String uidCurrentUser;
  Categories({Key key, @required this.uidCurrentUser});

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text('Categories', style: ScriptStyle),
            leading: IconButton(
              icon: SvgPicture.asset(
                'assets/images/arrow_back.svg',
              ),
              onPressed: () {
                // Navigator.pop(context);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Home(uidCurrentUser: widget.uidCurrentUser)));
              },
            ),
          ),
          body: SafeArea(
            child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) =>
                    CategoriesCard(
                      category: categories[index],
                      uidCurrentUser: widget.uidCurrentUser,
                    )),
          )),
    );
  }
}
