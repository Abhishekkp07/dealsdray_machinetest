
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinetest_intern/presentation/login_screen/view/login_page.dart';

import '../controller.dart';




class Splash_screen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _Splash_screenState();
}
class _Splash_screenState extends State<Splash_screen>{
  final PhoneController phoneController=Get.put(PhoneController());
  @override
  void initState() {

    Timer(Duration(seconds: 4), () {
      phoneController.splashscreenFunction();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login_page()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child:
        Image.asset("assets/icons/dealsdray.png"),

      ),
    );
  }
}