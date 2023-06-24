import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trinitytest/core/theme/app_color.dart';
import 'package:trinitytest/presentation/home/home_screen.dart';
import 'package:trinitytest/provider/user/user_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: AppColor.primary),
        home: const HomeScreen(),
      ),
    );
  }
}
