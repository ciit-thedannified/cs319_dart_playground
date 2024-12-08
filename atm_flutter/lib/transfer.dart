import 'package:flutter/material.dart';

class Transfer extends StatefulWidget {
  const Transfer({super.key});

  @override
  _TransferState createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  // Define TextEditingController for the Account and Amount fields
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  void dispose() {
    // Dispose the controllers when not needed to free up resources
    _accountController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer Money'),
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
                    'Transfer Money',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Enter Account No.:',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Use the account controller
                  TextField(
                    controller: _accountController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Enter Amount to Transfer:',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Use the amount controller
                  TextField(
                    controller: _amountController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Retrieve input values
                      String inputAccount = _accountController.text;
                      String inputAmount = _amountController.text;

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Confirmation(
                              account: inputAccount,
                              amount: inputAmount,
                            )),
                      );
                    },
                    child: const Text('Proceed'),
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

class Confirmation extends StatelessWidget {

  final String account;
  final String amount;

  const Confirmation({
    super.key,
    required this.account,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmation'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                elevation: 5,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Column(
                    children: [
                      Text('You are about to send Php$amount to Account No. #$account'),
                    ],
                  ),
                ),
              ),
              const Text(
                'Are you sure you want to proceed?',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the Success page with account and amount details
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Success(
                      account: account,
                      amount: amount,
                    )),
                  );
                },
                child: const Text('Confirm'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Navigate back to the Transfer page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Transfer()),
                  );
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Success extends StatelessWidget {

  final String account;
  final String amount;

  const Success({
    super.key,
    required this.account,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                elevation: 5,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Column(
                    children: [
                      Text('STATUS: SUCCESS'),
                      Text('TRANSACTION DATE: ...'),
                      Text('TRANSACTION TYPE: Transfer Money'),
                      Text('MESSAGE: Transferred Php $amount to Account No. $account'),
                      Text('OLD BALANCE:...'),
                      Text('NEW BALANCE:...'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Transfer()),
                  );
                },
                child: const Text('Proceed'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
