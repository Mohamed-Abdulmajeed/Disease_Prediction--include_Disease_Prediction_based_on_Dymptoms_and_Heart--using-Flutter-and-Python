import 'package:flutter/material.dart';
import 'package:selectable_list/selectable_list.dart';

import '../../../../layout/social_app/cubit/social_cubit.dart';

class SelectableList2fbs extends StatefulWidget {
  const SelectableList2fbs({super.key});
  @override
  State<SelectableList2fbs> createState() => _SelectableList2fbsState();
}

class _SelectableList2fbsState extends State<SelectableList2fbs> {

  final persons = [
    Person("lower than 120 mg/ml" ),
    Person("greater than 120 mg/ml" ),

  ];

  String? selectedName;

  @override
  Widget build(BuildContext context) {
    return SelectableList<Person, String?>(

      items: persons,
      itemBuilder: (context, person, selected, onTap) => ListTile(
          title: Text(person.name),
          selected: selected,
          onTap: onTap),
      valueSelector: (person) => person.name,
      selectedValue: selectedName,
      onItemSelected: (person) {
        setState(() {
          selectedName = person.name;
          SocialCubit.get(context).Add2ValueOfFasting(selectedName!);
        });
      },//(person) => setState(() => selectedName = person.name),
      onItemDeselected: (person) => setState(() => selectedName = null),

    );
  }
}
class Person {
  final String name;
  //final int age;

  Person(this.name);
}
