enum Suit {
  spade,
  heart,
  diamond,
  club,
}



class PlayingCard {
  late Suit suit;
  late int number;

  PlayingCard(this.suit, this.number);

  @override
  String toString() {
    return "$suit, $number";
  }

  String getImageURL() {
    switch (suit) {
      case Suit.club:
        return "https://cdn.pixabay.com/photo/2012/05/07/18/37/club-48940_960_720.png";
      case Suit.spade:
        return "https://m.media-amazon.com/images/I/41svv+q6qxL._AC_SX425_.jpg";
      case Suit.heart:
        return "https://cdn.pixabay.com/photo/2012/05/07/18/37/heart-48942_1280.png";
      case Suit.diamond:
        return "https://previews.123rf.com/images/stefaninahill/stefaninahill1301/stefaninahill130100011/17531383-%E3%83%9D%E3%83%BC%E3%82%AB%E3%83%BC%E3%81%AE%E3%82%AB%E3%83%BC%E3%83%89%E3%81%AE%E3%82%B9%E3%83%BC%E3%83%84%E3%81%AE%E3%83%80%E3%82%A4%E3%83%A4%E3%83%A2%E3%83%B3%E3%83%89.jpg";
    }
    return "";
  }
}