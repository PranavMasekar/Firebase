import 'package:flutter/material.dart';
import 'package:many_apps/Tik%20Tac%20Too%20Game/buttons.dart';
import 'package:many_apps/Tik%20Tac%20Too%20Game/dialog.dart';

class HomePageGame extends StatefulWidget {
  @override
  _HomePageGameState createState() => _HomePageGameState();
}

class _HomePageGameState extends State<HomePageGame> {
  late List<GameButton> buttonlist;
  var player1;
  var player2;
  var activeplayer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buttonlist = doInit();
  }

  void playGame(GameButton gb) {
    setState(() {
      if (activeplayer == 1) {
        gb.text = "X";
        gb.bg = Colors.red;
        activeplayer = 2;
        player1.add(gb.id);
      } else {
        gb.text = "O";
        gb.bg = Colors.black;
        activeplayer = 1;
        player2.add(gb.id);
      }
      gb.enabled = false;
      checkwinner();
    });
  }

  void checkwinner() {
    var winner = -1;
    if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
      winner = 2;
    }

    // row 2
    if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
      winner = 1;
    }
    if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
      winner = 2;
    }

    // row 3
    if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
      winner = 2;
    }

    // col 1
    if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
      winner = 2;
    }

    // col 2
    if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
      winner = 1;
    }
    if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
      winner = 2;
    }

    // col 3
    if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
      winner = 2;
    }

    //diagonal
    if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
      winner = 2;
    }

    if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
      winner = 2;
    }
    if (winner != -1) {
      if (winner == 1) {
        showDialog(
            context: context,
            builder: (_) => CustomDailog(resetGame, "Player1 won",
                "Press the reset button to start again"));
      } else {
        showDialog(
            context: context,
            builder: (_) => CustomDailog(resetGame, "Player2 won",
                "Press the reset button to start again"));
      }
    }
  }

  void resetGame() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      buttonlist = doInit();
    });
  }

  List<GameButton> doInit() {
    player1 = List;
    player2 = List;
    activeplayer = 1;
    var gamebutton = <GameButton>[
      GameButton(id: 1),
      GameButton(id: 2),
      GameButton(id: 3),
      GameButton(id: 4),
      GameButton(id: 5),
      GameButton(id: 6),
      GameButton(id: 7),
      GameButton(id: 8),
      GameButton(id: 9),
    ];
    return gamebutton;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Too"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.0,
            crossAxisSpacing: 9.0,
            mainAxisSpacing: 9.0),
        itemBuilder: (context, index) => GestureDetector(
          onTap: buttonlist[index].enabled
              ? () => playGame(buttonlist[index])
              : null,
          child: SizedBox(
            width: 100,
            height: 100,
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  buttonlist[index].text,
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              color: buttonlist[index].bg,
            ),
          ),
        ),
        itemCount: buttonlist.length,
      ),
    );
  }
}
