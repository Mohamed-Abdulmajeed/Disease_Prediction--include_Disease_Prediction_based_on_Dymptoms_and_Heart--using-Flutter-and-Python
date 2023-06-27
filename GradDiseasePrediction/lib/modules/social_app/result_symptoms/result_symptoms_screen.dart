import 'package:flutter/material.dart';

import '../../../layout/social_app/cubit/social_cubit.dart';
import '../../../shared/cubit/cubit.dart';
class ResultSymptomsScreen extends StatefulWidget {
  const ResultSymptomsScreen({Key? key}) : super(key: key);

  @override
  State<ResultSymptomsScreen> createState() => _ResultSymptomsScreenState();
}

class _ResultSymptomsScreenState extends State<ResultSymptomsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
          physics:BouncingScrollPhysics(),
          child: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  Container(
                    child: Text(
                      SocialCubit.get(context).msgResSymps,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppCubit.get(context).isDark ? Colors.white :Colors.blue,
                      ),
                    ),
                  ),


                ],
              )
          ),
        ),
    );
  }
}
