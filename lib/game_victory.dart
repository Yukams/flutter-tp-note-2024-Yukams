import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GameVictory extends StatefulWidget {
  final String title;

  const GameVictory({Key? key, required this.title}) : super(key: key);

  @override
  State<GameVictory> createState() => _GameVictoryState();
}

class _GameVictoryState extends State<GameVictory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text("Vous avez trouvé le bon nombre", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),)
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text("Redémarrez une partie"),
            ),
          ],
        ),
      ),
    );
  }
}
