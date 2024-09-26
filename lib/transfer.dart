import 'package:cs319_dart_playground/main.dart';
import 'package:flutter/material.dart';

class Transfer extends StatefulWidget {
  const Transfer({super.key});

  @override
  _TransferState createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
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
                  Text(
                    'Enter User ID:',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Enter Amount to Transfer:',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: (){

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Confirmation()),
                      );
                    },
                    child: const Text('Procees '),
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


class Confirmation extends StatefulWidget {
  const Confirmation({super.key});

  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {

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
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Column(
                    children: [
                      Text('You are about to send...'),

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
                onPressed: (){

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Success()),
                  );
                },
                child: const Text('Confirm'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: (){

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



class Success extends StatefulWidget {
  const Success({super.key});

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {

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
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Column(
                    children: [
                      Text('STATUS: SUCCESS'),
                      Text('TRANSACTION DATE:...'),
                      Text('TRANSACTION TYPE: Transfer Money'),
                      Text('MESSAGE: Transferred... to ...'),
                      Text('OLD BALANCE:...'),
                      Text('NEW BALANCE:...'),

                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: (){

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

