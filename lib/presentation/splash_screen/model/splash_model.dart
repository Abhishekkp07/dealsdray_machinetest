class SplashModel {
  int? status;
  Data? data;

  SplashModel({this.status, this.data});

  SplashModel.fromJson(Map<String, dynamic> json) {
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
  String? deviceId;

  Data({this.message, this.deviceId});

  Data.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    deviceId = json['deviceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['deviceId'] = this.deviceId;
    return data;
  }
}
