import 'package:flutter/material.dart';
import 'package:selectable_list/selectable_list.dart';

import '../../../../layout/social_app/cubit/social_cubit.dart';

class SelectableList1Gender extends StatefulWidget {
  const SelectableList1Gender({super.key});
  @override
  State<SelectableList1Gender> createState() => _SelectableList1GenderState();
}

class _SelectableList1GenderState extends State<SelectableList1Gender> {

  final persons = [
    Person("Male" ),
    Person("Female"),

  ];

  String? selectedName;
  final _formKey = GlobalKey<FormState>();
  bool autovalidate = false;
  @override
  Widget build(BuildContext context) {

    return Form(
        key: _formKey,
       // autovalidateMode: autovalidate,
        child: SelectableList<Person, String?>(

      items: persons,
      itemBuilder: (context, person, selected, onTap) => ListTile(
        title: Text(person.name),
        selected: selected,
        onTap: onTap,

      ),
      valueSelector: (person) => person.name,
      selectedValue: selectedName,

      onItemSelected: (person) {
        setState(() {
          selectedName = person.name;
          SocialCubit.get(context).Add1ValueOfGender(selectedName!);
        });
      },
      onItemDeselected: (person) => setState(() => selectedName = null),

    ));
  }
}
class Person {
  final String name;
  //final int age;

  Person(this.name);
}