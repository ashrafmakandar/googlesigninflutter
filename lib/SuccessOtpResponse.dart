class SuccessOtpReposne {
  Data data;

  SuccessOtpReposne({this.data});

  SuccessOtpReposne.fromJson(Map<String, dynamic> json) {
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
  String message;

  Data({this.verifyId, this.message});

  Data.fromJson(Map<String, dynamic> json) {
    verifyId = json['verify_id'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['verify_id'] = this.verifyId;
    data['message'] = this.message;
    return data;
  }
}