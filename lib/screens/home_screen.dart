import 'dart:math';
import 'package:flutter/material.dart';
import 'game_over_screen.dart';
import 'game_win_screen.dart';
import 'my_button.dart';
import 'try_again_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  final Random _random = Random();

  int? _secretNumber;
  int? _userGuess;
  int _attempts = 0;

  @override
  void initState() {
    super.initState();
    _secretNumber = _random.nextInt(10) + 1; // Generates a random secret number
  }

  void checkGuess() {
    // Check if userGuess is null or 0
    if (_userGuess == null || _userGuess == 0) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Please Enter a Number!"),
            actions: <Widget>[
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text(
                    "OK",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );
      return; // Stop further execution of the function
    }

    // Check if the user's guess is correct
    if (_userGuess == _secretNumber) {
      // Navigate to the Game Win page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GameWinScreen(
            secretNumber: _secretNumber!,
          ),
        ),
      );
    } else {
      // Increment the user attempts
      setState(() {
        _attempts++;
      });

      // Check if the user has more attempts left
      if (_attempts < 3) {
        // Navigate to the try again page
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const TryAgainScreen(),
          ),
        );
        _controller.text = ""; // Clear the text field
      } else {
        // Navigate to the game over page
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => GameOverScreen(secretNumber: _secretNumber!),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Colors.white), 
        backgroundColor: Colors.blue,
        title: const Text(
          'Guessing Game',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),

            // Image
            Image.asset(
              'assets/images/Man.png',
              width: 200,
              height: 200,
            ),

            const SizedBox(
              height: 30,
            ),

            // Text
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                'I have a secret number in my mind(1-10). You have 3 chances to guess it. Can you guess it?',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            // Number of Chances taken
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text('$_attempts  of 3 chances are taken'),
            ),

            const SizedBox(
              height: 30,
            ),

            // User input
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Number(1-10)',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) => setState(() {
                  _userGuess = int.tryParse(value);
                }),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            // No of Chances taken
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('$_attempts/3'),
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            // Button
              MyButton(
              text: "Submit",
              color: Colors.blue,
              onpressed: checkGuess,
              textStyle: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
