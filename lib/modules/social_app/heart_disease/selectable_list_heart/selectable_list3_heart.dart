import 'package:flutter/material.dart';
import 'package:selectable_list/selectable_list.dart';

import '../../../../layout/social_app/cubit/social_cubit.dart';

class SelectableList3cp extends StatefulWidget {
  const SelectableList3cp({super.key});
  @override
  State<SelectableList3cp> createState() => _SelectableList3cpState();
}

class _SelectableList3cpState extends State<SelectableList3cp> {

  final persons = [
    Person("typical angina" ),
    Person("atypical angina"),
    Person("non angina pain"),
    Person("asymptomatic"),

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
          SocialCubit.get(context).Add3ValueOfChestPain(selectedName!);
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