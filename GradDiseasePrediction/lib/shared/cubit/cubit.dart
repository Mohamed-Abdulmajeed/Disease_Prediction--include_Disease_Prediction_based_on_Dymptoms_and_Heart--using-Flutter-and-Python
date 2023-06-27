import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro1/shared/cubit/states.dart';
import 'package:sqflite/sqflite.dart';


class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());

  static AppCubit get (context)=>BlocProvider.of(context);

  int currentIndex = 0;



  bool isBottomSheetShow = false;
  IconData fabIcon = Icons.edit;

  void changeBottomSheetState({
  required bool isShow,
  required IconData icon,
})
  {
    isBottomSheetShow = isShow;
    fabIcon = icon;
    emit(AppChangeBottomSheetState());
  }

  bool isDark = false;
  void changeAppMode ()
  {
    isDark = !isDark;
    emit(AppChangeModeState());
  }

}