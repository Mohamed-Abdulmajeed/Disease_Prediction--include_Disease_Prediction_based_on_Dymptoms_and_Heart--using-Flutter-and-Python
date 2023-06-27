import 'package:flutter/material.dart';
import 'package:selectable_list/selectable_list.dart';

import '../../../../layout/social_app/cubit/social_cubit.dart';

class SelectableList7ca extends StatefulWidget {
  const SelectableList7ca({super.key});
  @override
  State<SelectableList7ca> createState() => _SelectableList7caState();
}

class _SelectableList7caState extends State<SelectableList7ca> {

  final persons = [
    Person("0" ),
    Person("1" ),
    Person("2" ),
    Person("3" ),
    Person("4" ),
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
          SocialCubit.get(context).Add7ValueOfNumMajor(selectedName!);
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