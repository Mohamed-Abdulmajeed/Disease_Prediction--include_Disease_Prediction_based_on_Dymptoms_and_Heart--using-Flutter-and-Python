class ResultSymptomsModel
{
  late String MSG;


  ResultSymptomsModel({
    required this.MSG,

  });
  factory ResultSymptomsModel.fromMap(Map<String, dynamic> map) {
    return ResultSymptomsModel(
      MSG: map['MSG'],

    );
  }
  ResultSymptomsModel.fromJson(Map<String , dynamic> json)
  {
    MSG = json ['MSG'];

  }
  Map<String , dynamic> toMap()
  {

    return {
      'MSG':MSG,

    };
  }
}