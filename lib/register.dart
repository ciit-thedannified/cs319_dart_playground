import 'package:email_validator/email_validator.dart';
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

  final _usernameField = TextEditingController();
  final _emailField = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                    controller: _usernameField, // assign a TextEditingController here.
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
            TODO: Create a TextField for 'email' here.

            INSTRUCTIONS:
            >> The text field must have its text label above, and is connected to its respective controller.
             */

            // TASK #5 STARTS HERE
            Wrap(
              children: <Widget>[
                const Text("E-mail"),
                TextField(
                  controller: _emailField,
                  decoration: const InputDecoration(
                    hintText: "example@me.com",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            // TASK #5 ENDS HERE

            /*
            TASK #6 - AGOS BORJA
            TODO: Create a TextField for 'password' here.

            INSTRUCTIONS:
            >> Similar to TASK #1, but build the code yourself.
            >> The TextField must have 'obscuredText' prop enabled; 'obscuringCharacter' prop must be asterisk (*)
             */

            // TASK #6 STARTS HERE
            const SizedBox(height: 16),

            // TASK #6 - Password TextField
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text('Password'),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        obscuringCharacter: '*',
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter password',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // TASK #6 ENDS HERE

            /*
            TASK #7 - DANNE URIEL BOISER
            TODO: Create a Button that will process all data provided to the console.

            INSTRUCTIONS:
            >> Create a Button component that, when clicked, will display the username & password to the console
            >> Define your function however you like, either as a named function or lambda function.
             */

            // TASK #7 STARTS HERE
            ElevatedButton(
              onPressed: () {
                if (!EmailValidator.validate(_emailField.text)) {
                  // Invalid e-mail address dialog.
                  showDialog(context: context, builder: (context) {
                    return AlertDialog(
                      title: const Text("Invalid e-mail address"),
                      content: const Text("Please enter a valid e-mail address."),
                      actions: [
                        TextButton(
                          child: const Text("CLOSE"),
                          onPressed: () {
                            return Navigator.of(context).pop();
                          },
                        )
                      ],
                    );
                  });

                  print("Username: ${_usernameField.text}");
                  print("E-mail: ${_emailField.text}");
                  print("Password: ${_passwordController.text}");
                }
              },
              child: const Text("Register"),
            ),
            // TASK #7 END HERE
          ],
        ),
      )
    );
  }
}
