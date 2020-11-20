class SuccessResponse {
  Data data;

  SuccessResponse({this.data});

  SuccessResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String verifyId;
  To to;
  String flowId;

  Data({this.verifyId, this.to, this.flowId});

  Data.fromJson(Map<String, dynamic> json) {
    verifyId = json['verify_id'];
    to = json['to'] != null ? new To.fromJson(json['to']) : null;
    flowId = json['flow_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['verify_id'] = this.verifyId;
    if (this.to != null) {
      data['to'] = this.to.toJson();
    }
    data['flow_id'] = this.flowId;
    return data;
  }
}

class To {
  String mobile;
  String email;

  To({this.mobile, this.email});

  To.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    return data;
  }
}