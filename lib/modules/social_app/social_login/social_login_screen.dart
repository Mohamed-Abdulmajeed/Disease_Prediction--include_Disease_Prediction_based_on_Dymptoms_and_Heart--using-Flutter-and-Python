import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro1/modules/social_app/social_login/cubit/cubit.dart';
import 'package:pro1/modules/social_app/social_register/social_register_screen.dart';

import '../../../layout/social_app/social_layout.dart';
import '../../../shared/components/components.dart';
import 'cubit/states.dart';

class SocialLoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  late var formKey = GlobalKey<FormState>();
  SocialLoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(BuildContext context)=> SocialLoginCubit(),
      child: BlocConsumer<SocialLoginCubit,SocialLoginStates>(
        listener:(context, state)
        {
          if(state is SocialLoginErrorStates)
            {
              showToast(message: 'Error connection to the internet', state: ToastStates.ERROR);
            }
          else if(state is SocialLoginSuccessStates){
            navigateAndFinish(context, SocialLayout());
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme.of(context).textTheme.headline4?.copyWith(
                              color: Colors.black
                          ),
                        ),
                        Text(
                          'Login now  to use the application and communicate with a diagnostic specialist',
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: Colors.grey
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: ( value)
                          {
                            if(value == null|| value.isEmpty){
                              return 'Email must not empty';
                            }
                             return null;
                          },
                          label: 'Email Address',
                          prefix: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          suffix: SocialLoginCubit.get(context).suffix,
                          isPassword: SocialLoginCubit.get(context).isPassword,
                          suffixPressed: ()
                          {
                            SocialLoginCubit.get(context).changePasswordVisibility();
                          },
                          validate: ( value)
                          {
                            if(value == null|| value.isEmpty){
                              return 'Password is too short';
                            }
                          },
                          label: 'Password',
                          prefix: Icons.lock_outline,
                        ),
                        SizedBox(
                          height: 25.0,
                        ),

                        ConditionalBuilder(
                          condition: state is! SocialLoginLoadingStates,
                          builder: (context)=> DefultButton(
                            text: 'login',width: double.infinity,
                            function: (){
                              if(formKey.currentState!.validate())
                              {
                                SocialLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }

                            },
                          ),
                          fallback:(context)=> Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                            ),
                            defaultTextButton(
                              function: ()
                              {
                                   navigateTo(context, SocialRegisterScreen());
                              },
                              text:'register',
                            ),

                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      )
    );
  }
}
