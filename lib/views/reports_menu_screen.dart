import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widget/navigation_drawer.dart';

class ReportsMenuScreen extends StatelessWidget {
  const ReportsMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text('Reports Menu',style: GoogleFonts.openSans(
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xff2d2f44),
              )
          ),),
        ),
        iconTheme: const IconThemeData(color: Color(0xff2d2f44),),
      ),
      drawer: const NavigationDrawerScreen(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.04,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/images/visitcard.png'),
                      fit: BoxFit.fill
                    ),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  height: size.height * 0.12,
                  width: size.width,
                  child: Center(
                    child: Text('Visit Report',style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,

                      )
                    ),),
                  ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),

                child: Container(
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('assets/images/timelinecard.png'),
                          fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  height: size.height * 0.12,
                  width: size.width,
                  child: Center(
                    child: Text('Timeline Report',style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,

                        )
                    ),),
                  ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),


                child: Container(
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('assets/images/inventorycard.png'),
                          fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  height: size.height * 0.12,
                  width: size.width,
                  child: Center(
                    child: Text('Inventory In Hand',style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,

                        )
                    ),),
                  ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),

                child: Container(
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('assets/images/cliniccard.png'),
                          fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  height: size.height * 0.12,
                  width: size.width,
                  child: Center(
                    child: Text('Clinic List',style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,

                        )
                    ),),
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),

                child: Container(
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('assets/images/leadcard.png'),
                          fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  height: size.height * 0.12,
                  width: size.width,
                  child: Center(
                    child: Text('Lead Status',style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,

                        )
                    ),),
                  ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
