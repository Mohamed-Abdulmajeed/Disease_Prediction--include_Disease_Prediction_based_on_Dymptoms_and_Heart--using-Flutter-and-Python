import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro1/models/social_app/result_Symptoms_model.dart';
import 'package:pro1/modules/social_app/social_register/cubit/states.dart';

import '../../../../models/social_app/social_user_model.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterStates>
{
  SocialRegisterCubit(): super(SocialRegisterInitialStates());

  static SocialRegisterCubit get (context)=>BlocProvider.of(context);

  //SocialLoginModel loginModel ;
  //
  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  })
  {
    emit(SocialRegisterLoadingStates());

    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
    ).then((value){
      print(value.user?.email);
      print(value.user?.uid);
      userCreate(
          phone: phone,
          email: email,
          name: name,
          uId: value.user!.uid,
      );

    })
        .catchError((error){
      emit(SocialRegisterErrorStates(error.toString()));

    });
  }

  void userCreate({
    required String email,
    required String name,
    required String phone,
    required String uId,

  })
  {
    SocialUserModel model = SocialUserModel(
        name: name,
        email: email,
        phone: phone,
        uId: uId);

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value){
          emit(SocialCreateUserSuccessStates());
    })
        .catchError((error){
      emit(SocialCreateUserErrorStates(error.toString()));

    });
    ResultSymptomsModel symptomsModel = ResultSymptomsModel(MSG: '');
    FirebaseFirestore.instance
        .collection('SymptomsResult')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .set(symptomsModel.toMap())
        .then((value){
      //emit(SocialCreateUserSuccessStates());
    })
        .catchError((error){
      //emit(SocialCreateUserErrorStates(error.toString()));

    });
    FirebaseFirestore.instance
        .collection('HeartResult')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .set(symptomsModel.toMap())
        .then((value){
      //emit(SocialCreateUserSuccessStates());
    })
        .catchError((error){
      //emit(SocialCreateUserErrorStates(error.toString()));

    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword =true;

void changePasswordVisibility()
{

  isPassword = !isPassword;
  suffix = isPassword?Icons.visibility_outlined:Icons.visibility_off_outlined;
  emit(SocialRegisterChangePasswordVisibilityStates());
}

}




