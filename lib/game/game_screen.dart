import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:game_client/game/map.dart';
import 'package:game_client/game/path.dart';
import 'package:game_client/game/player.dart';
import 'package:game_client/routes.dart';
import 'package:game_client/wallet/wallet_connector.dart';
import 'package:get/get.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  static int numberInRow = 11;
  int numberOfSquares = numberInRow * 17;
  int player = numberInRow * 15 + 1;
  String direction = "right";

  void moveLeft() {
    if (!barriers.contains(player - 1)) {
      setState(() {
        player--;
      });
    }
  }

  void moveRight() {
    if (!barriers.contains(player + 1)) {
      setState(() {
        player++;
      });
    }
  }

  void moveUp() {
    if (!barriers.contains(player - numberInRow)) {
      setState(() {
        player -= numberInRow;
      });
    }
  }

  void moveDown() {
    if (!barriers.contains(player + numberInRow)) {
      setState(() {
        player += numberInRow;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 5,
              child: Container(
                child: GridView.builder(
                  itemCount: numberOfSquares,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: numberInRow,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    if (player == index) {
                      if (rooms.contains(index)) {
                        SchedulerBinding.instance.addPostFrameCallback((_) {
                          Get.toNamed(Routes.quiz);
                        });
                      }
                      return Player();
                    } else if (barriers.contains(index)) {
                      return Path(
                        innerColor: Colors.transparent,
                        outerColor: Colors.transparent,
                        texture: AssetImage('lib/images/tree.png'),
                        // child: Text(index.toString()),
                      );
                    } else {
                      if (rooms.contains(index)) {
                        return Path(
                          innerColor: Colors.yellow[800],
                          outerColor: Colors.yellow[900],
                          texture: AssetImage('lib/images/torii.png'),
                          // child: Text(index.toString()),
                        );
                      } else {
                        return Path(
                          innerColor: Colors.grey[800],
                          outerColor: Colors.grey[900],
                          texture: AssetImage('lib/images/road.png'),
                          // child: Text(index.toString()),
                        );
                      }
                    }
                  },
                ),
              )),
          Expanded(
              child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      child: Image.asset('lib/images/avatar.png'),
                      backgroundColor: Colors.transparent,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        WalletConnector.launchURL();
                      },
                      child: Text("Inventory"),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        iconSize: 40,
                        padding: EdgeInsets.all(0),
                        icon: const Icon(Icons.keyboard_arrow_up),
                        onPressed: () {
                          moveUp();
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          iconSize: 40,
                          padding: EdgeInsets.all(0),
                          icon: const Icon(Icons.keyboard_arrow_left),
                          onPressed: () {
                            moveLeft();
                          },
                        ),
                        const SizedBox(width: 48), // Add additional space between the left and right arrows
                        IconButton(
                          iconSize: 40,
                          padding: EdgeInsets.all(0),
                          icon: const Icon(Icons.keyboard_arrow_right),
                          onPressed: () {
                            moveRight();
                          },
                        ),
                      ],
                    ),
                    IconButton(
                      iconSize: 40,
                      padding: EdgeInsets.all(0),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      onPressed: () {
                        moveDown();
                      },
                    ),
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
