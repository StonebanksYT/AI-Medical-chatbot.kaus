import 'dart:io';

import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // declare variables to store the user data
  late String name;
  late String email;
  late String gender;
  late int age;
  late String phone;
  late String address;
  late int height;
  late String bloodgrp;
  late File _image;

   Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().getImage(
      source: source,
      maxWidth: 800,
      maxHeight: 800,
      imageQuality: 80,
    );
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // create form fields for each attribute
          TextFormField(
            decoration: InputDecoration(labelText: "Name"),
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Email"),
            onChanged: (value) {
              setState(() {
                email = value;
              });
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Gender"),
            onChanged: (value) {
              setState(() {
                gender = value;
              });
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Age"),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                age = int.parse(value);
              });
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Phone"),
            onChanged: (value) {
              setState(() {
                phone = value;
              });
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Address"),
            onChanged: (value) {
              setState(() {
                address = value;
              });
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Height (cm)"),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                height = int.parse(value);
              });
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Blood Group"),
            onChanged: (value) {
              setState(() {
                bloodgrp = value;
              });
            },
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // save the user data and navigate to the home page
              // you can implement this part according to your app's logic
            },
            child: Text("Sign Up"),
          ),
        ],
      ),
    );
  }
}
