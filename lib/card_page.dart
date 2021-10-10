import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/playing_card.dart';

class CardPage extends StatefulWidget {
  final GlobalKey<FlipCardState> cardKey;
  final PlayingCard property;
  final Function(PlayingCard?, GlobalKey<FlipCardState>, Function) onReverse;

  const CardPage(this.cardKey, this.property, this.onReverse, {Key? key}) : super(key: key);


  @override
  CardState createState() => CardState();
}

class CardState extends State<CardPage> {
  bool isOut = false;

  out() {
    setState(() {
      isOut = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isOut ? Container(
      width: 100,
      height: 100,
      color: Colors.white,
      child: const Center(
        child: Text("out"),
      ),
    ) : FlipCard(
      key: widget.cardKey,
      fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
      direction: FlipDirection.HORIZONTAL, // default
      front: Container(
        margin: const EdgeInsets.only(left: 1, right: 1),
        width: 100,
        height: 100,
        color: Colors.green,
        child: const Center(
          child: Text("click", textAlign: TextAlign.center),
        ),
      ),
      back: Center(
        // child: Text("$suit\nNumber $number", textAlign: TextAlign.center),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
              width: 20,
              height: 20,
              image: NetworkImage(widget.property.getImageURL()),
            ),
            Text(widget.property.number.toString()),
          ],
        ),
      ),
      onFlipDone: (isFront) {
        if (isFront && !isOut) {
         widget.onReverse(widget.property, widget.cardKey, out);
        }
      },
    );
  }
}