class GetTheValue {
  String? status;
  int? responescode;
  List<HosptalType>? hospitalTypesR;

  GetTheValue({this.status, this.responescode, this.hospitalTypesR});

  GetTheValue.formjson(Map<String, dynamic> json) {
    status = json["status"];
    responescode = json["responseCode"];
    if (json['hospitalTypesRev'] != null) {
      hospitalTypesR = <HosptalType>[];
      json['hospitalTypesRev'].forEach((r) {
        hospitalTypesR!.add(new HosptalType.fromjson(r));
      });
    }
  }
}

class HosptalType {
  String? lattitude;
  String? longitude;
  String? hospitalid;
  String? hospitalname;
  String? address;
  String? statename;
  String? district;
  String? mandal;
  String? city;
  String? categeory;

  HosptalType({
    this.lattitude,
    this.longitude,
    this.hospitalid,
    this.hospitalname,
    this.address,
    this.statename,
    this.district,
    this.mandal,
    this.city,
  });

  HosptalType.fromjson(Map<String, dynamic> json) {
    lattitude = json["lattitude"];
    longitude = json["longitude"];
    hospitalid = json["hospitalId"];
    hospitalname = json["hospitalName"];
    address = json["address"];
    statename = json["stateName"];
    district = json["district"];
    mandal = json["mandal"];
    city = json["city"];
    categeory = json["category"];
  }
}
