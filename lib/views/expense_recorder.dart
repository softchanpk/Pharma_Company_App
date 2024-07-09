import 'package:flutter/material.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(child: Image.asset("assets/images/drawer_icon.png")),
        title: Text("Expense Recorder",
        style: TextStyle(
          color: TITLECOLOR,
          fontWeight: FontWeight.w400,
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
            child: CustomCard(bgColor: cardBgColor),
          );
        },
        itemCount: 7,
        ),
      ),
    );
  }
}
