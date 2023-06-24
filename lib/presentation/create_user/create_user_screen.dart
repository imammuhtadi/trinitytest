import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trinitytest/core/string_extension.dart';
import 'package:trinitytest/core/widget/edittext.dart';
import 'package:trinitytest/provider/user/user_provider.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  late UserProvider userProvider;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                userProvider.createUser();
                Navigator.pop(context);
              }
            },
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  children: [
                    const SizedBox(width: 100, child: Text('First Name')),
                    Expanded(
                      child: Edittext(
                        controller: userProvider.state.firstNameController,
                        onChanged: ((value) =>
                            _formKey.currentState!.validate()),
                        validator: (val) {
                          if (!val!.isNotEmpty) {
                            return 'First name must not empty';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 1, indent: 16, height: 1),
              Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  children: [
                    const SizedBox(width: 100, child: Text('Last Name')),
                    Expanded(
                      child: Edittext(
                        controller: userProvider.state.lastNameController,
                        onChanged: ((value) =>
                            _formKey.currentState!.validate()),
                        validator: (val) {
                          if (!val!.isNotEmpty) {
                            return 'Last name must not empty';
                          }
                          return null;
                        },
                      ),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  children: [
                    const SizedBox(width: 100, child: Text('Email')),
                    Expanded(
                      child: Edittext(
                        controller: userProvider.state.emailController,
                        onChanged: ((value) =>
                            _formKey.currentState!.validate()),
                        validator: (val) {
                          if (!val!.isValidEmail) return 'Invalid email';
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 1, indent: 16, height: 1),
              Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  children: [
                    const SizedBox(width: 100, child: Text('DOB')),
                    Expanded(
                      child: Edittext(
                        controller: userProvider.state.bithdayController,
                        onChanged: ((value) =>
                            _formKey.currentState!.validate()),
                        validator: (val) {
                          if (!val!.isNotEmpty) {
                            return 'DOB must not empty';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 1, height: 1),
            ],
          ),
        ),
      ),
    );
  }
}
