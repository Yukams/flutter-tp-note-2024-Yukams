import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Devine le nombre"),
      ),
      body: const Center(child: Text("TODO: display button to start a new game + display your name")) ,
    );
  }
}
