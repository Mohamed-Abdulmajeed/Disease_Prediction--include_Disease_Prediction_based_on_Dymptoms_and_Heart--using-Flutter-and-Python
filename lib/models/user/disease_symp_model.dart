
class DiseaseSympModel {
  late final String uId;
  late final String symptoms1;
  late final String symptoms2;
  late final String symptoms3;
  late final String symptoms4;
  late final String symptoms5;
  late final String DateTime;
  late final bool isReplied;
  late final String result;

  DiseaseSympModel({
    required this.uId,
    required this.symptoms1,
    required this.symptoms2,
    required this.symptoms3,
    required this.symptoms4,
    required this.symptoms5,
    required this.DateTime,
    required this.isReplied,
    required this.result,

  });
  DiseaseSympModel.fromJson(Map<String , dynamic>json)
  {
    uId = json['uId'];
    symptoms1 = json['symptoms1'];
    symptoms2 = json['symptoms2'];
    symptoms3 = json['symptoms3'];
    symptoms4 = json['symptoms4'];
    symptoms5 = json['symptoms5'];
    DateTime = json['DateTime'];
    DateTime = json['isReplied'];
    DateTime = json['result'];

  }
  Map<String , dynamic>toMap()
  {
    return{
      'uId':uId,
      'symptoms1':symptoms1,
      'symptoms2':symptoms2,
      'symptoms3':symptoms3,
      'symptoms4':symptoms4,
      'symptoms5':symptoms5,
      'DateTime':DateTime,
      'isReplied':isReplied,
      'result':result,

    };
  }
}