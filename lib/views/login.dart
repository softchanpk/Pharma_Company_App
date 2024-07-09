import'package:flutter/material.dart';
import'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sc_pharma_app/views/tag_location_screen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/loginback.png',
                ),
                fit: BoxFit.fill
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Card(
                    color: Colors.white,
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
                              SizedBox(height: size.height * 0.03,),
                                Text('Log In',
                                  style:GoogleFonts.openSans(
                                 textStyle: const TextStyle(fontWeight: FontWeight.bold,
                                   color: Color(0xff004C56),
                                   fontSize: 26,)
                               ),
                                ),
                              SizedBox(height: size.height * 0.04,),
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0,right: 12.0),
                                child: Container(
                                  height: size.height * 0.07,
                                  child: TextFormField(
                                    cursorColor: const Color(0xff004C56),
                                    decoration: const InputDecoration(
                                        focusedBorder:OutlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xff004C56)),
                                            borderRadius: BorderRadius.all(Radius.circular(12))
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(12)),
        
                                        ),
        
                                        hintText: 'Email',
                                        hintStyle: TextStyle(fontSize: 14)
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: size.height * 0.03,),
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0,right: 12.0),
                                child: Container(
                                  height: size.height * 0.07,
                                  child: TextFormField(
                                    cursorColor: const Color(0xff004C56),
                                    decoration: const InputDecoration(
                                        focusedBorder:OutlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xff004C56)),
                                            borderRadius: BorderRadius.all(Radius.circular(12))
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(12))
                                        ),
        
                                        hintText: 'Password',
                                        hintStyle: TextStyle(fontSize: 14)
                                    ),
        
                                  ),
                                ),
                              ),
                             // SizedBox(height: size.height * 0.01,),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: TextButton(onPressed: (){},
                                    child: Text('Forgot Password?',style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(fontSize: 12),
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff004C56)
                                    ),)),
                              ),
                              SizedBox(height: size.height * 0.03,),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, PageTransition(child: const TagLocationScreen(), type: PageTransitionType.rightToLeft));
                                },
                                child: Container(
                                  height: size.height * 0.06,
                                  width: size.width * 0.4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: const Color(0xff04899B),
                                  ),
                                  child: Center(
                                    child: Text('LogIn',style: GoogleFonts.openSans(
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
}
