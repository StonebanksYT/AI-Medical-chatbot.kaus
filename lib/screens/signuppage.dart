import 'dart:io';
import 'package:chat_gpt_02/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  late double weight;
  late String bloodgrp;
  late File _image;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(
      source: source,
      maxWidth: 800,
      maxHeight: 800,
      imageQuality: 80,
    );
    if (pickedFile == Null) return;

    final imageTemporary = File(pickedFile!.path);
    setState(() => _image = imageTemporary);
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
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SafeArea(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                              leading: Icon(Icons.photo_library),
                              title: Text("Photo Library"),
                              onTap: () {
                                _pickImage(ImageSource.gallery);
                                Navigator.of(context).pop();
                              }),
                          ListTile(
                            leading: Icon(Icons.photo_camera),
                            title: Text("Camera"),
                            onTap: () {
                              _pickImage(ImageSource.camera);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    );
                  });
            },
            child: Text('Select Profile Picture'),
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
            decoration: InputDecoration(labelText: "Weight (kg)"),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                weight = double.parse(value);
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
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => homePage()));
            },
            child: Text("Sign Up"),
          ),
        ],
      ),
    );
  }
}
