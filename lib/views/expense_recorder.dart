import 'package:flutter/material.dart';
import 'package:sc_pharma_app/colors.dart';

class ExpenseRecorder extends StatefulWidget {
  const ExpenseRecorder({super.key});

  @override
  State<ExpenseRecorder> createState() => _ExpenseRecorderState();
}

class _ExpenseRecorderState extends State<ExpenseRecorder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/drawer_icon.png"),
        title: const Text("Expense Recorder",
        style: TextStyle(
          color: TITLECOLOR
        ),
        ),
      ),
    );
  }
}
