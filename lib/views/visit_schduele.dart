import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sc_pharma_app/colors.dart';
import 'package:sc_pharma_app/widgets/card.dart';
import 'package:badges/badges.dart' as badge;
import 'package:sc_pharma_app/widgets/navigation_drawer.dart';

import '../widgets/colors.dart';

class VisitSchduele extends StatefulWidget {

  VisitSchduele( {super.key});
  @override
  State<VisitSchduele> createState() => _VisitSchdueleState();
}

class _VisitSchdueleState extends State<VisitSchduele> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Visit Scheduele",
        style: GoogleFonts.openSans(
          color: BUTTONCOLOR,
          fontWeight: FontWeight.w600,
          fontSize: 25
        ),
        ),
        iconTheme: IconThemeData(
            color: BUTTONCOLOR
        ),
      ),
      drawer: NavigationDrawerScreen(),
      body: Container(
        width: size.width,
        height: size.height,
        child: ListView.builder(itemBuilder: (ctx, index){
          var cardBgColor = index % 2 == 0 ? CARDGRADIENT : BUTTONCOLOR;
          return InkWell(
            onTap: (){
              showModal();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
              child: CustomCard(bgColor: cardBgColor, images: [
                Image.asset("assets/images/calendar.png", width: 25, height: 25, color: Colors.white,),
                Image.asset("assets/images/transaction.png", width: 25, height: 25, color: Colors.white,),
                Image.asset("assets/images/clinic.png", width: 25, height: 25, color: Colors.white,),
                Image.asset("assets/images/doctor.png", width: 25, height: 25, color: Colors.white,),
              ], fields: [
                "Fri 28-06-2024",
                "Trans.No",
                "Noor Clinic, Malir",
                "Dr. Atif",
              ],),
            ),
          );
        },
        itemCount: 7,
        ),
      ),
    );
  }
  showModal(){
    Size size = MediaQuery.of(context).size;
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    showDialog(context: context, builder: (ctx){
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.only(right: 5, left: 5, bottom: 5),
        content: badge.Badge(
          position: badge.BadgePosition.topEnd(top: -15),
          badgeStyle: badge.BadgeStyle(
            badgeColor: Colors.transparent
          ),
          //showBadge: false,
          badgeContent: InkWell(
            child: CircleAvatar(
              radius: 25,
              backgroundColor: BUTTONCOLOR,
              child: Text("x",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.white
                ),
              ),
            ),
            onTap: (){
              Navigator.pop(context);
            },
          ),

            child: Container(
              width: size.width,
              height: size.height * 0.85,
              decoration: BoxDecoration(
                gradient: CARDGRADIENT,
                borderRadius: BorderRadius.circular(20)
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.03,),
                      ListTile(
                        leading: Icon(Icons.transform_outlined,size: 25,color: Colors.white,),
                        title: Container(
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.black)
                            ),

                          ),
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.white
                            ),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.white),
                                hintText: "Trans No:"
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.02,),
                      ListTile(
                        leading: Image.asset("assets/images/calendar.png", width: 25, height: 25, color: Colors.white,),
                        title: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.black)
                            ),

                          ),
                          child: TextFormField(
                            cursorColor: Colors.white,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: InkWell(onTap: (){
                                showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime.now());
                              }, child: Image.asset("assets/images/calendar.png", width: 25, height: 25,color: Colors.white,),),
                              hintText: "Schedule Date",
                              hintStyle: TextStyle(color: Colors.white)

                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.02,),
                      ListTile(
                        leading: Image.asset("assets/images/clinic.png", width: 25, height: 25, color: Colors.white,),
                        title: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.black)
                              ),

                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Clinic",
                              suffixIcon: Icon(Icons.arrow_drop_down, color: Colors.white, size: 25,),
                              hintStyle: TextStyle(
                                color: Colors.white
                              ),
                            ),
                            cursorColor: Colors.white,
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.02,),
                      ListTile(
                        leading: Image.asset("assets/images/doctor.png", width: 25, height: 25, color: Colors.white,),
                        title: Container(
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.black)
                            ),

                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Doctor",
                              suffixIcon: Icon(Icons.arrow_drop_down, color: Colors.white, size: 25,),
                              hintStyle: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                            cursorColor: Colors.white,
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.02,),
                      ListTile(
                        leading: Icon(Icons.location_city,size: 25,color: Colors.white,),
                        title: Container(
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.black)
                            ),

                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Visit Type",
                              suffixIcon: Icon(Icons.arrow_drop_down, color: Colors.white, size: 25,),
                              hintStyle: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                            cursorColor: Colors.white,
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.02,),
                      ListTile(
                        leading: Image.asset("assets/images/comments.png", width: 25, height: 25, color: Colors.white,),
                        title: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.black)
                              ),

                          ),
                          child: TextFormField(
                            maxLines: 3,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Remarks",
                              hintStyle: TextStyle(
                                color: Colors.white
                              )
                            ),
                            cursorColor: Colors.white,
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.02,),
                      ListTile(
                        leading: Icon(
                          Icons.file_copy_rounded,
                          color: Colors.white,
                          size: 25,
                        ),
                        title: Container(
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.black)
                            ),

                          ),
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.white
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Results",
                              hintStyle: TextStyle(
                                color: Colors.white
                              ),
                              suffixIcon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                                size: 25,
                              )
                            ),
                            cursorColor: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.02,),
                      ListTile(
                        leading: Image.asset("assets/images/calendar.png", width: 25, height: 25, color: Colors.white,),
                        title: Container(
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.black)
                            ),

                          ),
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                suffixIcon: InkWell(onTap: (){
                                  showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime.now());
                                }, child: Image.asset("assets/images/calendar.png", width: 25, height: 25,color: Colors.white,),),
                                hintText: "Completion Date",
                                hintStyle: TextStyle(color: Colors.white)

                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.02,),
                      ElevatedButton(onPressed: (){}, child: Text("Submit", style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600
                      ),), style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                        ),
                        backgroundColor: BUTTONCOLOR
                      ),)
                    ],
                  ),
                ),
              ),
            ),

        ),
      );
    },
      barrierDismissible: false
    );
  }
}
