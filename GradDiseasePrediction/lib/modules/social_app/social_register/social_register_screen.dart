import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro1/layout/social_app/social_layout.dart';
import 'package:pro1/modules/social_app/social_register/cubit/cubit.dart';
import 'package:pro1/modules/social_app/social_register/cubit/states.dart';

import '../../../shared/components/components.dart';

class SocialRegisterScreen extends StatelessWidget {
  late var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>SocialRegisterCubit(),
      child: BlocConsumer<SocialRegisterCubit,SocialRegisterStates>(
       listener: (context, state) {
         if (state is SocialRegisterErrorStates)
         {
           showToast(message: 'Error connection to the internet', state: ToastStates.ERROR);
         }
         else if (state is SocialCreateUserErrorStates)
         {
           showToast(message: 'Error connection to the internet', state: ToastStates.ERROR);
         }
         else if(state is SocialCreateUserSuccessStates){
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
                         'REGISTER',
                         style: Theme.of(context).textTheme.headline4?.copyWith(
                             color: Colors.black
                         ),
                       ),
                       Text(
                         'Register now  to use the application and communicate with a diagnostic specialist',
                         style: Theme.of(context).textTheme.bodyText1?.copyWith(
                             color: Colors.grey
                         ),
                       ),
                       SizedBox(
                         height: 30,
                       ),
                       defaultFormField(
                         controller: nameController,
                         type: TextInputType.name,
                         validate: ( value)
                         {
                           if(value == null|| value.isEmpty){
                             return 'Name must not empty';
                           }
                           // return null;
                         },
                         label: 'User Name',
                         prefix: Icons.person,
                       ),

                       SizedBox(
                         height: 15,
                       ),
                       defaultFormField(
                         controller: phoneController,
                         type: TextInputType.phone,
                         validate: ( value)
                         {
                           if(value == null|| value.isEmpty){
                             return 'phone must not empty';
                           }
                            return null;
                         },
                         label: 'Phone',
                         prefix: Icons.phone,
                       ),
                       SizedBox(
                         height: 15,
                       ),
                       defaultFormField(
                         controller: emailController,
                         type: TextInputType.emailAddress,
                         validate: ( value)
                         {
                           if(value == null|| value.isEmpty){
                             return 'Email must not empty';
                           }
                           // return null;
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
                         suffix: SocialRegisterCubit.get(context).suffix,
                         isPassword: SocialRegisterCubit.get(context).isPassword,
                         suffixPressed: ()
                         {
                           SocialRegisterCubit.get(context).changePasswordVisibility();
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
                         condition: state is !SocialRegisterLoadingStates,
                         builder: (context)=> DefultButton(
                           text: 'register',
                           isUpperCase: true,
                           function: (){
                             if(formKey.currentState!.validate())
                             {
                               SocialRegisterCubit.get(context).userRegister(
                                 email: emailController.text,
                                 password: passwordController.text,
                                 name: nameController.text,
                                 phone: phoneController.text
                               );
                             }

                           },
                         ),
                         fallback:(context)=> Center(child: CircularProgressIndicator()),
                       ),


                     ],
                   ),
                 ),
               ),
             ),
           ),
         );
    },
      ),
    );
  }
}
