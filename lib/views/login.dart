import 'dart:convert';

import'package:flutter/material.dart';
import 'package:get/get.dart';
import'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sc_pharma_app/controller/login_controller.dart';
import 'package:sc_pharma_app/views/tag_location_screen.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  LoginController controller = Get.put(LoginController());
  bool _isLoading = false;
  late String _email;
  late String _password;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xff420331),
                      Color(0xffca589d),
                      Color(0xff420331),
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight

                )
              /* image: DecorationImage(
                image: AssetImage('assets/images/loginback2.png',
                ),
                fit: BoxFit.fill
              )*/
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset('assets/images/logo.png',height: size.height * 0.2,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0 ,),
                  child: Card(
                    color: Colors.white38,
                      child: Container(
                        height: size.height * 0.5,
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: size.height * 0.02,),
                                Text('Log In',
                                  style:GoogleFonts.openSans(
                                 textStyle: const TextStyle(fontWeight: FontWeight.bold,
                                   color: Color(0xff2d2f44),
                                   fontSize: 26,)
                               ),
                                ),
                              SizedBox(height: size.height * 0.04,),
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0,right: 12.0),
                                child: Container(
                                  height: size.height * 0.07,
                                  child: TextFormField(

                                    cursorColor: const Color(0xff2d2f44),
                                    decoration: const InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        prefixIcon: Icon(Icons.account_circle_outlined,color: Color(0xff2d2f44),size: 20,),
                                        focusedBorder:OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(15))
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(15)),
        
                                        ),
        
                                        hintText: 'Email',
                                        hintStyle: TextStyle(fontSize: 14)

                                    ),
                                      validator: (val){
                                        if(_email.isEmpty){
                                          return "Please provide valid username";
                                        }
                                        return null;
                                      },
                                      onSaved: (val) {
                                        _email = val!;
                                      }

                                  ),
                                ),
                              ),
                              SizedBox(height: size.height * 0.03,),
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0,right: 12.0),
                                child: Container(
                                  height: size.height * 0.07,
                                  child: Obx((){
                                    return TextFormField(
                                    obscureText: controller.isHidePassword.value,
                                    cursorColor: const Color(0xff2d2f44),
                                    decoration:  InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        prefixIcon: const Icon(Icons.vpn_key_outlined,color: Color(0xff2d2f44),size: 20,),
                                        suffixIcon: InkWell(
                                            onTap: (){
                                              controller.isHidePassword.value = !controller.isHidePassword.value;
                                            },
                                            child: Icon(
                                              controller.isHidePassword.value ?
                                              Icons.visibility_off_outlined :
                                              Icons.visibility_outlined,
                                              color: const Color(0xff2d2f44),
                                              size: 20,
                                            )),
                                        focusedBorder:const OutlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xff2d2f44)),
                                            borderRadius: BorderRadius.all(Radius.circular(15))
                                        ),
                                        border: const OutlineInputBorder(
                                            borderSide: BorderSide(color:Colors.white),
                                            borderRadius: BorderRadius.all(Radius.circular(15))
                                        ),

                                        hintText: 'Password',
                                        hintStyle: const TextStyle(fontSize: 14)
                                    ),
                                        validator: (val){
                                          if(_password.isEmpty){
                                            return "Please provide password";
                                          }
                                          return null;
                                        },
                                        onSaved: (val) {
                                          _password = val!;
                                        }
                                  );
                                  })
                                ),
                              ),
                             // SizedBox(height: size.height * 0.01,),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0,right: 18.0),
                                  child: Text('Forgot Password?',style: GoogleFonts.openSans(
                                    textStyle: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff2d2f44)
                                    )
                                  ),),
                                )
                              ),
                              SizedBox(height: size.height * 0.03,),
                              InkWell(
                                onTap: (){
                                  login();
                                  },
                                child: Container(
                                  height: size.height * 0.06,
                                  width: size.width * 0.4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color(0xff2d2f44),
                                  ),
                                  child: Center(
                                    child: _isLoading ? Center(child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),) : Text('LogIn',style: GoogleFonts.openSans(
                                      textStyle: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white
                                      )
                                    ),),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ),
                
              ],
            )
          ),
      ),

    );
  }
  Future<void> login() async{
    var currentState = _formKey.currentState!;
    currentState.save();
    bool isValid = currentState.validate();
    if(isValid){
      _isLoading = true;
      setState(() {

      });
    }
    try{
      Uri uri = Uri.http("sc9.indus-erp.com:1251", "/ords/indus6/log/login",
          {"usrid": _email, "password": _password});
      var response = await http.get(uri);
      var res = jsonDecode(response.body);
      print(response.statusCode);
      print(res);
      if(response.statusCode == 200){

        Navigator.pushReplacement(context, PageTransition(child: TagLocationScreen(), type: PageTransitionType.rightToLeft));

      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Color(0xff420331),
            content: Text("Please enter correct credentials",style: TextStyle(
                color: Colors.white
            ),)));
        setState(() {
          _isLoading = false;
        });
      }

    }
        catch(e){
        print(e.toString());
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Color(0xff420331),
          content: Text("Login Failed",style: TextStyle(
            color: Colors.white,
          ),
          ),
        ),
        );
        setState(() {
          _isLoading = false;
        },
        );

    }

  }


}
