import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sc_pharma_app/colors.dart';
import 'package:sc_pharma_app/widgets/card.dart';

class VisitSchduele extends StatefulWidget {

  @override
  State<VisitSchduele> createState() => _VisitSchdueleState();
}

class _VisitSchdueleState extends State<VisitSchduele> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: (){},
        child: CircleAvatar(
          radius: 30,
          backgroundColor: CARDBGCYAN,
          child: Text("+",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700
          ),
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.menu,
          color: DRAWERICONCOLOR,
            size: 30,
          ),
          onPressed: (){

          },
        ),
        title: Text("Visit Scheduele",
        style: GoogleFonts.openSans(
          color: TITLECOLOR,
          fontWeight: FontWeight.w600,
          fontSize: 25
        ),
        ),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: ListView.builder(itemBuilder: (ctx, index){
          Color cardBgColor = index % 2 == 0 ? CARDBGCYAN : CARDBGGREY;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: CustomCard(bgColor: cardBgColor, images: [
              Image.asset("assets/images/calendar.png", width: 25, height: 25,),
              Image.asset("assets/images/map_pin.png", width: 25, height: 25,),
              Image.asset("assets/images/goal.png", width: 25, height: 25,),
              Image.asset("assets/images/check.png", width: 25, height: 25,),
            ], fields: [
              "Fri 28-06-2024",
              "Imam Clinic, Malir",
              "Purpose",
              "Status, Completed",
            ],),
          );
        },
        itemCount: 7,
        ),
      ),
    );
  }
}
