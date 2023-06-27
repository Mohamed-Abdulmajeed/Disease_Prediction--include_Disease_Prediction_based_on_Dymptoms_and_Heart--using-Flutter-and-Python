import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../layout/social_app/cubit/social_cubit.dart';
import '../../../shared/components/components.dart';
import '../../../shared/cubit/cubit.dart';
import '../social_login/social_login_screen.dart';

class SettingScreen extends StatelessWidget {

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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10,),
          color: Colors.blue,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Text(
                'Dark/Light Mode',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),

              ),
              SizedBox(
                width: 110,
              ),
              IconButton(color: Colors.white ,
                  onPressed: ()
                  {
                    AppCubit.get(context).changeAppMode();
                  },
                  icon: Icon(Icons.brightness_4_outlined,)),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Container(height: 65,width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10,),
          color: Colors.blue,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            // physics:BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
          children: [
          Text(
            SocialCubit.get(context).userName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),

          ),
          ],
        ),
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Container(height: 65,width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10,),
          color: Colors.blue,
        ),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
               // physics:BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Text(
                    SocialCubit.get(context).userEmail,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),

                  ),
                ],
              ),
            ),
          ),
      ),
      SizedBox(
        height: 20,
      ),
      Container(height: 65,width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10,),
          color: Colors.blue,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            // physics:BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Text(
                  SocialCubit.get(context).userPhone,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),

                ),
              ],
            ),
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10,),
          color: Colors.blue,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Text(
                '    LOGOUT',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),

              ),
              SizedBox(
                width: 110,
              ),
              IconButton(color: Colors.white,
                  onPressed: ()
                  {
                    navigateAndFinish(context, SocialLoginScreen());
                  },
                  icon: Icon(Icons.logout,)),
            ],
          ),
        ),
      ),
    ]
    )
    )
      ),
    );
  }
}
