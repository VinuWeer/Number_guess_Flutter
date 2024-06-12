import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'my_button.dart';

class GameOverScreen extends StatelessWidget {
  final int secretNumber;

  const GameOverScreen({
    super.key,
    required this.secretNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 164, 196, 222),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white,),),
        title: const Text(
          'Guess Game',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Sorry Game Over.my secrect number is",
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          // Display the secret number
          Text(
            secretNumber.toString(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          //Display the secrect numbe

          MyButton(
            text: "Start the Game Again ",
            onpressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ));
            },
            color: Colors.blueAccent,
            textStyle: TextStyle(color: Colors.white),
          )
          //try Again button
        ],
      ),
    );
  }
}
