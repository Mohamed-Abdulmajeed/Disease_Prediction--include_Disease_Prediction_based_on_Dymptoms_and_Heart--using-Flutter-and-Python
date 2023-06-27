// @dart=2.9

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro1/shared/cubit/cubit.dart';
import 'package:pro1/shared/network/remote/dio_helper.dart';
import 'package:pro1/shared/styles/bloc_observer.dart';
import 'package:pro1/shared/styles/themes.dart';
import 'layout/social_app/cubit/social_cubit.dart';
import 'modules/social_app/on_boarding/on_boarding_screen.dart';
import 'shared/cubit/states.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>SocialCubit() ),
        BlocProvider(create: (BuildContext context)=>AppCubit(),),
      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener:(context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: OnBoardingScreen(),
          );
        },
      ),
    );
  }
}

