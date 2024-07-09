import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Color bgColor;
  CustomCard({required this.bgColor});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.25,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        children: [
          Expanded(child: ListTile(
            leading: Image.asset("assets/images/transaction.png"),
            title: Text("Trans.No., T01"),
          )),
          Expanded(child: ListTile(
            leading: Image.asset("assets/images/expenses.png"),
            title: Text("Food"),
          )),
          Expanded(child: ListTile(
            leading: Image.asset("assets/images/rs.png"),
            title: Text("350"),
          )),
          Expanded(child: ListTile(
            leading: Image.asset("assets/images/calendar.png"),
            title: Text("Fri 28-05-2024"),
          ))
        ],
      ),
    );
  }
}
