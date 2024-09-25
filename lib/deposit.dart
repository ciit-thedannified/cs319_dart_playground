import 'package:cs319_dart_playground/main.dart';
import 'package:flutter/material.dart';

class Deposit extends StatefulWidget{
  const Deposit({super.key});

  @override
  _DepositState createState() => _DepositState();
}

class _DepositState extends State<Deposit> {
  final TextEditingController _amountController = TextEditingController();
  double _balance = 10.00; 

  void _depositMoney(){
    final String iamount = _amountController.text;
    double? amount = double.tryParse(iamount);

    if(amount == null || amount <= 0){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar (content: Text('Invalid Amount!')),
      );

    }else {
      setState(() {
        _balance += amount;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Successfully Deposited \$${amount.toStringAsFixed(2)}. New Balance: \$${_balance.toStringAsFixed(2)}')),
      );
    }
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deposit Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 5, 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Welcome!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Your current balance is: \$${_balance.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _amountController,
                    decoration: const InputDecoration(
                      labelText: 'Deposit Amount',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _depositMoney,
                    child: const Text('Deposit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
