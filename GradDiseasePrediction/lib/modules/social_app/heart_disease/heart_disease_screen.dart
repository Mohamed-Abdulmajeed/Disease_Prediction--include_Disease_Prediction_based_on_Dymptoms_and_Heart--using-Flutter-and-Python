import 'package:flutter/material.dart';
import 'package:pro1/modules/social_app/heart_disease/selectable_list_heart/selectable_list1_heart.dart';
import 'package:pro1/modules/social_app/heart_disease/selectable_list_heart/selectable_list2_heart.dart';
import 'package:pro1/modules/social_app/heart_disease/selectable_list_heart/selectable_list3_heart.dart';
import 'package:pro1/modules/social_app/heart_disease/selectable_list_heart/selectable_list8_heart.dart';

import '../../../layout/social_app/cubit/social_cubit.dart';
import '../../../shared/components/components.dart';
import 'selectable_list_heart/selectable_list4_heart.dart';
import 'selectable_list_heart/selectable_list5_heart.dart';
import 'selectable_list_heart/selectable_list6_heart.dart';
import 'selectable_list_heart/selectable_list7_heart.dart';

class HeartDiseaseScreen extends StatelessWidget {
  late var formKey = GlobalKey<FormState>();
  var ageController = TextEditingController();
  var bloodPressureController = TextEditingController();
  var cholestrolController = TextEditingController();
  var maxHeartController = TextEditingController();
  var stDepressionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
          physics:BouncingScrollPhysics(),
          child: Expanded(
            child: Padding(
              padding: EdgeInsets.all(40),
             child: Form(
               key: formKey,
               child: Column(
                 children: [

                   Text(
                     'Enter Age',
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 18,
                       color: Colors.blue,
                     ),
                   ),
                   Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(45,),
                       color: Colors.white,
                     ),
                     child: defaultFormField(
                       controller: ageController,
                       type: TextInputType.number,
                       validate: ( value)
                       {
                         if(value == null|| value.isEmpty){
                           return 'Age must not empty';
                         }
                       },
                       label: 'Age',
                       prefix: Icons.accessibility_new_sharp,
                     ),
                   ),
                   SizedBox(
                     height: 10,
                   ),
                   Text(
                     'Gender',
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 18,
                       color: Colors.blue,
                     ),
                   ),
                   Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(45,),
                       color: Colors.yellow,
                     ),
                     child: SingleChildScrollView(
                       child: const Padding(
                         padding: EdgeInsets.all(24),
                         child: SelectableList1Gender(),
                       ),
                     ),
                   ),
                   SizedBox(
                     height: 10,
                   ),
                   Text(
                     'Cest Pain Type',
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 18,
                       color: Colors.blue,
                     ),
                   ),
                   Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(45,),
                       color: Colors.cyanAccent,
                     ),
                     child: SingleChildScrollView(
                       child: const Padding(
                         padding: EdgeInsets.all(24),
                         child: SelectableList3cp(),
                       ),
                     ),
                   ),
                   SizedBox(
                     height: 10,
                   ),
                   Text(
                     'Resting Blood Pressure :- Enter value between 80:220',
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 18,
                       color: Colors.blue,
                     ),
                   ),
                   Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(45,),
                       color: Colors.white,
                     ),
                     child: defaultFormField(
                       controller: bloodPressureController,
                       type: TextInputType.number,
                       validate: ( value)
                       {
                         if(value == null|| value.isEmpty){
                           return 'blood Pressure must not empty';
                         }
                       },
                       label: 'blood Pressure',
                       prefix: Icons.ac_unit_rounded,
                     ),
                   ),
                   SizedBox(
                     height: 10,
                   ),
                   Text(
                     'Cholestrol :- Enter value between 100:400',
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 18,
                       color: Colors.blue,
                     ),
                   ),
                   Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(45,),
                       color: Colors.white,
                     ),
                     child: defaultFormField(
                       controller: cholestrolController,
                       type: TextInputType.number,
                       validate: ( value)
                       {
                         if(value == null|| value.isEmpty){
                           return 'Cholestrol must not empty';
                         }
                       },
                       label: 'Cholestrol',
                       prefix: Icons.add_chart,
                     ),
                   ),
                   SizedBox(
                     height: 10,
                   ),
                   Text(
                     'Fasting blood Suger',
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 18,
                       color: Colors.blue,
                     ),
                   ),
                   Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(45,),
                       color: Colors.yellow,
                     ),
                     child: SingleChildScrollView(
                       child: const Padding(
                         padding: EdgeInsets.all(24),
                         child: SelectableList2fbs(),
                       ),
                     ),
                   ),
                   SizedBox(
                     height: 10,
                   ),
                   Text(
                     'Rest ecg',
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 18,
                       color: Colors.blue,
                     ),
                   ),
                   Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(45,),
                       color: Colors.cyanAccent,
                     ),
                     child: SingleChildScrollView(
                       child: const Padding(
                         padding: EdgeInsets.all(24),
                         child: SelectableList4restecg(),
                       ),
                     ),
                   ),
                   SizedBox(
                     height: 30,
                   ),
                   Text(
                     'Enter max Heart rate achieved :- Enter value between 100:200',
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 18,
                       color: Colors.blue,
                     ),
                   ),
                   Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(45,),
                       color: Colors.white,
                     ),
                     child: defaultFormField(
                       controller: maxHeartController,
                       type: TextInputType.number,
                       validate: ( value)
                       {
                         if(value == null|| value.isEmpty){
                           return 'max Heart rate achieved must not empty';
                         }
                       },
                       label: 'max Heart rate achieved',
                       prefix: Icons.heart_broken_outlined,
                     ),
                   ),
                   SizedBox(
                     height: 10,
                   ),
                   Text(
                     'Exercise included angina',
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 18,
                       color: Colors.blue,
                     ),
                   ),
                   Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(45,),
                       color: Colors.yellow,
                     ),
                     child: SingleChildScrollView(
                       child: const Padding(
                         padding: EdgeInsets.all(24),
                         child: SelectableList5exang(),
                       ),
                     ),
                   ),
                   SizedBox(
                     height: 30,
                   ),
                   Text(
                     'Enter St Depression :- Enter value between 0:4',
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 18,
                       color: Colors.blue,
                     ),
                   ),
                   Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(45,),
                       color: Colors.white,
                     ),
                     child: defaultFormField(
                       controller: stDepressionController,
                       type: TextInputType.number,
                       validate: ( value)
                       {
                         if(value == null|| value.isEmpty){
                           return 'St Depression must not empty';
                         }
                       },
                       label: 'St Depression',
                       prefix: Icons.account_balance_wallet,
                     ),
                   ),
                   SizedBox(
                     height: 10,
                   ),
                   Text(
                     'St Slope',
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 18,
                       color: Colors.blue,
                     ),
                   ),
                   Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(45,),
                       color: Colors.cyanAccent,
                     ),
                     child: SingleChildScrollView(
                       child: const Padding(
                         padding: EdgeInsets.all(24),
                         child: SelectableList6slope(),
                       ),
                     ),
                   ),
                   SizedBox(
                     height: 30,
                   ),
                   Text(
                     'Number major vessels',
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 18,
                       color: Colors.blue,
                     ),
                   ),
                   Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(45,),
                       color: Colors.yellow,
                     ),
                     child: SingleChildScrollView(
                       child: const Padding(
                         padding: EdgeInsets.all(24),
                         child: SelectableList7ca(),
                       ),
                     ),
                   ),
                   SizedBox(
                     height: 30,
                   ),
                   Text(
                     'Thalassemia',
                     style: TextStyle(
                       color: Colors.blue,
                       fontWeight: FontWeight.bold,
                       fontSize: 18,
                     ),
                   ),
                   Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(45,),
                       color: Colors.yellow,
                     ),
                     child: SingleChildScrollView(
                       child: const Padding(
                         padding: EdgeInsets.all(24),
                         child: SelectableList8thal(),
                       ),
                     ),
                   ),
                   SizedBox(
                     height: 30,
                   ),
                   Container(
                     width: double.infinity,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(45,),
                       color: Colors.deepOrange,
                     ),            child: MaterialButton(
                     onPressed: ()
                     {
                     if(formKey.currentState!.validate()) {
                       if (SocialCubit.get(context).Gender == ''||SocialCubit.get(context).Fasting == ''||SocialCubit.get(context).ChestPain == ''||SocialCubit.get(context).Resting == ''||SocialCubit.get(context).Exang == ''||SocialCubit.get(context).Slope == ''||SocialCubit.get(context).NumMajor == ''||SocialCubit.get(context).Thalassemia == '')
                       {
                         showToast(message: 'Please choose All required information ',
                             state: ToastStates.WARNING);
                       }
                       else{
                       SocialCubit.get(context).createNewHeartPred(
                           age: ageController.text,
                           chol: cholestrolController.text,
                           stDepression: stDepressionController.text,
                           maxHeartRate: maxHeartController.text,
                           bloodPressure: bloodPressureController.text
                       );
                       showToast(message: 'Data Added Success',
                           state: ToastStates.SUCCESS);
                     }
                     }
                     },
                     height: 50.0,
                     child: Text(
                       'Add Data',
                       style: TextStyle(
                           fontSize: 16,
                           fontWeight: FontWeight.bold,
                           color: Colors.white
                       ),
                     ),
                   ),
                   ),
                 ],
               ),
             ),
            ),
          ),
        )
    );
  }
}
