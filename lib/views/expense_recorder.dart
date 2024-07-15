import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sc_pharma_app/colors.dart';
import 'package:sc_pharma_app/widgets/card.dart';
import 'package:badges/badges.dart' as badge;
import 'package:sc_pharma_app/widgets/navigation_drawer.dart';

import '../widgets/colors.dart';

class ExpenseRecorder extends StatefulWidget {
  String? userId,userName;
  ExpenseRecorder(String userId,String userName){
    this.userId = userId;
    this.userName = userName;
  }
  @override
  State<ExpenseRecorder> createState() => _ExpenseRecorderState();
}

class _ExpenseRecorderState extends State<ExpenseRecorder> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Expense Recorder",
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
      drawer: NavigationDrawerScreen(widget.userId!,widget.userName!),
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
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: CustomCard(bgColor: cardBgColor, images: [
                Image.asset("assets/images/calendar.png", width: 25, height: 25, color: Colors.white),
                Image.asset("assets/images/transaction.png", width: 25, height: 25, color: Colors.white),
                Image.asset("assets/images/expenses.png", width: 25, height: 25, color: Colors.white),
                Image.asset("assets/images/rs.png", width: 25, height: 25, color: Colors.white),
              ], fields: [
                "Fri 28-05-2024",
                "Trans.No., T01",
                "Food",
                "350",
              ],
              ),
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
          child: SingleChildScrollView(
            child: Container(
              width: size.width,
              height: size.height * 0.85,
              decoration: BoxDecoration(
                  gradient: CARDGRADIENT,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.05,),
                    ListTile(
                      leading: Image.asset("assets/images/transaction.png", width: 25, height: 25, color: Colors.white,),
                      title: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.black)
                            ),

                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Trans.no"
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03,),
                    ListTile(
                      leading: Image.asset("assets/images/calendar.png", width: 25, height: 25, color: Colors.white,),
                      title: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.black)
                            ),

                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: InkWell(onTap: (){
                                showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime.now());
                              }, child: Image.asset("assets/images/calendar.png", width: 25, height: 25,),),
                              hintText: "Date"
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03,),
                    ListTile(
                      leading: Image.asset("assets/images/expenses.png", width: 25, height: 25, color: Colors.white),
                      title: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.black)
                            ),

                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Purpose"
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03,),
                    ListTile(
                      leading: Image.asset("assets/images/rs.png", width: 25, height: 25, color: Colors.white,),
                      title: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.black)
                            ),

                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "0"
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03,),
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
