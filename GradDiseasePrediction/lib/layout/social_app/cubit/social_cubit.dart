import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pro1/layout/social_app/cubit/social_states.dart';
import '../../../models/social_app/result_Symptoms_model.dart';
import '../../../models/user/disease_symp_model.dart';
import '../../../models/user/heart_disease_model.dart';
import '../../../modules/social_app/disease_with_symtoms/disease_with_symtoms_screen.dart';
import '../../../modules/social_app/heart_disease/heart_disease_screen.dart';
import '../../../modules/social_app/result_heart/result_heart_screen.dart';
import '../../../modules/social_app/result_symptoms/result_symptoms_screen.dart';
import '../../../modules/social_app/setting_screen/setting_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialState());
  // make object of the cubit
  static SocialCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomNavigationBarItems =[
    BottomNavigationBarItem(
      icon: Icon(
          Icons.star
      ),
      label: 'Symptoms',

    ),
    BottomNavigationBarItem(
      icon: Icon(
          Icons.heart_broken
      ),
      label: 'Heart',
    ),
    BottomNavigationBarItem(
      icon: Icon(
          Icons.important_devices
      ),
      label: 'ResSymptoms',
    ),
    BottomNavigationBarItem(
      icon: Icon(
          Icons.health_and_safety_sharp
      ),
      label: 'ResHeart',
    ),
    BottomNavigationBarItem(
      icon: Icon(
          Icons.settings
      ),
      label: 'Settings',
    ),
  ];
  List<String> appBarTitles = [
    'Disease With Symptoms',
    'Heart Disease',
    'Result Symptoms',
    'Result Heart',
    'Settings',
  ];

  List<Widget> screens = [
    DiseaseWithSymtomsScreen(),
    HeartDiseaseScreen(),
    ResultSymptomsScreen(),
    ResultHeartScreen(),
    SettingScreen(),
  ];

  void changeBottomNavigationBarItems(int index) {
    currentIndex = index;
    Symptom1="" ;
    Symptom2="" ;
    Symptom3="" ;
    Symptom4="" ;
    Symptom5="" ;
    Gender="";
    Fasting="" ;
    ChestPain="" ;
    Resting="" ;
    Exang="" ;
    Slope="" ;
    NumMajor="" ;
    Thalassemia="" ;
    getResultSymptoms();
    getResultHeart();
    getInfoOfUser();
    emit(SocialChangeBottomNavState());
    }

  String Symptom1="" ;
  void AddValueOfSymptom1 (String Symp1)
  {
    Symptom1 = Symp1;
    emit(Symptom1AddValueState());
  }
  String Symptom2="" ;
  void AddValueOfSymptom2 (String Symp2)
  {
    Symptom2 = Symp2;
    emit(Symptom2AddValueState());
  }
  String Symptom3="" ;
  void AddValueOfSymptom3 (String Symp3)
  {
    Symptom3 = Symp3;
    emit(Symptom3AddValueState());
  }
  String Symptom4="" ;
  void AddValueOfSymptom4 (String Symp4)
  {
    Symptom4 = Symp4;
    emit(Symptom4AddValueState());
  }
  String Symptom5="" ;
  void AddValueOfSymptom5 (String Symp5)
  {
    Symptom5 = Symp5;
    emit(Symptom5AddValueState());
  }
  String Gender="" ;
  void Add1ValueOfGender (String gender)
  {
    Gender = gender;
    emit(Heart1AddGenderValueState());
  }
  String Fasting="" ;
  void Add2ValueOfFasting (String fasting)
  {
    Fasting = fasting;
    emit(Heart2AddFastingValueState());
  }
  String ChestPain="" ;
  void Add3ValueOfChestPain (String chestPain)
  {
    ChestPain = chestPain;
    emit(Heart3AddChestPainValueState());
  }
  String Resting="" ;
  void Add4ValueOfResting (String resting)
  {
    Resting = resting;
    emit(Heart4AddRestingValueState());
  }
  String Exang="" ;
  void Add5ValueOfExang (String exang)
  {
    Exang = exang;
    emit(Heart5AddExangValueState());
  }
  String Slope="" ;
  void Add6ValueOfSlope (String slope)
  {
    Slope = slope;
    emit(Heart6AddSlopeValueState());
  }
  String NumMajor="" ;
  void Add7ValueOfNumMajor (String numMajor)
  {
    NumMajor = numMajor;
    emit(Heart7AddNumMajorValueState());
  }
  String Thalassemia="" ;
  void Add8ValueOfThalassemia (String thalassemia)
  {
    Thalassemia = thalassemia;
    emit(Heart8AddThalassemiaValueState());
  }
  void createNewDiseasePred()
  {
    DiseaseSympModel model = DiseaseSympModel(
        uId: (FirebaseAuth.instance.currentUser?.uid).toString(),
        symptoms1: Symptom1,
        symptoms2: Symptom2,
        symptoms3: Symptom3,
        symptoms4: Symptom4,
        symptoms5: Symptom5,
        isReplied: false,
        DateTime: (DateFormat('E,d MMM yyyy  :  HH:mm:ss')
            .format(DateTime.now())).toString(),
        result: '',

    );

    FirebaseFirestore.instance
        .collection('Symptoms')
        .add(model.toMap())
        .then((value){
      emit(SocialCreateSymptomsSuccessState());
    })
        .catchError((error){
      emit(SocialCreateSymptomsErrorState(error.toString()));

    });

  }

  void createNewHeartPred({
    required String age,
    required String chol,
    required String stDepression,
    required String maxHeartRate,
    required String bloodPressure,
  })
  {
    HeartDiseaseModel model = HeartDiseaseModel(
        uId: (FirebaseAuth.instance.currentUser?.uid).toString(),
        Age :age,
        Gender :Gender,
        chestPainType :ChestPain,
        bloodPressure :bloodPressure,
        cholesterol :chol,
        bloodSuger :Fasting,
        restEcg :Resting,
        maxHeartRate :maxHeartRate,
        angina :Exang,
        stDepression :stDepression,
        stSlope :Slope,
        numMajorVessels :NumMajor,
        thal :Thalassemia,
        dateTime: (DateFormat('E,d MMM yyyy  :  HH:mm:ss')
            .format(DateTime.now())).toString(),
        isReplied: false,
        result: ''
    );
    FirebaseFirestore.instance
        .collection('Heart')
        .add(model.toMap())
        .then((value){
      emit(SocialCreateHeartSuccessState());
    })
        .catchError((error){
      emit(SocialCreateHeartErrorState(error.toString()));

    });

  }

  List<ResultSymptomsModel> resultSymptoms = [];


  String msgResSymps='';
