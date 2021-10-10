import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:untitled/card_page.dart';
import 'package:untitled/playing_card.dart';

void main() {
  List<PlayingCard> cards = [];
  for (Suit suit in [Suit.club, Suit.diamond, Suit.heart, Suit.spade]) {
    for (int i = 1; i <= 12; i++) {
      cards.add(PlayingCard(suit, i));
    }
  }
  cards.shuffle(Random());
  runApp(MyApp(cards));
}

class MyApp extends StatelessWidget {
  final List<PlayingCard> cards;

  const MyApp(this.cards, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Concentration',
      theme: ThemeData(primarySwatch: Colors.brown),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('神経衰弱'),
          backgroundColor: Colors.orange,
        ),
        body: Board(cards),
      ),
    );
  }
}

class Before {
  final GlobalKey<FlipCardState> state;
  final PlayingCard card;
  final Function out;
  Before(this.state, this.card, this.out);
}

class Board extends StatelessWidget {
  final List<PlayingCard> cards;

  const Board(this.cards, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Before? before;
    return GridView.count(
      crossAxisCount: 12,
      childAspectRatio: 0.7,
      children: cards
          .map((card) {
            return CardPage(GlobalKey<FlipCardState>(), card, (card, key, out) {
              if (before != null) {
                if (before!.card.number == card!.number) {
                  out();
                  before!.out();
                } else {
                  // XXXX???
                  // sleep(const Duration(seconds:1));
                  before!.state.currentState!.controller!.reset();
                  key.currentState!.controller!.reset();
                }
                before = null;
              } else {
                before = Before(key, card!, out);
              }
            });
          })
          .toList(),
    );
  }
}
