import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(ScoreApp());
}

class ScoreApp extends StatelessWidget {
  const ScoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int number_left = 1;
  int number_right = 1;
  void predictScore() {
    setState(() {
      number_left = Random().nextInt(6) + 1;
      number_right = Random().nextInt(6) + 1;
    });
  }

  void reset() {
    setState(() {
      number_left = 0;
      number_right = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 57, 133, 219),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 99, 169, 250),
        title: Center(
            child: Text('Score Predictor',
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)))),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.restore_rounded),
      //   onPressed: (){},
      // ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 140,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  number_left.toString(),
                  style: TextStyle(
                      fontSize: 200, color: Color.fromARGB(255, 255, 228, 228)),
                ),
              ),
              Text(
                ':',
                style: TextStyle(
                    fontSize: 200, color: Color.fromARGB(255, 255, 228, 228)),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  number_right.toString(),
                  style: TextStyle(
                      fontSize: 200, color: Color.fromARGB(255, 255, 228, 228)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 80,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: predictScore,
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 54, 161, 210)),
                      child: Text(
                        'Predict',
                        style: TextStyle(fontSize: 26),
                      )),
                ),
                SizedBox(
                  width: 30,
                ),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: reset,
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 255, 156, 156)),
                      child: Text(
                        'Reset',
                        style: TextStyle(
                            fontSize: 28,
                            color: Color.fromARGB(255, 39, 31, 30)),
                      )),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 300,
              ),
              Text('Made with '),
              Icon(Icons.coffee_rounded),
              Text(' by Kaushal Yadav.'),
            ],
          ),
        ],
      ),
    );
  }
}
