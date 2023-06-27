import 'package:flutter/material.dart';
import 'package:selectable_list/selectable_list.dart';

import '../../../../layout/social_app/cubit/social_cubit.dart';

class SelectableList6slope extends StatefulWidget {
  const SelectableList6slope({super.key});
  @override
  State<SelectableList6slope> createState() => _SelectableList6slopeState();
}

class _SelectableList6slopeState extends State<SelectableList6slope> {

  final persons = [
    Person("upsloping" ),
    Person("flat" ),
    Person("down sloping" ),
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
          SocialCubit.get(context).Add6ValueOfSlope(selectedName!);
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