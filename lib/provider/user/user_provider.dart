import 'package:flutter/material.dart';
import 'user_state.dart';

class UserProvider extends ChangeNotifier {
  final state = UserState();

   getUsers() async {
    var users = await state.userRepository.getUsers();
    state.users = users;
    notifyListeners();
  }
}
