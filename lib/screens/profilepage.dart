import 'dart:ffi';

import 'package:chat_gpt_02/Controller/usercontroller.dart';
import 'package:chat_gpt_02/screens/editprofile.dart';
import 'package:flutter/material.dart';
import 'package:chat_gpt_02/Model/user.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  final User user;
  ProfilePage({super.key, required this.user});

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  User get user => widget.user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Page"),
      ),
      body: Column(children: [
        Center(
          child: (user.imgurl != null)
              ? CircleAvatar(
                  radius: 60, backgroundImage: NetworkImage("${user.imgurl}"))
              : CircleAvatar(radius: 70, child: Icon(Icons.person, size: 60)),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(top: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTile(icon: Icons.person_outlined, text: user.name),
                  CustomTile(
                      icon: Icons.email_outlined, text: user.email as String),
                  CustomTile(
                      icon: Icons.phone_android_outlined, text: user.phone),
                  CustomTile(icon: Icons.man_4_outlined, text: user.gender),
                  CustomTile(
                      icon: Icons.calendar_month_outlined,
                      text: user.age.toString()),
                  CustomTile(icon: Icons.location_on, text: user.address),
                  CustomTile(
                      icon: Icons.height_outlined,
                      text: user.height.toString() + " cm"),
                  CustomTile(
                      icon: Icons.monitor_weight_outlined,
                      text: user.weight.toString() + " kg"),
                  user.bloodgrp != null
                      ? CustomTile(
                          icon: Icons.favorite, text: "${user.bloodgrp}")
                      : Container(),
                  SizedBox(height: 30),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    EditProfilePage(user: user)));
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              // color: Colors.purple[200],
                              gradient: LinearGradient(colors: [
                                Colors.blue.shade900,
                                Colors.purple.shade300
                              ]),
                              borderRadius: BorderRadius.circular(30)),
                          alignment: Alignment.center,
                          height: 50,
                          width: 200,
                          child: Text(
                            "Edit Profile",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}

class CustomTile extends StatelessWidget {
  IconData icon;
  String text;
  CustomTile({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black38, width: 1))),
      height: 60,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Icon(
          icon,
          size: 30,
        ),
        Container(
          width: 230,
          child: Text(
            text,
            style: TextStyle(fontSize: 20, color: Colors.grey[700]),
          ),
        ),
      ]),
    );
  }
}
