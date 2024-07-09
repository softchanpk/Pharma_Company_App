import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sc_pharma_app/colors.dart';
import 'package:sc_pharma_app/widgets/card.dart';

class ExpenseRecorder extends StatefulWidget {

  @override
  State<ExpenseRecorder> createState() => _ExpenseRecorderState();
}

class _ExpenseRecorderState extends State<ExpenseRecorder> {
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
        title: Text("Expense Recorder",
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
              Image.asset("assets/images/transaction.png", width: 25, height: 25,),
              Image.asset("assets/images/expenses.png", width: 25, height: 25,),
              Image.asset("assets/images/rs.png", width: 25, height: 25,),
            ], fields: [
              "Fri 28-05-2024",
              "Trans.No., T01",
              "Food",
              "350",
            ],),
          );
        },
        itemCount: 7,
        ),
      ),
    );
  }
}
