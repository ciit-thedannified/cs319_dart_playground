import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PIN Code App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[200], // Light background
        textTheme: const TextTheme(titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 24), // Heading text style
        ),
      ),
      home: const SignInScreen(),
    );
  }
}

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();

  String _savedUsername = '';
  String _savedPin = '';
  bool _isSignedUp = false;

  void _signIn() {
    if (_usernameController.text == _savedUsername &&
        _pinController.text == _savedPin) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(changePin: _changePin, savedPin: _savedPin)),
      );
    } else {
      _showDialog('Sign In Failed', 'Incorrect username or PIN');
    }
  }

  void _signUp() {
    if (_usernameController.text.isNotEmpty &&
        _pinController.text.isNotEmpty &&
        _pinController.text.length == 4) {
      setState(() {
        _savedUsername = _usernameController.text;
        _savedPin = _pinController.text;
        _isSignedUp = true;
      });
      _usernameController.clear();
      _pinController.clear();
      _showDialog('Sign Up Successful', 'You can now sign in with your PIN.');
    } else {
      _showDialog('Sign Up Failed', 'Please enter a username and a 4-digit PIN.');
    }
  }

  void _changePin(String newPin) {
    setState(() {
      _savedPin = newPin;
    });
    _showDialog('Success', 'Your PIN has been changed successfully.');
  }

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          content: Text(message),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isSignedUp ? 'Sign In' : 'Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 10),
            Text(
              _isSignedUp ? 'Please sign in to continue' : 'Create an account to get started',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _pinController,
              decoration: InputDecoration(
                labelText: 'PIN Code (4 digits)',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                suffixIcon: const Icon(Icons.lock),
              ),
              obscureText: true,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(4),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                onPressed: _isSignedUp ? _signIn : _signUp,
                child: Text(_isSignedUp ? 'Sign In' : 'Sign Up'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Function(String) changePin;
  final String savedPin;

  HomeScreen({super.key, required this.changePin, required this.savedPin});

  final TextEditingController _currentPinController = TextEditingController();
  final TextEditingController _newPinController = TextEditingController();

  void _submitNewPin(BuildContext context) {
    if (_currentPinController.text == savedPin) {
      if (_newPinController.text.isNotEmpty && _newPinController.text.length == 4) {
        changePin(_newPinController.text);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('PIN changed successfully')),
        );
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter a valid 4-digit new PIN')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Current PIN is incorrect')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change PIN'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Please enter your current PIN to change to a new one:'),
            const SizedBox(height: 20),
            TextField(
              controller: _currentPinController,
              decoration: InputDecoration(
                labelText: 'Enter Current PIN',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              obscureText: true,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(4),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _newPinController,
              decoration: InputDecoration(
                labelText: 'Enter New 4-digit PIN',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              obscureText: true,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(4),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => _submitNewPin(context),
                child: const Text('Change PIN'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}