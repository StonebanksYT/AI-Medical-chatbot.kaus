class User {
  final String id;
  final String? imgurl;
  final String name;
  final String? email;
  final String password;
  final String gender;
  final int age;
  final String phone;
  final String address;
  final int height;
  final String? bloodgrp;

  User({
    required this.id,
    this.imgurl,
    required this.name,
    this.email,
    required this.password,
    required this.gender,
    required this.age,
    required this.phone,
    required this.address,
    required this.height,
    this.bloodgrp,
  });
}
