class User {
  final String id;
  final String? imgurl;
  final String name;
  final String email;
  final String password;
  final String gender;
  final int age;
  final String phone;
  final String address;
  final int? height;
  final String? bloodgrp;
  final double? weight;

  User({
    required this.id,
    this.imgurl,
    required this.name,
    required this.email,
    required this.password,
    required this.gender,
    required this.age,
    required this.phone,
    required this.address,
    this.height,
    this.bloodgrp,
    this.weight,
  });
}
