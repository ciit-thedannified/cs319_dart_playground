import 'package:flutter/material.dart';

//work list:
//Cedric - Layout based from given screenshot
//Keith -

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AboutPage(),
    );
  }
}


//Text Styles
const TextStyle headerStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
const TextStyle subHeaderStyle = TextStyle(fontSize: 18);
const TextStyle memberStyle = TextStyle(fontSize: 16);


class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.insert_photo, size: 50),
                ),
                const SizedBox(width: 16),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    //app name
                    Text('APP NAME', style: headerStyle),
                    Text('Version 1.0'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),


            // Source Code Button
            ElevatedButton(
              onPressed: () {
                // add functionality
              },


              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Source Code', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 20),

            // Developer Section
            const Text('Developers:', style: subHeaderStyle),
            const SizedBox(height: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('• Danne Uriel Boiser', style: memberStyle),
                Text('• Koji Miguel Escolar', style: memberStyle),
                Text('• Jan Carlo Pastor', style: memberStyle),
                Text('• Keith Christian Perdido', style: memberStyle),
                Text('• Cedric Joshua Palapuz', style: memberStyle),
                Text('• Agos Borja', style: memberStyle),
              ],
            ),
          ],
        ),
      ),


      //bottom navbar
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: SizedBox.shrink(), // Empty icon placeholder
            label: 'Tab Name',
          ),
          BottomNavigationBarItem(
            icon: SizedBox.shrink(), // Empty icon placeholder
            label: 'Tab Name',
          ),
          BottomNavigationBarItem(
            icon: SizedBox.shrink(), // Empty icon placeholder
            label: 'Tab Name',
          ),
          BottomNavigationBarItem(
            icon: SizedBox.shrink(), // Empty icon placeholder
            label: 'Tab Name',
          ),
          BottomNavigationBarItem(
            icon: SizedBox.shrink(), // Empty icon placeholder
            label: 'Tab Name',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}
