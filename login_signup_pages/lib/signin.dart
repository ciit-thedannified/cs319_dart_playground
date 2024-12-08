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

  // Added some new declarations for the extra layer of security and can be added to the register.dart file if needed.
  bool _isPasswordVisible = false; // Toggle password visibility
  String _passwordStrength = ''; // To display password strength

// Password Strength checker
  void _checkPasswordStrength(String password){
    if(password.length < 6){
      setState((){
        _passwordStrength = 'Weak';
      });
  } else if (password.length < 10){
    setState((){
      _passwordStrength = 'Medium';
    });
  } else{
    setState((){
      _passwordStrength = 'Strong';
    });
  }
}

  get blue => null;

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
                const Text("USERNAME"),
                TextField(
                  controller: _username, // assign a TextEditingController here.
                  showCursor: true, // optional, may be added or removed
                )
              ]
            ),
            // TASK #1 ENDS HERE

            /*
            TASK #2 - KOJI MIGUEL ESCOLAR
            TODO: Create a TextField for 'password' here.

            INSTRUCTIONS:
            >> Similar to TASK #1, but build the code yourself. (must be grouped in a 'Wrap' widget.
            >> In practice, widgets must always have a trailing comma (,) after writing the code.
            >> The TextField must have 'obscuredText' prop enabled; 'obscuringCharacter' prop must be asterisk (*)
             */

            // TASK #2 STARTS HERE
            Wrap(
              children: <Widget>[
                const Text ("PASSWORD"),
                TextField(
                  controller: _password,
                  obscureText: !_isPasswordVisible, // Toggle password Visibility
                  obscuringCharacter: '*', // Asterisk to hide characters
                  onChanged: (value) => _checkPasswordStrength(value), // Check password Strength 
                  decoration: InputDecoration( // InputDecoration will provide UI for the TextField
                    suffixIcon: IconButton( //Suffix Icon to toggle the password Visibility (Eye Icon)
                      icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      ), //toggle the password Visbility state when the icon is pressed
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                      });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'Strength: $_passwordStrength', // show password strength (Weak, Medium, Strong)
              style: TextStyle( // Change the text Color based on the password strength (Green = Strong, Medium = Orange, Red = Weak)
                color: _passwordStrength == "Strong" ? Colors.green : _passwordStrength == "Medium" ? Colors.orange : Colors.red,
              ),
            ),
            // TASK #2 ENDS HERE

            /*
            TASK #3 - KEITH CHRISTIAN PERDIDO
            TODO: Create a Button that will process all data provided to the console.
            
            INSTRUCTIONS:
            >> Create a Button component that, when clicked, will display the username & password to the console
            >> Define your function however you like, either as a named function or lambda function.
             */
            
            // TASK #3 STARTS HERE
            const SizedBox(height: 50),
            SizedBox(
              width: 150, //Width Size of the button
              height: 50, // Height of the button
           child:  ElevatedButton(
                onPressed: () {

                   print("Username:"+ _username.text); //Print Username to console
                   print("Password:"+_password.text); //Print Password to console

                },
                child: const Text("Login"),
             style: ButtonStyle( // Used to style the button
               backgroundColor: WidgetStateProperty.all(Colors.blue), // button color
               foregroundColor: WidgetStateProperty.all(Colors.white), //text color
              ),
             ),
            )

            // TASK #3 ENDS HERE
          ],
        )
      )
    );
  }
}
