import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro1/modules/social_app/social_login/cubit/states.dart';



class SocialLoginCubit extends Cubit<SocialLoginStates>
{
  SocialLoginCubit(): super(SocialLoginInitialStates());

  static SocialLoginCubit get (context)=>BlocProvider.of(context);

  //SocialLoginModel loginModel ;

  void userLogin({
    required String email,
    required String password,

  })
  {
    emit(SocialLoginLoadingStates());

    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      print(value.user?.email);
      print(value.user?.uid);
      emit(SocialLoginSuccessStates());
    }).catchError((error){
      emit(SocialLoginErrorStates(error.toString()));
    });

  }
  IconData suffix = Icons.visibility_outlined;
  bool isPassword =true;

void changePasswordVisibility()
{

  isPassword = !isPassword;
  suffix = isPassword?Icons.visibility_outlined:Icons.visibility_off_outlined;
  emit(SocialChangePasswordVisibilityStates());
}

}




