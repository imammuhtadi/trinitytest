import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trinitytest/core/widget/edittext.dart';
import 'package:trinitytest/provider/user/user_provider.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  late UserProvider _userProvider;

  @override
  void initState() {
    super.initState();
    _userProvider = UserProvider();
    _userProvider.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => _userProvider,
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final userState = Provider.of<UserProvider>(context).state;

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 50.0),
              child: Center(child: CircleAvatar(radius: 46)),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text('Main Information', style: TextStyle(fontSize: 20)),
            ),
            const Divider(thickness: 1, height: 1),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                children: [
                  const SizedBox(width: 100, child: Text('First Name')),
                  Expanded(
                    child: Edittext(controller: userState.firstNameController),
                  ),
                ],
              ),
            ),
            const Divider(thickness: 1, indent: 16, height: 1),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                children: [
                  const SizedBox(width: 100, child: Text('First Name')),
                  Expanded(
                    child: Edittext(controller: userState.lastNameController),
                  ),
                ],
              ),
            ),
            const Divider(thickness: 1, indent: 16, height: 1),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text('Sub Information', style: TextStyle(fontSize: 20)),
            ),
            const Divider(thickness: 1, height: 1),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                children: [
                  const SizedBox(width: 100, child: Text('Email')),
                  Expanded(
                    child: Edittext(controller: userState.firstNameController),
                  ),
                ],
              ),
            ),
            const Divider(thickness: 1, indent: 16, height: 1),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                children: [
                  const SizedBox(width: 100, child: Text('DOB')),
                  Expanded(
                    child: Edittext(controller: userState.lastNameController),
                  ),
                ],
              ),
            ),
            const Divider(thickness: 1, height: 1),
          ],
        ),
      ),
    );
  }
}
