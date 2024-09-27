import 'package:flutter/material.dart';
import 'withdraw_cash.dart'; // Import the new file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ATM Withdraw',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: WithdrawCash(), // Use WithdrawCash as the home screen
    );
  }
}
