class UserModel {
  String name;
  int phoneNumber;
  int cellNumber;
  String country;
  String governorate;
  int postCode;
  int taxNumber;
  int ibanNumber;
  String email;
  UserModel(
      {required this.name,
      required this.phoneNumber,
      required this.cellNumber,
      required this.country,
      required this.email,
      required this.governorate,
      required this.ibanNumber,
      required this.postCode,
      required this.taxNumber});
}
