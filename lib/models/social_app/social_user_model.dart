class SocialUserModel
{
  late String name;
  late String email;
  late String phone;
  late String uId;

  SocialUserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.uId
  });

  SocialUserModel.fromJson(Map<String , dynamic> json)
  {
    email = json ['email'];
    name = json ['name'];
    phone = json ['phone'];
    uId = json ['uId'];
  }
  Map<String , dynamic> toMap()
  {

    return {
      'name':name,
      'email':email,
      'phone':phone,
      'uId':uId,
    };
  }
}