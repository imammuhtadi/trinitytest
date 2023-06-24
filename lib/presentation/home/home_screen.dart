import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trinitytest/presentation/create_user/create_user_screen.dart';
import 'package:trinitytest/provider/user/user_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late UserProvider _userProvider;

  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

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

  Future<dynamic> _refresh() async {
    await Future.delayed(const Duration(seconds: 1));
    return _userProvider.getUsers();
  }

  Widget _buildPage(BuildContext context) {
    final userState = Provider.of<UserProvider>(context).state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const CreateUserScreen(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _refresh,
        child: GridView.builder(
          padding: const EdgeInsets.all(16),
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: userState.users.length,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 26,
                    child: Text(
                      '${userState.users[index].firstName![0].toUpperCase()}${userState.users[index].lastName![0].toUpperCase()}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${userState.users[index].firstName} ${userState.users[index].lastName}',
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
