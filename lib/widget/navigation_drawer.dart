import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sc_pharma_app/views/login.dart';

class NavigationDrawerScreen extends StatelessWidget {
  const NavigationDrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   Size size = MediaQuery.of(context).size;
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [

            UserAccountsDrawerHeader(
              accountName: Text('Mr.Jawwad',style: GoogleFonts.openSans(
                textStyle: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff004C56),
                )
              ),),
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/drawer.png'),
                fit: BoxFit.cover),

              ), accountEmail: const Text(''),
            ),
            ListTile(
              leading: Image.asset('assets/images/taglocation.png',height: 25,),
              title: Text('Tag Your Location',style: GoogleFonts.openSans(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500

                )
              ),),
            ),
            ListTile(
              leading: Image.asset('assets/images/visitdrawer.png',height: 25,),
              title: Text('Visit',style: GoogleFonts.openSans(
                  textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500

                  )
              ),),
            ),
            ListTile(
              leading: Image.asset('assets/images/scheduledrawer.png',height: 25,),
              title: Text('Schedule',style: GoogleFonts.openSans(
                  textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500

                  )
              ),),
            ),
            ListTile(
              leading: Image.asset('assets/images/expensedrawer.png',height: 25,),
              title: Text('Expense Recording',style: GoogleFonts.openSans(
                  textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500

                  )
              ),),
            ),
            ListTile(
              leading: Image.asset('assets/images/reportdrawer.png',height: 25,),
              title: Text('Reports',style: GoogleFonts.openSans(
                  textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500

                  )
              ),),
            ),
             SizedBox(height: size.height * 0.2,),
             Padding(
               padding: const EdgeInsets.only(left: 18.0),
               child: Align(
                  alignment: Alignment.bottomLeft,
                  child: InkWell(
                    onTap: (){
                      Navigator.pushReplacement(context, PageTransition(child: const Login(), type: PageTransitionType.leftToRight));
                    },
                    child: Container(

                      height: size.height * 0.05,
                      width: size.width * 0.35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xff04899B),
                      ),
                      child: Center(
                        child: Text('LogOut',style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white
                            )
                        ),),
                      ),
                    ),
                  ),
                ),
             ),

          ],
        ),
      ),
    );
  }
}
