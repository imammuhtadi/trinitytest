import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:trinitytest/data/models/user_model.dart';

class UserRepository {
  Future<List<UserModel>> getUsers() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await jsonDecode(response);
    return List<UserModel>.from(data.map((x) => UserModel.fromJson(x)));
  }
}
