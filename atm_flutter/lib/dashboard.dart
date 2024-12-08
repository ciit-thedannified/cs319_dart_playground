import 'package:cs319_dart_playground/deposit.dart';
import 'package:cs319_dart_playground/main.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Bangko de Boiser',
          style: TextStyle(fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 237, 180, 6),
          ),
        ),

        // Logout
        actions: <Widget> [
          IconButton(onPressed: () { // Navigate to the previous screen (Login Page)
            Navigator.pop(context);
          }, 
          icon: const Icon(Icons.logout))
        ],
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8,
            shadowColor: Colors.yellow,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
            ),

            child: Column( // Profile
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  margin: EdgeInsets.all(22.0),
                  elevation: 5,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Column(
                  children: [
                    Text('Welcome User!'),
                    Text('Your balance is: PHP...'),
                    ],
                  ),
                  ),
                ),

              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
                child: Wrap( // Buttons
                spacing: 15.0,
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    ElevatedButton.icon(onPressed: () {
                      // Navigate to Deposit Page
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Deposit()),
                      );
                    }, 
                    icon: Icon(Icons.add_card), 
                    label: Text('Deposit Money')),

                    ElevatedButton.icon(onPressed: () {}, 
                    icon: Icon(Icons.arrow_circle_right_outlined),
                    label: Text('Transfer Money')),

                    ElevatedButton.icon(onPressed: () {}, 
                    icon: Icon(Icons.monetization_on_outlined),
                    label: Text('Withdraw Cash')),

                    ElevatedButton.icon(onPressed: () {}, 
                    icon: Icon(Icons.text_snippet_outlined),
                    label: Text('Pay Bills')),

                    ElevatedButton.icon(onPressed: () {}, 
                    icon: Icon(Icons.abc),
                    label: Text('Change Pin')),
                ],
                ),
              ),
              
            ],
          ),
          ),
        ),
      ),
    );
  }
}