void  getResultSymptoms()
{
  FirebaseFirestore.instance.collection('SymptomsResult').get().then((value)
  {
       value.docs.forEach((element)
       {
         if((element.id).toString() == (FirebaseAuth.instance.currentUser?.uid).toString()) {
           msgResSymps = element.data()['MSG'];
           print(msgResSymps);
         }
       });
  }).catchError((error){
    print(error.toString);
  });
}

  String msgResHeart='';
  void  getResultHeart()
  {
    FirebaseFirestore.instance.collection('HeartResult').get().then((value)
    {
      value.docs.forEach((element)
      {
        if((element.id).toString() == (FirebaseAuth.instance.currentUser?.uid).toString()) {
          msgResHeart = element.data()['MSG'];
          print(msgResHeart);
        }
      });
    }).catchError((error){
      print(error.toString);
    });
  }
  bool isDark = false;
  void changeAppMode ()
  {
    isDark = !isDark;
    emit(AppChangeModeState());

  }


  String userName='';
  String userEmail='';
  String userPhone='';
  void  getInfoOfUser()
  {
    FirebaseFirestore.instance.collection('users').get().then((value)
    {
      value.docs.forEach((element)
      {
        if((element.id).toString() == (FirebaseAuth.instance.currentUser?.uid).toString()) {
          userName = element.data()['name'];
          userEmail = element.data()['email'];
          userPhone = element.data()['phone'];
        }
      });
    }).catchError((error){
      print(error.toString);
    });
  }


}
