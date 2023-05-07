import 'package:chat_gpt_02/Model/user.dart';
import 'package:chat_gpt_02/chat_screen.dart';
import 'package:chat_gpt_02/screens/profilepage.dart';
import 'package:chat_gpt_02/screens/settingspage.dart';
import 'package:chat_gpt_02/screens/signinpage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
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
    bloodgrp: 'A+',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                MaterialPageRoute(builder: (context) => HomePage());
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfilePage(
                              user: currentUser,
                            )));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SignInPage()));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('AI Medical Assistant'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ChatScreen()));
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
