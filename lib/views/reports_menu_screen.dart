import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widget/navigation_drawer.dart';

class ReportsMenuScreen extends StatelessWidget {
  const ReportsMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text('Reports Menu',style: GoogleFonts.openSans(
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xff004C56),
              )
          ),),
        ),
        iconTheme: const IconThemeData(color: Color(0xff004C56),),
      ),
      drawer: const NavigationDrawerScreen(),
      body: const Column(
        children: [

        ],
      )
    );
  }
}
