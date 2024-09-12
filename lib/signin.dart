import 'package:flutter/material.dart';

void main() {
  runApp(const SignInApp());
}

// The root of the application
class SignInApp extends StatelessWidget {
  const SignInApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sign In Application",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const SignInPage(title: 'Sign In Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SignInPage extends StatefulWidget {
  const SignInPage({super.key, required this.title});

  final String title;

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final _username = TextEditingController();
  final _password = TextEditingController();

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
            TASK #1 - CEDRIC JOSHUA PALAPUZ
            TODO: Create a TextField for 'username' here.

            INSTRUCTIONS:
            >> The text field must have its text label above, and is connected to its respective controller.
            >> The code below must be the standard format:
            */

            // TASK #1 STARTS HERE
            Wrap(
              children: <Widget>[
                const Text("Username:"),
                TextField(
                  controller: _username,
                  showCursor: true,
                )
              ]
            ),
            // TASK #1 ENDS HERE

            /*
            TASK #2 - DANNE URIEL BOISER (SAMPLE)
            TODO: Create a TextField for 'password' here.

            INSTRUCTIONS:
            >> Similar to TASK #1, but build the code yourself. (must be grouped in a 'Wrap' widget.
            >> In practice, widgets must always have a trailing comma (,) after writing the code.
            >> The TextField must have 'obscuredText' prop enabled; 'obscuringCharacter' prop must be asterisk (*)
             */

            // TASK #2 STARTS HERE
            Wrap(
              children: <Widget>[
                const Text("Password:"),
                TextField(
                  controller: _password,
                  showCursor: true,
                  obscureText: true,
                  obscuringCharacter: '*',
                )
              ],
            ),

            // TASK #2 ENDS HERE

            /*
            TASK #3 - KEITH CHRISTIAN PERDIDO(SAMPLE)
            TODO: Create a Button that will process all data provided to the console.
            
            INSTRUCTIONS:
            >> Create a Button component that, when clicked, will display the username & password to the console
            >> Define your function however you like, either as a named function or lambda function.
             */
            
            // Under development 
            // TASK #3 STARTS HERE
            ElevatedButton(
                onPressed: () {//Comment sample
                   },
                child: const Text("Label here"),
            ),
            // TASK #3 ENDS HERE
          ],
        )
      )
    );
  }
}
