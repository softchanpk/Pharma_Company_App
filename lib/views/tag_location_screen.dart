
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sc_pharma_app/widgets/navigation_drawer.dart';

class TagLocationScreen extends StatefulWidget {

  TagLocationScreen({super.key});
  @override
  State<TagLocationScreen> createState() => _TagLocationScreenState();
}

class _TagLocationScreenState extends State<TagLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text('Tag Your Location',style: GoogleFonts.openSans(
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xff2d2f44),
            )
          ),),
        ),
        iconTheme: const IconThemeData(color: Color(0xff2d2f44),),
      ),
      drawer: NavigationDrawerScreen(),
      body: Center(child: Text('Bilal'),),
    );
  }
}
