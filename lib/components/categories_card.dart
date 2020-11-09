import 'package:EnQ/const/size_config.dart';
import 'package:EnQ/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:EnQ/pages/quiz.dart';
import 'package:EnQ/services/test_exam_service.dart';

class CategoriesCard extends StatelessWidget {
  final Category category;
  const CategoriesCard({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: Container(
              width: SizeConfig.screenWidth,
              // height: SizeConfig.screenHeight,
              child: Column(
                children: [
                  Container(
                      height: SizeConfig.screenHeight * 0.2,
                      child: SvgPicture.asset(
                          'assets/images/Learning languages-bro.svg')),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Type: ' +
                                this.category.type.toString().substring(5)),
                            Text('Level: ' +
                                this.category.rank.toString().substring(6)),
                          ],
                        ),
                        RaisedButton(
                          onPressed: () {
                            TestExamService().getTestExam(
                                category.type.index, category.rank.index);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Quiz()));
                          },
                          elevation: 5.0,
                          color: Colors.white,
                          textColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Text(
                            'Start',
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
