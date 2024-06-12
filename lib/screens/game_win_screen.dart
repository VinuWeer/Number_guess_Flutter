import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'my_button.dart';

class GameWinScreen extends StatelessWidget {
  final int secretNumber;

  const GameWinScreen({
    super.key,
    required this.secretNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 174, 230, 176),
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
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Guess Game',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Yes! you guessed it right.My secret number is",
            ),
          ),

          const SizedBox(
            height: 30,
          ),
          // display the secret number
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
          // Start new game button
          MyButton(
            text: "Start the Game Again",
            color: Colors.green,
            onpressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            ),
            textStyle: const TextStyle(color: Colors.white),
          ),

          
        ],
      ),
    );
  }
}
