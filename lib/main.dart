import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:machinetest_intern/presentation/splash_screen/view/splash_screen.dart';

void main(){
  Get.testMode=true;
  runApp(GetMaterialApp(home: Splash_screen(),));
}