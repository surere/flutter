import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

import 'cardspread.dart';

void main() => runApp(CardDrawApp());

class CardDrawApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Draw Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        hintColor: Colors.amber,
      ),
      home: CardSpreadPage(title: '낱말 카드'),
    );
  }
}

class CardSpreadPage extends StatefulWidget {
  CardSpreadPage({super.key, required this.title});
  final String title;

  @override
  _CardSpreadPageState createState() => _CardSpreadPageState();
}

class _CardSpreadPageState extends State<CardSpreadPage> {
  var randomEngine = Random.secure();
  bool _reveal = false;
  int _cardsSeed = 0;
  int _cardsCount = 6;
  late ShakeDetector _detector;

  @override
  void initState() {
    super.initState();
    _detector = ShakeDetector.autoStart(onPhoneShake: () {
      if (_reveal) {
        dealNewCards();
      } else {
        reveal();
      }
    });
  }

  void dealNewCards() {
    setState(() {
      _generateNewSeed();
    });
  }

  void setSpread(int spread) {
    setState(() {
      _cardsCount = spread;
      _generateNewSeed();
    });
  }

  reveal() {
    setState(() {
      _reveal = true;
    });
  }

  _generateNewSeed() {
    _cardsSeed = randomEngine.nextInt(1000000000);
    _reveal = false;
  }

  Widget buildCardsRow() {
    return CardSpread(
        key: ValueKey(_cardsSeed), spread: _cardsCount, reveal: _reveal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildCardsRow(),
              SizedBox(height: 20),
              _reveal == true
                  ? ElevatedButton (
                      onPressed: () {
                        dealNewCards();
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                      child: Text("Draw new cards", style: TextStyle(color: Theme.of(context).primaryColor),
                          )
                    )
                     : ElevatedButton (
                        onPressed: () {
                          reveal();
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                        child: Text("Reveal",
                            style: TextStyle(color: Theme.of(context).primaryColor))
                      ),
            ]),
      ),
    );
  }
}
