
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sc_pharma_app/views/tag_location_screen.dart';

class LoginController extends GetxController{

  var isHidePassword = true.obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  bool isLoading = false;
  var userId;
  var userName;

 Future<bool> loginApiController() async{
   isLoading = true;
   update();
   try{
     Uri uri = Uri.http("sc9.indus-erp.com:1251", "/ords/indus6/log/login",
         {"usrid": emailController.value.text,
           "password": passwordController.value.text
         });
     var response = await http.get(uri);
     var data = jsonDecode(response.body.toString());
     userId = data['items'][0]['usrid'];
     userName = data['items'][0]['usrname'];
     print(userId);
     print(userName);
     if(kDebugMode){
       print(response.statusCode);
       print(data.toString());
       print(userId);
       print(userName);
     }
     if(response.statusCode == 200){
       isLoading = false;
       update();

       if(data['items'].length > 0 ){

         return true;
       }
       else{
         return false;
       }


     }
     else{
       isLoading = false;
       update();
       Get.snackbar('Please Enter Correct Credentials', data['error'],
         snackPosition: SnackPosition.BOTTOM,
         colorText: Colors.white,
         backgroundColor: Color(0xff420331),);

     }
   }
       catch(e){
         isLoading = false;
         update();
      if(kDebugMode){
        print(e.toString());
      }
      Get.snackbar('Login Failed', e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Color(0xff420331),);

       }
      return false;
 }

}