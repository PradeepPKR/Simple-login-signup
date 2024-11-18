import 'package:flutter/material.dart';
import 'main.dart';
import 'form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Add logic to logout here
              _showLogoutDialog(context);
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('User Profile'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                // Navigate to profile page
                Navigator.pop(context); // Close the drawer
                // Add logic to navigate to the profile page
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                // Close the drawer
                Navigator.pop(context);
                // Show logout confirmation dialog
                _showLogoutDialog(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 325,
            margin: EdgeInsets.all(30.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 175, 196, 241),
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: Color.fromARGB(255, 179, 179, 182),
                )),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Label 1',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                SizedBox(height: 8), // Space between labels
                Text(
                  'Label 2',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                SizedBox(height: 8), // Space between labels
                Text(
                  'Label 3',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context); // Close the dialog
          Navigator.popUntil(context,
              ModalRoute.withName('/')); // Navigate back to the initial route
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => form()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  // Function to show logout confirmation dialog
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Add logic to logout
                // For example, navigate to login page
                Navigator.pop(context); // Close the dialog
                Navigator.popUntil(
                    context,
                    ModalRoute.withName(
                        '/')); // Navigate back to the initial route
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}
