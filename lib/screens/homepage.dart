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
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                MaterialPageRoute(builder: (context) => HomePage());
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
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
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SettingsPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const SignInPage()));
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
              context, MaterialPageRoute(builder: (context) => const ChatScreen()));
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
