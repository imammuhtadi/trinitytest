import 'package:flutter/material.dart';
import 'package:trinitytest/data/models/user_model.dart';
import 'user_state.dart';

class UserProvider extends ChangeNotifier {
  final state = UserState();

  getUsers() async {
    var users = await state.userRepository.getUsers();
    state.users = users;
    notifyListeners();
  }

  createUser() async {
    var newUser = UserModel(
      firstName: state.firstNameController.text,
      lastName: state.lastNameController.text,
      email: state.emailController.text,
      dob: state.bithdayController.text,
    );
    state.users.add(newUser);
    state.firstNameController.clear();
    state.lastNameController.clear();
    state.emailController.clear();
    state.bithdayController.clear();
    notifyListeners();
  }
}
