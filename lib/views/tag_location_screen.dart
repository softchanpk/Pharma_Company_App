import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sc_pharma_app/widget/navigation_drawer.dart';

class TagLocationScreen extends StatefulWidget {
  const TagLocationScreen({Key? key}) : super(key: key);

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
              color: Color(0xff004C56),
            )
          ),),
        ),
        iconTheme: const IconThemeData(color: Color(0xff004C56),),
      ),
      drawer: const NavigationDrawerScreen(),
      body: const Center(child: Text('Welcome'),),
    );
  }
}
