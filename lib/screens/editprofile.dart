import 'package:chat_gpt_02/Model/user.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  final User user;
  EditProfilePage({required this.user});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // declare variables to store the user data
  late String name;
  late String email;
  late String gender;
  late int age;
  late String phone;
  late String address;
  late int? height;
  late String bloodgrp;
  late double? weight;

  @override
  void initState() {
    // initialize the variables with the user data passed from the profile page
    name = widget.user.name;
    email = widget.user.email as String;
    gender = widget.user.gender;
    age = widget.user.age;
    phone = widget.user.phone;
    address = widget.user.address;
    height = widget.user.height;
    bloodgrp = widget.user.bloodgrp as String;
    weight = widget.user.weight;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // create form fields for each attribute
          TextFormField(
            initialValue: name,
            decoration: InputDecoration(labelText: "Name"),
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
          ),
          TextFormField(
            initialValue: email,
            decoration: InputDecoration(labelText: "Email"),
            onChanged: (value) {
              setState(() {
                email = value;
              });
            },
          ),
          TextFormField(
            initialValue: gender,
            decoration: InputDecoration(labelText: "Gender"),
            onChanged: (value) {
              setState(() {
                gender = value;
              });
            },
          ),
          TextFormField(
            initialValue: age.toString(),
            decoration: InputDecoration(labelText: "Age"),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                age = int.parse(value);
              });
            },
          ),
          TextFormField(
            initialValue: phone,
            decoration: InputDecoration(labelText: "Phone"),
            onChanged: (value) {
              setState(() {
                phone = value;
              });
            },
          ),
          TextFormField(
            initialValue: address,
            decoration: InputDecoration(labelText: "Address"),
            onChanged: (value) {
              setState(() {
                address = value;
              });
            },
          ),
          TextFormField(
            initialValue: height.toString(),
            decoration: InputDecoration(labelText: "Height (cm)"),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                height = int.parse(value);
              });
            },
          ),
          TextFormField(
            initialValue: weight.toString(),
            decoration: InputDecoration(labelText: "Weight (kg)"),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                weight = double.parse(value);
              });
            },
          ),
          TextFormField(
            initialValue: bloodgrp,
            decoration: InputDecoration(labelText: "Blood Group"),
            onChanged: (value) {
              setState(() {
                bloodgrp = value;
              });
            },
          ),
          SizedBox(height: 16),
          ElevatedButton(
              child: Text("Save Changes"),
              onPressed: () {
                // save the changes and navigate back to the profile page
                User newUser = User(
                  id: widget.user.id,
                  name: name,
                  email: email,
                  password: widget.user.password,
                  gender: gender,
                  age: age,
                  phone: phone,
                  address: address,
                  height: height,
                  bloodgrp: bloodgrp,
                );
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
