// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_chanathip/constants/colors.dart';

class CustomUser extends StatefulWidget {
  final String name;
  final String gender;
  final String imgProfile;
  final String age;
  final String email;
  final String phone;
  const CustomUser(
      {super.key,
      required this.name,
      required this.gender,
      required this.imgProfile,
      required this.age,
      required this.email,
      required this.phone});

  @override
  State<CustomUser> createState() => _CustomUserState();
}

class _CustomUserState extends State<CustomUser> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Center(
          child: Image.network(
            widget.imgProfile,
            height: 170,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name : ${widget.name}',
                style: TextStyle(color: AppColors.textDarkColor, fontSize: 16),
              ),
              Text(
                'Age : ${widget.age}',
                style: TextStyle(color: AppColors.textDarkColor, fontSize: 16),
              ),
              Text(
                'Gender : ${widget.gender}',
                style: TextStyle(color: AppColors.textDarkColor, fontSize: 16),
              ),
              Text(
                'Email : ${widget.email}',
                style: TextStyle(color: AppColors.textDarkColor, fontSize: 16),
              ),
              Text(
                'Phone : ${widget.phone}',
                style: TextStyle(color: AppColors.textDarkColor, fontSize: 16),
              ),
            ],
          ),
        )
      ],
    );
  }
}
