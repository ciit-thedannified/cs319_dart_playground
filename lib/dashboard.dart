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
        title: const Text('Bank Name',
          style: TextStyle(fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 237, 180, 6),
          ),
        ),
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
                  child: Column(
                  children: [
                    Text('Welcome!'),
                    Text('Your balance is: '),
                    ],
                  ),
                ),

              Wrap( // Buttons
              spacing: 8.0,
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.center,
                children: [                
                  ElevatedButton.icon(onPressed: () {}, 
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
            ],
          ),
          ),
        ),
      ),
    );
  }
}