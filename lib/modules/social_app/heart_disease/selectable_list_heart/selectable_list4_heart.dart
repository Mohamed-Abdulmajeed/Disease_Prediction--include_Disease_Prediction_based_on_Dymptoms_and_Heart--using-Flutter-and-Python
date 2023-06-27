import 'package:flutter/material.dart';
import 'package:selectable_list/selectable_list.dart';

import '../../../../layout/social_app/cubit/social_cubit.dart';

class SelectableList4restecg extends StatefulWidget {
  const SelectableList4restecg({super.key});
  @override
  State<SelectableList4restecg> createState() => _SelectableList4restecgState();
}

class _SelectableList4restecgState extends State<SelectableList4restecg> {

  final persons = [
    Person("normal" ),
    Person("ST-T wave abnormality" ),
    Person("left ventricular hypertrophy" ),
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
          SocialCubit.get(context).Add4ValueOfResting(selectedName!);
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