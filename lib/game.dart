import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Game extends StatefulWidget {
  const Game({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  var valueToFind = Random().nextInt(100);
  var nbTry = 10;
  var showGuessIsSuperiorMessage = false;
  var showGuessIsInferiorMessage = false;
  var showValueErrorMessage = false;

  final myController = TextEditingController();

  void onPressedButton() {
    var userValue = int.tryParse(myController.text);

    if (userValue == valueToFind) {
      context.go("/success");
    }


    if (userValue != null) {
      setState(() => nbTry = nbTry - 1);

      if(nbTry == 0) {
        context.go("/failure");
      }

      if (userValue < valueToFind) {
        setState(() => {
          showGuessIsInferiorMessage = true,
          showGuessIsSuperiorMessage = false,
          showValueErrorMessage = false
        });
      } else {
        setState(() => {
          showGuessIsInferiorMessage = false,
          showGuessIsSuperiorMessage = true,
          showValueErrorMessage = false
        });
      }
    } else {
      setState(() => {
        showGuessIsInferiorMessage = false,
        showGuessIsSuperiorMessage = false,
        showValueErrorMessage = true
      });
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Il reste $nbTry essais"),
              Container(
                width: 200,
                padding: const EdgeInsets.all(12),
                child: TextField(
                  controller: myController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ElevatedButton(onPressed: onPressedButton, child: const Text("Valider")
                )
              ),
              Visibility(
                visible: showGuessIsInferiorMessage,
                child: const Text("C'est plus !", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
              ),
              Visibility(
                visible: showGuessIsSuperiorMessage,
                child: const Text("C'est moins !", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
              ),
              Visibility(
                visible: showValueErrorMessage,
                child: const Text("Saisie invalide, merci d'écrire un nombre", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
              )
            ]
        ),
      ),
    );
  }
}
