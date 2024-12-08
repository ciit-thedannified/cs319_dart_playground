import 'package:flutter/material.dart';
import 'dart:io';  // For exiting the app

class WithdrawCash extends StatefulWidget {
  @override
  _WithdrawCashState createState() => _WithdrawCashState();
}

class _WithdrawCashState extends State<WithdrawCash> {
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
        SnackBar(content: Text('Please enter a valid amount.'))
      );
      return;
    }

    if (amount > _balance) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Insufficient funds. Current balance: $_balance'))
      );
      return;
    }

    // Deduct the amount from balance
    setState(() {
      _balance -= amount;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Withdrawal successful. Remaining balance: $_balance'))
    );
    _amountController.clear(); // Clear the amount input after successful withdrawal
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ATM Withdraw'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (!_isPinCorrect) ...[
              TextField(
                controller: _pinController,
                decoration: InputDecoration(
                  labelText: 'Enter PIN',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _checkPin,
                child: Text('Enter'),
              ),
            ] else ...[
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Withdraw Cash',
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(height: 10),
                      Text('Select an amount to withdraw'),
                      TextField(
                        controller: _amountController,
                        decoration: InputDecoration(
                          labelText: 'Enter amount',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: _withdrawCash,
                        child: Text('Withdraw'),
                      ),
                      SizedBox(height: 10),
                      Text('Current Balance: \$$_balance'),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
