class GenerteOtp {
  String flowId;
  To to;

  GenerteOtp({this.flowId, this.to});

  GenerteOtp.fromJson(Map<String, dynamic> json) {
    flowId = json['flow_id'];
    to = json['to'] != null ? new To.fromJson(json['to']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flow_id'] = this.flowId;
    if (this.to != null) {
      data['to'] = this.to.toJson();
    }
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