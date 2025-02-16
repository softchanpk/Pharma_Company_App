import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sc_pharma_app/views/create_visit.dart';
import 'package:sc_pharma_app/views/expense_recorder.dart';
import 'package:sc_pharma_app/views/login.dart';
import 'package:sc_pharma_app/views/reports_menu_screen.dart';
import 'package:sc_pharma_app/views/tag_location_screen.dart';
import 'package:sc_pharma_app/views/visit_schduele.dart';

class NavigationDrawerScreen extends StatelessWidget {
  String? userId,userName;
  NavigationDrawerScreen(String userId,String userName){
    this.userId = userId;
    this.userName = userName;
  }
  @override
  Widget build(BuildContext context) {
   Size size = MediaQuery.of(context).size;
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [

            UserAccountsDrawerHeader(
              accountName: Text(userId!,style: GoogleFonts.openSans(
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff2d2f44),
                )
              ),),
              decoration: const BoxDecoration(
                /*image: DecorationImage(image: AssetImage('assets/images/drawerback.png'),
                fit: BoxFit.cover),
*/            gradient: LinearGradient(
                  colors: [
                    Color(0xff420331),
                    Color(0xffca589d),
                   // Color(0xff420331),


                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                /*  stops: [
                    0.1,
                    0.1,
                    0.0
                  ]*/

              )
              ), accountEmail: const Text(''),
            ),
            InkWell(
              onTap: (){
                Navigator.pushReplacement(context, PageTransition(child: TagLocationScreen(userId!,userName!), type: PageTransitionType.rightToLeft));
              },
              child: ListTile(
                leading: Image.asset('assets/images/taglocation.png',height: 25,color: const Color(0xff420331),),
                title: Text('Tag Your Location',style: GoogleFonts.openSans(
                  textStyle: const TextStyle(
                    fontSize: 16,
                      color: Color(0xff2d2f44),
                      fontWeight: FontWeight.w700

                  )
                ),),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.pushReplacement(context, PageTransition(child: VisitSchduele(userId!,userName!), type: PageTransitionType.rightToLeft));
              },
              child: ListTile(
                leading: Image.asset('assets/images/visitdrawer.png',height: 25,color: const Color(0xff420331),),
                title: Text('Visit',style: GoogleFonts.openSans(
                    textStyle: const TextStyle(
                        fontSize: 16,
                        color: Color(0xff2d2f44),
                        fontWeight: FontWeight.w700

                    )
                ),),
              ),
            ),
            InkWell(
              child: ListTile(
                leading: Image.asset('assets/images/scheduledrawer.png',height: 25,color: const Color(0xff420331),),
                title: Text('New Schedule',style: GoogleFonts.openSans(
                    textStyle: const TextStyle(
                        fontSize: 16,
                        color: Color(0xff2d2f44),
                        fontWeight: FontWeight.w700

                    )
                ),),
              ),
              onTap: (){
                // new schedule
                Navigator.pushReplacement(context, PageTransition(child: CreateVisitForm(userId!,userName!), type: PageTransitionType.rightToLeft));
              },
            ),
            InkWell(
              onTap: (){
                Navigator.pushReplacement(context, PageTransition(child: ReportsMenuScreen(userId!,userName!), type: PageTransitionType.rightToLeft));
              },
              child: ListTile(
                leading: Image.asset('assets/images/reportdrawer.png',height: 25,color: const Color(0xff420331),),
                title: Text('Reports',style: GoogleFonts.openSans(
                    textStyle: const TextStyle(
                        color: Color(0xff2d2f44),
                        fontSize: 16,
                        fontWeight: FontWeight.w700

                    )
                ),),
              ),
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
                        color: const Color(0xff2d2f44),
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
