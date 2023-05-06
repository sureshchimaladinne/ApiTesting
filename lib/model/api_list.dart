class UserInfo {
  int? page;
  int? perpage;
  int? total;
  int? totalpage;
  List<UesrDetails>? data;

  UserInfo({this.page, this.perpage, this.total, this.totalpage, this.data});

  UserInfo.formjson(Map<String, dynamic> json) {
    page = json["page"];
    perpage = json["per_page"];
    total = json["total"];
    totalpage = json["total_pages"];
    if (json['data'] != null) {
      data = <UesrDetails>[];
      json['data'].forEach((v) {
        data!.add(new UesrDetails.formjson(v));
      });
    }
  }
}

class UesrDetails {
  int? id;
  String? email;
  String? firstname;
  String? lastnaame;
  String? avatar;

  UesrDetails(
      {this.id, this.email, this.firstname, this.lastnaame, this.avatar});

  UesrDetails.formjson(Map<String, dynamic> json) {
    id = json["id"];
    email = json["email"];
    firstname = json["first_name"];
    lastnaame = json["last_name"];
    avatar = json["avatar"];
    // if (json['data'] != null) {
    //   data = <UserInfo>[];
    // }
  }
}

class server {
  String? url;
  String? text;

  server({this.url, this.text});

  server.formjson(Map<String, dynamic> json) {
    url = json["url"];
    text = json["text"];
  }
}