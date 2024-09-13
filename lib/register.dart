import 'package:flutter/material.dart';

void main() {
  runApp(const RegisterApp());
}

class RegisterApp extends StatelessWidget {
  const RegisterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register Application',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true
      ),
      home: const RegisterPage(title: 'Register'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.title});

  final String title;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _emailField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /*
            TASK #4 - Jan Carlo P. Pastor
            TODO: Create a TextField for 'username' here.

            INSTRUCTIONS:
            >> The text field must have its text label above, and is connected to its respective controller.
             */

            // TASK #4 STARTS HERE
            Wrap(
                children: <Widget>[

                  const Text('Username'),
                  TextField(
                    controller: _emailField, // assign a TextEditingController here.
                    showCursor: true,

                    decoration: InputDecoration(
                      hintText: 'Username', // Placeholder
                      hintStyle: TextStyle(color: Colors.grey), // Placeholder decorations
                    ),
                  )

                ],
            ),
            // TASK #4 ENDS HERE

            /*
            TASK #5 - DANNE URIEL BOISER
            TASK #5 - DANNE URIEL BOISER
            TODO: Create a TextField for 'email' here.

            INSTRUCTIONS:
            >> The text field must have its text label above, and is connected to its respective controller.
             */

            // TASK #5 STARTS HERE
            Row(
              children: <Widget>[
            Row(
              children: <Widget>[

              ],
              ],
            ),
            // TASK #5 ENDS HERE

            /*
            TASK #6 - AGOS BORJA
            TASK #6 - AGOS BORJA
            TODO: Create a TextField for 'password' here.

            INSTRUCTIONS:
            >> Similar to TASK #1, but build the code yourself.
            >> Similar to TASK #1, but build the code yourself.
            >> In practice, widgets must always have a trailing comma (,) after writing the code.
            >> The TextField must have 'obscuredText' prop enabled; 'obscuringCharacter' prop must be asterisk (*)
             */

            // TASK #6 STARTS HERE
            Row(
              children: <Widget>[
            Row(
              children: <Widget>[

              ],
              ],
            ),
            // TASK #6 ENDS HERE

            /*
            TASK #7 - DANNE URIEL BOISER
            TASK #7 - DANNE URIEL BOISER
            TODO: Create a Button that will process all data provided to the console.

            INSTRUCTIONS:
            >> Create a Button component that, when clicked, will display the username & password to the console
            >> Define your function however you like, either as a named function or lambda function.
             */

            // TASK #7 STARTS HERE
            ElevatedButton(
              onPressed: () {

              },
              child: const Text("Label here"),
            ),
            // TASK #8 STARTS HERE
          ],
        ),
      )
    );
  }
}
