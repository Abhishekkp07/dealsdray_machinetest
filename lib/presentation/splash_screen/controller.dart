import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:machinetest_intern/presentation/login_screen/model/getotp_model.dart';

import '../../app_config/app_config.dart';

import 'model/splash_model.dart';

class PhoneController extends GetxController {

  var isLoading = true.obs;
  Rx<SplashModel> splashModel = SplashModel().obs;
  Rx<GetotpModel> getotpModel = GetotpModel().obs;


  Future<void> splashscreenFunction() async {
    var body = {
      "deviceType": "andriod",
      "deviceId": "C6179909526098",
      "deviceName": "Samsung-MT200",
      "deviceOSVersion": "2.3.6",
      "deviceIPAddress": "11.433.445.66",
      "lat": 9.9312,
      "long": 76.2673,
      "buyer_gcmid": "",
      "buyer_pemid": "",
      "app": {
        "version": "1.20.5",
        "installTimeStamp": "2022-02-10T12:33:30.696Z",
        "uninstallTimeStamp": "2022-02-10T12:33:30.696Z",
        "downloadTimeStamp": "2022-02-10T12:33:30.696Z"
      }
    };
    try {
      final request = await http.post(
        Uri.parse("${baseUrl.value}v2/user/device/add"),
        body: jsonEncode(body),
        headers: {"Content-Type": "application/json"},
      );
      log(request.statusCode.toString());
      log(request.body.toString());

      if (request.statusCode == 200) {
        Map<String, dynamic> responseData = json.decode(request.body);
        splashModel.value = SplashModel.fromJson(responseData);
        log("message: ${splashModel.value.data}");
        Get.snackbar(
          backgroundColor: Colors.green,
          'Success',
          '${splashModel.value.data?.message}',

          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Error',
          'failed to load',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      log("$e");
      Get.snackbar(
        'Error',
        'failed to load.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> phoneNumberAuthentication({required String phone}) async {
    log("phone : $phone");
    var body = {
      "mobileNumber": phone,
      "deviceId": "${splashModel.value.data?.deviceId}"
    };
    try {
      final request = await http.post(
        Uri.parse("${baseUrl.value}v2/user/otp"),
        body: jsonEncode(body),
        headers: {"Content-Type": "application/json"},
      );
      log(request.statusCode.toString());
      log(body.toString());

      if (request.statusCode == 200) {
        Map<String, dynamic> responseData = json.decode(request.body);
        getotpModel.value = GetotpModel.fromJson(responseData);
        log("message: ${getotpModel.value.data?.message}");
        Get.snackbar(

          'Success',
          '${getotpModel.value.data?.message}',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Error',
          'Failed to send OTP.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      log("$e");
      Get.snackbar(
        'Error',
        'An error occurred while sending OTP.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }
}


