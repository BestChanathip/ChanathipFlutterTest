// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_chanathip/constants/colors.dart';
import 'package:test_chanathip/views/custom_widget/custom_user.dart';
import 'package:test_chanathip/viewsmodels/user_view_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserViewModel>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Test Chanathip'),
        backgroundColor: AppColors.primaryColor,
      ),
      body: FutureBuilder(
        future: null,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                itemCount: userViewModel.users.length,
                itemBuilder: (context, index) {
                  final user = userViewModel.users[index];
                  return CustomUser(
                      name:
                          '${user.name.title}.${user.name.first} ${user.name.last}',
                      gender: user.gender,
                      imgProfile: user.picture.large,
                      age: user.dob.age.toString(),
                      email: user.email,
                      phone: user.phone);
                },
              ),
            );
          }
        },
      ),
    );
  }
}
