import 'package:blackjack/src/models/carta.dart';

abstract class Observer {
  void notifyChange(Carta carta) {}
}
