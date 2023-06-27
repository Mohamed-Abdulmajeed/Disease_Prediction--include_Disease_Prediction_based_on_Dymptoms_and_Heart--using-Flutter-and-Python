import 'package:flutter/material.dart';
import 'package:pro1/modules/social_app/disease_with_symtoms/selectable_list/selectable_list1.dart';
import 'package:pro1/modules/social_app/disease_with_symtoms/selectable_list/selectable_list2.dart';
import 'package:pro1/modules/social_app/disease_with_symtoms/selectable_list/selectable_list3.dart';
import 'package:pro1/modules/social_app/disease_with_symtoms/selectable_list/selectable_list4.dart';
import 'package:pro1/modules/social_app/disease_with_symtoms/selectable_list/selectable_list5.dart';
import '../../../layout/social_app/cubit/social_cubit.dart';
import '../../../shared/components/components.dart';

class DiseaseWithSymtomsScreen extends StatelessWidget {
  late var formKey = GlobalKey<FormState>();
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
                  'Symptom 1',
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
                      child: SelectableList1(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Symptom 2',
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
                      child: SelectableList2(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Symptom 3',
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
                      child: SelectableList3(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Symptom 4',
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
                      child: SelectableList4(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Symptom 5',
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
                      child: SelectableList5(),
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
                  ),
                  child: MaterialButton(
                  onPressed: ()
                  {
                  if(formKey.currentState!.validate()) {
                    if (SocialCubit.get(context).Symptom1 == ''||SocialCubit.get(context).Symptom2 == ''||SocialCubit.get(context).Symptom3 == ''||SocialCubit.get(context).Symptom4 == ''||SocialCubit.get(context).Symptom5 == '')
                    {
                      showToast(message: 'Please choose 5 Symptoms',
                          state: ToastStates.WARNING);
                    }
                    else{
                      SocialCubit.get(context).createNewDiseasePred();
                      showToast(message: 'Data Added Success',
                          state: ToastStates.SUCCESS);
                    }
                    // print(SocialCubit.get(context).Symptom2);
                    // print(SocialCubit.get(context).Symptom3);
                    // print(SocialCubit.get(context).Symptom4);
                    // print(SocialCubit.get(context).Symptom5);

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
