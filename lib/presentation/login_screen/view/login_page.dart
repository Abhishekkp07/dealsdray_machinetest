import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:machinetest_intern/global_widgets/textfield.dart';

import '../../splash_screen/controller.dart';

class Login_page extends StatelessWidget {
   Login_page({super.key});

  final TextEditingController textController=TextEditingController();

  final PhoneController phoneController=Get.put(PhoneController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/icons/dealsdray.png"),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20
                ),
                child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Glad to see you!",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Please provide your phone number"),
                    SizedBox(height: 35,),
                    TypeField(
                      hintText: "Phone",
                      controller:textController,
                    ),
                    SizedBox(height: 20,),
                   Center(
                     child: MaterialButton(onPressed: (){
                       phoneController.phoneNumberAuthentication(phone: textController.text);
                     },
                       color: Colors.red,
                     child: Text('SEND CODE',style: TextStyle(color: Colors.white,fontSize: 20),),),
                   )
        
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
