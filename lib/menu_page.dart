import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Devine le nombre"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text("TAHON Valentin", style: TextStyle(fontSize: 32))
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/game');
              },
              child: const Text("Démarrez une partie"),
            ),
          ],
        ),
      ),
    );
  }
}
