// ignore_for_file: non_constant_identifier_names

class MemberFormModel {
  int? MEMBERSHIPID;
  String? NAME;
  String? EMAIL;
  int? MOBILENO;

  MemberFormModel({
    this.MEMBERSHIPID,
    this.NAME,
    this.EMAIL,
    this.MOBILENO,
  });

  List<MemberFormModel> toModelFromAPIJson(List<dynamic> str) {
    return List<MemberFormModel>.from(
        str.map((x) => MemberFormModel.fromAPIJson(x)));
  }

  MemberFormModel.fromAPIJson(Map<String, dynamic> inputjson) {
    MEMBERSHIPID = inputjson['MEMBERSHIPID'];
    NAME = inputjson['NAME'];
    EMAIL = inputjson['EMAIL'];
    MOBILENO = inputjson['MOBILENO'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['MEMBERSHIPID'] = MEMBERSHIPID;
    data['NAME'] = NAME;
    data['EMAIL'] = EMAIL;
    data['MOBILENO'] = MOBILENO;

    return data;
  }

  MemberFormModel.fromJson(Map<String, dynamic> inputjson) {
    // print("Inside Model $inputjson");
    MEMBERSHIPID = int.parse(inputjson['MEMBERSHIPID']);
    MOBILENO = int.parse(inputjson['MOBILENO']);

    NAME = inputjson['NAME'].toString();
    EMAIL = inputjson['EMAIL'].toString();
    // profilePic = inputjson['profilePic'];

    // pROJECTID = inputjson['PROJECT_ID'];
    // cOMPANYID = inputjson['COMPANY_ID'];
    // uSERID = inputjson['USER_ID'];
  }
}
