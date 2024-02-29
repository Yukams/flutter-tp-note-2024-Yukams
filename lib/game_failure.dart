import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GameFailure extends StatefulWidget {
  final String title;

  const GameFailure({Key? key, required this.title}) : super(key: key);

  @override
  State<GameFailure> createState() => _GameFailureState();
}

class _GameFailureState extends State<GameFailure> {
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
                child: Text("Vous n'avez pas trouvé le bon nombre", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),)
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
