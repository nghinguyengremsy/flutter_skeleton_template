import 'package:flutter/material.dart';

class HomeScreenPage extends StatefulWidget {
  HomeScreenPage({Key? key}) : super(key: key);

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const Text('Hello world.'),
      ),
    );
  }
}
