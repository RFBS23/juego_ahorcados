import 'package:ahorcados/const/consts.dart';
import 'package:ahorcados/game/figuraWidget.dart';
import 'package:ahorcados/game/letrasOcultas.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  var characters = "abcdefghijklmnopqrstuvwxyz".toUpperCase();
  var word = "Fabri".toUpperCase();
  List<String> selectedChar = [];
  var tries = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Ahorcados: El Juego"),
        elevation: 0.0,
        //backgroundColor: Colors.greenAccent,
      ),
      body: Column(
        children: [
          //imagenes y letras
          Expanded(
            flex: 3,
              child: Column(
                children: [
                  // imagenes
                  Expanded(
                    flex: 4,
                    child: Stack(
                      children: [
                        figure(GameUI.hang, tries >= 0),
                        figure(GameUI.head, tries >= 1),
                        figure(GameUI.body, tries >= 2),
                        figure(GameUI.leftArm, tries >= 3),
                        figure(GameUI.rightArm, tries >= 4),
                        figure(GameUI.leftLeg, tries >= 5),
                        figure(GameUI.rightLeg, tries >= 6),
                      ],
                    ),
                  ),
                  //cajas donde pondran las letras
                  Expanded(
                    child: Container(
                      color: Colors.white10,
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: word
                          .split("")
                          .map(
                            (e) => letrasOcultas(
                              e, !selectedChar.contains(
                                e.toUpperCase()
                              ),
                            ),
                          ).toList(),
                      ),
                    )
                  ),
                ],
              ),
          ),
          // teclado
          Expanded(
            flex: 2,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  //espacios
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 6,
                  crossAxisCount: 7,
                  //fin espacios
                  children: characters.split("").map((e) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white30, //color de teclas
                      ),
                      onPressed: selectedChar.contains(e.toUpperCase()) ? null : (){
                        setState(() {
                          selectedChar.add(e.toUpperCase());
                          if(!word.split("").contains(e.toUpperCase())){
                            tries++;
                          }
                        });
                      },
                      child: Text(
                        e,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    );
                  }).toList(),
                ),
              )
          )
        ],
      ),
    );
  }
}
