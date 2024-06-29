
import 'package:calculator/sign_in.dart';
import 'package:flutter/material.dart';
import 'calculator.dart';
import 'sign_in.dart' as sign_in;
import 'sign_up.dart' as sign_up;
import 'screens/calculator.dart';
import 'sign_in.dart';
import 'sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey[900],
        primaryColor: Colors.blue[900],
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  void _onTabTapped(int index) {
    setState(() {
      _tabController.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My App"),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.login), text: 'Sign In'),
            Tab(icon: Icon(Icons.app_registration), text: 'Sign Up'),
            Tab(icon: Icon(Icons.calculate), text: 'Calculator'),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Sign In'),
              onTap: () {
                Navigator.pop(context);
                _onTabTapped(0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.app_registration),
              title: const Text('Sign Up'),
              onTap: () {
                Navigator.pop(context);
                _onTabTapped(1);
              },
            ),
            ListTile(
              leading: const Icon(Icons.calculate),
              title: const Text('Calculator'),
              onTap: () {
                Navigator.pop(context);
                _onTabTapped(2);
              },
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          sign_in.SignInScreen(),
          sign_up.SignUpScreen(),
          CalculatorScreen(),
        ],
      ),
    );
  }
}
