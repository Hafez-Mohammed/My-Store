// ignore_for_file: prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:my_store/core/functions/check_internet.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  late bool res;
  internet() async{
    res = await checkInternetConnection();
    print(res);
  }
  @override
  void initState() {
    internet();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Test'),
      ),
      body: ListView(
        children: [
          
        ],
      ),
    );
  }
}
