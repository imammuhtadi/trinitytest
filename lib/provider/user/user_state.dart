import 'package:flutter/material.dart';
import 'package:trinitytest/data/models/user_model.dart';
import 'package:trinitytest/data/repositories/remote/user_repository.dart';

class UserState {
  var userRepository = UserRepository();

  var users = <UserModel>[];

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var bithdayController = TextEditingController();

  UserState() {
    // constructor
  }
}
