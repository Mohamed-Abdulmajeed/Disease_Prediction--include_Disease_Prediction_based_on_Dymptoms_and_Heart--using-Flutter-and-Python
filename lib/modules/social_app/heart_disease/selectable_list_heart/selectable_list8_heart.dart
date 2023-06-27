import 'package:flutter/material.dart';
import 'package:selectable_list/selectable_list.dart';

import '../../../../layout/social_app/cubit/social_cubit.dart';

class SelectableList8thal extends StatefulWidget {
  const SelectableList8thal ({super.key});
  @override
  State<SelectableList8thal > createState() => _SelectableList8thalState();
}

class _SelectableList8thalState extends State<SelectableList8thal > {

  final persons = [
    Person("normal" ),
    Person("fixed defect" ),
    Person("reversible defect" ),
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
          SocialCubit.get(context).Add8ValueOfThalassemia(selectedName!);
        });
      },
      onItemDeselected: (person) => setState(() => selectedName = null),

    );
  }
}
class Person {
  final String name;
  //final int age;

  Person(this.name);
}