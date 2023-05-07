import 'package:get/get.dart';
import '../model/user.dart';

class UserController extends GetxController {
  RxString text = "".obs;
  String name = "John De";
  String email = "johndoe@example.com";
  String password = "123456787";
  String gender = "male";
  int age = 99;
  String phone = "3983298";
  String address = "wz-283748";
  int height = 180;
  String bloodgrp = "a-";
  double weight = 70;
  void setText(String text) => text = text;

  void setName(String name) => name = name;
  void setEmail(String email) => email = email;
  void setPassword(String password) => password = password;
  void setGender(String gender) => gender = gender;
  void setAge(int age) => age = age;
  void setPhone(String phone) => phone = phone;
  void setAddress(String address) => address = address;
  void setHeight(int? height) => height = height;
  void setBloodgrp(String? bloodgrp) => bloodgrp = bloodgrp;
  void setWeight(double? weight) => weight = weight;
}
