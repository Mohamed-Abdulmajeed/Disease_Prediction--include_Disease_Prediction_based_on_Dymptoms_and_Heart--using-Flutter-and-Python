import 'package:flutter/material.dart';
import 'package:selectable_list/selectable_list.dart';

import '../../../../layout/social_app/cubit/social_cubit.dart';

class SelectableList2 extends StatefulWidget {
  const SelectableList2({super.key});
  @override
  State<SelectableList2> createState() => _SelectableList2State();
}

class _SelectableList2State extends State<SelectableList2> {

  final persons = [
    Person("itching" ),
    Person("skin_rash"),
    Person("nodal_skin_eruptions"),
    Person("continuous_sneezing"),
    Person("shivering"),
    Person("chills"),
    Person("joint_pain"),
    Person("stomach_pain"),
    Person("acidity"),
    Person("ulcers_on_tongue"),
    Person("'muscle_wasting"),
    Person("vomiting"),
    Person("burning_micturition"),
    Person("spotting_ urination"),
    Person("fatigue"),
    Person("weight_gain"),
    Person("anxiety"),
    Person("cold_hands_and_feets"),
    Person("mood_swings"),
    Person("weight_loss"),
    Person("restlessness"),
    Person("lethargy"),
    Person("patches_in_throat"),
    Person("irregular_sugar_level"),
    Person("cough"),
    Person("high_fever"),
    Person("sunken_eyes"),
    Person("breathlessness"),
    Person("sweating"),
    Person("dehydration"),
    Person("indigestion"),
    Person("headache"),
    Person("yellowish_skin"),
    Person("dark_urine"),
    Person("nausea"),
    Person("loss_of_appetite"),
    Person("pain_behind_the_eyes"),
    Person("back_pain"),
    Person("constipation"),
    Person("abdominal_pain"),
    Person("diarrhoea"),
    Person("mild_fever"),
    Person("yellow_urine"),
    Person("yellowing_of_eyes"),
    Person("acute_liver_failure"),
    Person("fluid_overload"),
    Person("swelling_of_stomach"),
    Person("swelled_lymph_nodes"),
    Person("malaise"),
    Person("blurred_and_distorted_vision"),
    Person("phlegm"),
    Person("throat_irritation"),
    Person("redness_of_eyes"),
    Person("sinus_pressure"),
    Person("runny_nose"),
    Person("congestion"),
    Person("chest_pain"),
    Person("weakness_in_limbs"),
    Person("fast_heart_rate"),
    Person("pain_during_bowel_movements"),
    Person("pain_in_anal_region"),
    Person("bloody_stool"),
    Person("irritation_in_anus"),
    Person("neck_pain"),
    Person("dizziness"),
    Person("cramps"),
    Person("bruising"),
    Person("obesity"),
    Person("swollen_legs"),
    Person("swollen_blood_vessels"),
    Person("puffy_face_and_eyes"),
    Person("enlarged_thyroid"),
    Person("brittle_nails"),
    Person("swollen_extremeties"),
    Person("excessive_hunger"),
    Person("extra_marital_contacts"),
    Person("drying_and_tingling_lips"),
    Person("slurred_speech"),
    Person("knee_pain"),
    Person("hip_joint_pain"),
    Person("muscle_weakness"),
    Person("stiff_neck"),
    Person("swelling_joints"),
    Person("movement_stiffness"),
    Person("spinning_movements"),
    Person("loss_of_balance"),
    Person("unsteadiness"),
    Person("weakness_of_one_body_side"),
    Person("loss_of_smell"),
    Person("bladder_discomfort"),
    Person("foul_smell_of urine"),
    Person("continuous_feel_of_urine"),
    Person("passage_of_gases"),
    Person("internal_itching"),
    Person("toxic_look_(typhos)"),
    Person("depression"),
    Person("irritability"),
    Person("muscle_pain"),
    Person("altered_sensorium"),
    Person("red_spots_over_body"),
    Person("belly_pain"),
    Person("abnormal_menstruation"),
    Person("dischromic _patches"),
    Person("watering_from_eyes"),
    Person("increased_appetite"),
    Person("polyuria"),
    Person("family_history"),
    Person("mucoid_sputum"),
    Person("rusty_sputum"),
    Person("lack_of_concentration"),
    Person("visual_disturbances"),
    Person("receiving_blood_transfusion"),
    Person("receiving_unsterile_injections"),
    Person("coma"),
    Person("stomach_bleeding"),
    Person("distention_of_abdomen"),
    Person("history_of_alcohol_consumption"),
    // Person("fluid_overload"),
    Person("blood_in_sputum"),
    Person("prominent_veins_on_calf"),
    Person("painful_walking"),
    Person("pus_filled_pimples"),
    Person("blackheads"),
    Person("scurring"),
    Person("skin_peeling"),
    Person("silver_like_dusting"),
    Person("small_dents_in_nails"),
    Person("inflammatory_nails"),
    Person("blister"),
    Person("red_sore_around_nose"),
    Person("yellow_crust_ooze"),
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
          SocialCubit.get(context).AddValueOfSymptom2(selectedName!);
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
