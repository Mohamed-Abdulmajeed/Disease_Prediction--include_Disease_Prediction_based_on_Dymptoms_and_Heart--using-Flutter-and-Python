
class HeartDiseaseModel {
  late final String uId;
  late final String Age;
  late final String Gender;
  late final String chestPainType;
  late final String bloodPressure;
  late final String cholesterol;
  late final String bloodSuger;
  late final String restEcg;
  late final String maxHeartRate;
  late final String angina;
  late final String stDepression;
  late final String stSlope;
  late final String numMajorVessels;
  late final String thal;
  late final String dateTime;
  late final bool isReplied;
  late final String result;


  HeartDiseaseModel({
    required this.uId,
    required this.Age,
    required this.Gender,
    required this.chestPainType,
    required this.bloodPressure,
    required this.cholesterol,
    required this.bloodSuger,
    required this.restEcg,
    required this.maxHeartRate,
    required this.angina,
    required this.stDepression,
    required this.stSlope,
    required this.numMajorVessels,
    required this.thal,
    required this.dateTime,
    required this.isReplied,
    required this.result,

  });
  HeartDiseaseModel.fromJson(Map<String , dynamic>json)
  {
    uId = json['uId'];
    Age = json['Age'];
    Gender = json['Gender'];
    chestPainType = json['chestPainType'];
    bloodPressure = json['bloodPressure'];
    cholesterol = json['cholesterol'];
    bloodSuger = json['bloodSuger'];
    restEcg = json['restEcg'];
    maxHeartRate = json['maxHeartRate'];
    angina = json['angina'];
    stDepression = json['stDepression'];
    stSlope = json['stSlope'];
    numMajorVessels = json['numMajorVessels'];
    thal = json['thal'];
    dateTime = json['dateTime'];
    dateTime = json['isReplied'];
    dateTime = json['result'];

  }
  Map<String , dynamic>toMap()
  {
    return{
      'uId':uId,
      'Age':Age,
      'Gender':Gender,
      'chestPainType':chestPainType,
      'bloodPressure':bloodPressure,
      'cholesterol':cholesterol,
      'bloodSuger':bloodSuger,
      'restEcg':restEcg,
      'maxHeartRate':maxHeartRate,
      'angina':angina,
      'stDepression':stDepression,
      'stSlope':stSlope,
      'numMajorVessels':numMajorVessels,
      'thal':thal,
      'dateTime':dateTime,
      'isReplied':isReplied,
      'result':result,

    };
  }
}