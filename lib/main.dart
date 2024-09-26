import 'package:flutter/material.dart';
import 'dart:io';  // For exiting the app

void main() => runApp(ATMApp());

class ATMApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WithdrawScreen(),
    );
  }
}

class WithdrawScreen extends StatefulWidget {
  @override
  _WithdrawScreenState createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  int _failedAttempts = 0;
  final String _correctPin = "1234"; // Example correct pin
  bool _isPinCorrect = false; // Track if PIN is correct
  double _balance = 1000; // Example starting balance

  void _checkPin() {
    if (_pinController.text == _correctPin) {
      // PIN is correct, show the "Withdraw Cash" section
      setState(() {
        _isPinCorrect = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Pin Correct. Proceeding to withdraw...'))
      );
    } else {
      // Increment failed attempts and show error
      _failedAttempts++;
      if (_failedAttempts >= 3) {
        exit(0); // Exit the app after 3 failed attempts
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Wrong Pin. ${3 - _failedAttempts} attempts left'))
        );
      }
    }
    _pinController.clear(); // Clear input after each attempt
  }

  void _withdrawCash() {
    double amount = double.tryParse(_amountController.text) ?? 0;
    if (amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid amount'))
      );
      return;
    }
    
    if (_balance >= amount) {
      // Withdraw Cash
      setState(() {
        _balance -= amount;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Successfully withdrew \$$amount. Remaining balance: \$$_balance')),
      );
      _amountController.clear(); // Amount to clear after withdrawal
    } else {
      // Insufficient balance
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Insufficient balance to withdraw \$${amount}. Your balance is \$$_balance.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ATM Withdraw')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Enter PIN Section
            if (!_isPinCorrect)
              Column(
                children: [
                  TextField(
                    controller: _pinController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Enter PIN',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _checkPin,
                    child: Text('Enter'),
                  ),
                ],
              ),

            // Withdraw Cash Section (shown only after correct PIN entry)
            if (_isPinCorrect)
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text('Withdraw Cash', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      Text('Enter the amount you wish to withdraw'),
                      SizedBox(height: 10),
                      TextField(
                        controller: _amountController,
                        decoration: InputDecoration(
                          labelText: 'Amount',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _withdrawCash,
                        child: Text('Withdraw'),
                      ),
                      SizedBox(height: 20),
                      Text('Current Balance: \$$_balance', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
