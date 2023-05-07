import 'dart:math';
import 'package:chat_gpt_02/Model/user.dart';
import 'package:chat_gpt_02/chat_screen.dart';
import 'package:chat_gpt_02/screens/editprofile.dart';
import 'package:chat_gpt_02/screens/profilepage.dart';
import 'package:chat_gpt_02/screens/settingspage.dart';
import 'package:chat_gpt_02/screens/signinpage.dart';
import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  User currentUser = User(
    id: '1',
    imgurl: "https://randomuser.me/api/portraits/men/1.jpg",
    name: 'John Doe',
    email: 'johndoe@example.com',
    password: '********',
    gender: 'Male',
    age: 30,
    phone: '1234567890',
    address: '123 Main St, Anytown, USA',
    height: 180,
    weight: 72,
    bloodgrp: 'A+',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(user: currentUser),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignInPage()),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('AI Medical Assistant'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, ${currentUser.name}!',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: (currentUser.weight == null)
                      ? InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfilePage(
                                          user: currentUser,
                                        )));
                          },
                          child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(64, 6, 192, 224),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    "Please fill your Weight",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ))))
                      : Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(64, 6, 192, 224),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Weight',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                LinearProgressIndicator(
                                  value: currentUser.weight! / 100,
                                  backgroundColor: Colors.white,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.blue.shade900),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '${currentUser.weight} kg',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: (currentUser.height == null)
                      ? InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfilePage(
                                          user: currentUser,
                                        )));
                          },
                          child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    "Please fill your Height",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ))))
                      : Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Height',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '${currentUser.height} cm',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
              ],
            ),
            SizedBox(height: 20),
            (currentUser.height == null || currentUser.weight == null)
                ? InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfilePage(
                                    user: currentUser,
                                  )));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.orange.shade100,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text('Please fill your height and weight',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )))))
                : Container(
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'BMI',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                (currentUser.weight! /
                                        (currentUser.height! /
                                            100 *
                                            currentUser.height! /
                                            100))
                                    .toStringAsFixed(2),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.3),
                          child: BmiProgressIndicator(user: currentUser),
                        )
                      ],
                    ),
                  ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Chat with bot'),
                    subtitle: Text('Chat with our AI chat expert'),
                    leading: Icon(Icons.chat_bubble),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('View Medical Records'),
                    subtitle: Text('View your medical history'),
                    leading: Icon(Icons.folder),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Book an Appointment'),
                    subtitle: Text('Schedule a doctor visit'),
                    leading: Icon(Icons.event),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BmiProgressIndicator extends StatelessWidget {
  final User user;
  const BmiProgressIndicator({required this.user});

  @override
  Widget build(BuildContext context) {
    // Calculate BMI category based on user's BMI
    String bmiCategory = "";
    double bmi = user.weight! / pow(user.height! / 100, 2);
    if (bmi < 18.5) {
      bmiCategory = "Underweight";
    } else if (bmi < 25) {
      bmiCategory = "Normal";
    } else if (bmi < 30) {
      bmiCategory = "Overweight";
    } else {
      bmiCategory = "Obese";
    }

    // Define colors for each BMI category
    Color color;
    switch (bmiCategory) {
      case "Underweight":
        color = Colors.yellow;
        break;
      case "Normal":
        color = Colors.green;
        break;
      case "Overweight":
        color = Colors.orange;
        break;
      case "Obese":
        color = Colors.red;
        break;
      default:
        color = Colors.grey;
    }

    return Stack(
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: CircularProgressIndicator(
            value: 1.0,
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation<Color>(color),
            strokeWidth: 6,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 35, 0, 0),
          child: Text(
            bmiCategory,
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
