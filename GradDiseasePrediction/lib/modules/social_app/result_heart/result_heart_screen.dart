import 'package:flutter/material.dart';

import '../../../layout/social_app/cubit/social_cubit.dart';
import '../../../shared/cubit/cubit.dart';
class ResultHeartScreen extends StatefulWidget {
  const ResultHeartScreen({Key? key}) : super(key: key);
  @override
  State<ResultHeartScreen> createState() => _ResultHeartScreenState();
}
class _ResultHeartScreenState extends State<ResultHeartScreen> {
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
                    SocialCubit.get(context).msgResHeart,
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

