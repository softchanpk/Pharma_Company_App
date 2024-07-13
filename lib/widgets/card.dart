import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCard extends StatelessWidget {
  final bgColor;
  final List<Image> images;
  final List<String> fields;
  CustomCard({required this.bgColor, required this.images, required this.fields});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.21,
      decoration: BoxDecoration(
        color: bgColor is Color ? bgColor : null,
        borderRadius: BorderRadius.circular(15),
        gradient: bgColor is LinearGradient ? bgColor : null
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: Column(

          children: _generateItems(),
        ),
      ),
    );
  }
  List<Widget> _generateItems(){
   return List.generate(images.length, (index){
      return Expanded(child: ListTile(
          minVerticalPadding: 0,
          leading: images[index],
          title: Text(fields[index],
          style: GoogleFonts.openSans(
            color: Colors.white,
            fontSize: 14
          ),
          ),
        ),
      );
    });
  }
}
