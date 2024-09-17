class GetotpModel {
  int? status;
  Data? data;

  GetotpModel({this.status, this.data});

  GetotpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? message;
  String? userId;
  String? deviceId;

  Data({this.message, this.userId, this.deviceId});

  Data.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userId = json['userId'];
    deviceId = json['deviceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['userId'] = this.userId;
    data['deviceId'] = this.deviceId;
    return data;
  }
}
