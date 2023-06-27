
abstract class SocialStates {}

class SocialInitialState extends SocialStates {}
//
// // getCurrentUserData
// class SocialGetUserLoadingState extends SocialStates {}
//
// class SocialGetUserSuccessState extends SocialStates {}
//
// class SocialGetUserErrorState extends SocialStates {
//   final String error;
//   SocialGetUserErrorState(this.error);
// }

// bottom nav bar items
class SocialChangeBottomNavState extends SocialStates {}
class Symptom1AddValueState extends SocialStates {}
class Symptom2AddValueState extends SocialStates {}
class Symptom3AddValueState extends SocialStates {}
class Symptom4AddValueState extends SocialStates {}
class Symptom5AddValueState extends SocialStates {}

class Heart1AddGenderValueState extends SocialStates {}
class Heart2AddFastingValueState extends SocialStates {}
class Heart3AddChestPainValueState extends SocialStates {}
class Heart4AddRestingValueState extends SocialStates {}
class Heart5AddExangValueState extends SocialStates {}
class Heart6AddSlopeValueState extends SocialStates {}
class Heart7AddNumMajorValueState extends SocialStates {}
class Heart8AddThalassemiaValueState extends SocialStates {}

class SocialCreateSymptomsLoadingState extends SocialStates{}
class SocialCreateSymptomsSuccessState extends SocialStates{}
class SocialCreateSymptomsErrorState extends SocialStates{
  final String error;
  SocialCreateSymptomsErrorState(this.error);
}
class SocialCreateHeartSuccessState extends SocialStates{}
class SocialCreateHeartErrorState extends SocialStates{
  final String error;
  SocialCreateHeartErrorState(this.error);
}
class AppChangeModeState extends SocialStates{}
